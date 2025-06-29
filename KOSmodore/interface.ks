@lazyglobal off.

run once "/KOSmodore/globals.ks".

global lind to 0.           //selezione della lista di cose
global Npage to 0.
global li to list().        // lista per il menu scorrevole
global selcolumn to -1.     // datasource selezionata
                            // -1: non ci sono sorgenti
							// 1: prima sorgente impostata
							// 2: seconda sorgente...
global maxcolumn to 0.      // numero di colonne disponibili
//global li to list().                           // lista per il menu scorrevole

//dice al sistema qual è la pagina corrente e prepara lo schermo spingendo il cursore lontano

// PAGES 
//  0         splash (dalla release 1 durerà un secondo e i tasti permetteranno easter egg e funzioni nascoste - per esempio visualizzare in numero di pagina. dopo quel secondo si passerà alla pagina 1)

//  1         main page

//  20        Rover page

//  30        Track page
//  31        selezione e carica track da file
//  32        track view
//  33        save track 0
//  34        save track 1
//  35        save track 2

//  40        Logbook 
//  41        Logbook 1 write
//  42        Logbook 2 write
//  43        Logbook 3 write

//  50        Destination
//  51        selezione e carica destinazione da file
//  52        save destination 0
//  53        save destination 1
//  54        save destination 2
//  55        type d. latitude
//  56        type d. longitude

//  70        datalog page
//  71        carica datalog da file
//  72        data log view
//  75        seleziona data sources
//  76        add data source da lista
//  77        del data source da lista
//  83        save datalog 0
//  84        save datalog 1
//  85        save datalog 2

//  100       Settings
//  101       type marker thickness
//  102       type Data sampling time interval
//  103       type Track sampling time interval


function EscSaveFile {
	if NPage = 52 or NPage = 53 or NPage = 54 {
		DestinationsPAGE().
	}
	if NPage = 33 or NPage = 34 or NPage = 35 {
		TrackPAGE().
	}
	if NPage = 83 or NPage = 84 or NPage = 85 {
		TrackPAGE().
	}
}

function TypeRealNumAccept {     //tipico caso in cui l'ordine degli if conta
	if Npage = 56 {
		set INPstr2 to linea.
		set linea to "".       
		GPSPOS:clear.
		GPSPOS:add(INPstr1:tonumber(-9999)). //se non è un numero valido 	restituisce -9999
		GPSPOS:add(INPstr2:tonumber(-9999)).		
		DestinationsPAGE().
    }
	if Npage = 55 {
		set INPstr1 to linea.
		set linea to "".
		TypeRealNum(56,"Type longitude: ",2, false).
	}
	if Npage = 101 {
		set INPstr1 to linea.
		set linea to "".
		set SettingsL[0] to INPstr1:tonumber(-9999).
		SettingsPage().
	}
	if Npage = 102 {
		set INPstr1 to linea.
		set linea to "".
		set SettingsL[1] to INPstr1:tonumber(-9999).
		SettingsPage().
	}
	if Npage = 103 {
		set INPstr1 to linea.
		set linea to "".
		set SettingsL[2] to INPstr1:tonumber(-9999).
		SettingsPage().
	}
}

function TypeRealNumCancel {     //tipico caso in cui l'ordine degli if conta
	if Npage = 55 {
		DestinationsPAGE().
    }
	if Npage = 56 {
		DestinationsPAGE().
	}
	if Npage = 101 {
		SettingsPage().
	}
	if Npage = 102 {
		SettingsPage().
	}
	if Npage = 103 {
		SettingsPage().
	}
}

function SPage{
	parameter p.
	clearscreen.
	FROM {               //porta il cursore dove non lo vede nessuno
		local xx is 1.
	}
	UNTIL xx = 18 STEP {
		set xx to xx+1.
	} 
	DO {
		print " ".
	}
	print "P" + p at(36,16).
		set Npage to p.
}

function SPageTile{
	parameter p,title.
	clearscreen.
	  print "[#DFDFDF]" + title.
	FROM {               //porta il cursore dove non lo vede nessuno
		local xx is 1.
		}
	UNTIL xx = 17 STEP {
		set xx to xx+1.
	} 
	DO {
		print " ".
	}
	print "P" + p at(36,16).
	set Npage to p.
}

function SPageNoClear{
	parameter p.
	print "P" + p at(36,16).
	set Npage to p.
}


function ruler {
	FROM {
		local xx is 1.
		}
	UNTIL xx = 17 STEP {
		set xx to xx+1.
	} 
	DO {
		print "- " + xx at (0,xx).
	}
}

function listafile {   //stampa una lista selezionalible di file
	parameter li.
	//global li to LIST().
	local cou to 0.
 
	FOR bod in li {
		PRINT "   " + bod:name + " " + bod:size at(0,cou).
		set cou to cou + 1.
	}
	if lind > cou-1 {
		set lind to 0.
	}
	if lind < 0 {
		set lind to cou-1.
	}
	print ">" at(1,lind). 
}

function listastr {   //stampa una lista selezionalible di stringhe
	parameter lis.
	//global li to LIST().
	local cou to 0.
 
	FOR bod in lis {
		PRINT "  " + bod at(0,cou).
		set cou to cou + 1.
	}
	if lind > cou-1 {
		set lind to 0.
	}
	if lind < 0 {
		set lind to cou-1.
	}
	print ">" at(1,lind). 
}

function ListaFileDown{
	//if (Npage = 10) or (Npage = 11) or (Npage = 51) {
		set lind to lind +1.
		listafile(li).
}

function ListaFileUp{
	//if (Npage = 10 ) or (Npage = 11) or (Npage = 51) {
		set lind to lind -1.
		listafile(li).
}

function ListaStrDown{
	//if (Npage = 10) or (Npage = 11) or (Npage = 51) {
		parameter li.
		set lind to lind +1.
		listaStr(li).
}

function ListaStrUp{
	//if (Npage = 10 ) or (Npage = 11) or (Npage = 51) {
		parameter li.
		set lind to lind -1.
		listaStr(li).
}


// sistema deprecato: fare una funzionae per ogni if
function EnterListselect{
	if Npage = 51 {
		set GPSPOS TO READJSON("/KOSmodore/positions/" + li[lind]).
		DestinationsPAGE().
	}
	if Npage = 31 {
		set LoadedTrack TO READJSON("/KOSmodore/tracks/" + li[lind]).
		TrackPAGE().
	}
	if Npage = 71 {
		set SensLog TO READJSON("/KOSmodore/sampling/" + li[lind]).
		
		
		//reimposta la lista risorse in accordo col file caricato
		local co to 0.
		DataSourcesAdded:clear.
		FOR ds in SensLog[0] {
			//print DSname(ds) + " (" + ds + ")" at(0,co).
			if co > 0 {
				DataSourcesAdded:add(ds).
				print DSname(ds) at(0,co+5).
			}
			set co to co + 1.
		}
		
		SamplePAGE().
	}
	if Npage = 76 {
		set DataSourcesAdded to AddIfNoItem(DataSourcesAdded,DataSources[lind]).
		DataSourcePage().
	}
	if Npage = 77 {
		set DataSourcesAdded to SubItem(DataSourcesAdded,DataSourcesAdded[lind]).
		DataSourcePage().
	}
}

function PrevColumn {
	if selcolumn > 1 {
		set selcolumn to selcolumn - 1.
		ViewDataLogSource(selcolumn).
	}
}
	
function NextColumn {
	if (selcolumn < maxcolumn) and not(selcolumn = -1) {
		set selcolumn to selcolumn + 1.
		ViewDataLogSource(selcolumn).
	}
}


