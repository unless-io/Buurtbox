---
title: "Buurtbox v0.1 ontwikkelen voor de DACC Digitale Autonomie Unconference"
date: 2026-11-05T14:00:00+01:00
draft: false
description: "Hoe een unconference bij DACC Buurtbox in twee dagen van concept naar fysiek prototype bracht."
thumbnail: "images/posts/dacc-unconference/components.jpg"
---

Als onderdeel van het Buurtbox-project onderzoek ik bestaande projecten die raken aan weerbaarheid en autonomie. Zo kwam ik terecht bij het Digital Autonomy Competence Center (DACC).

<!--more-->

DACC helpt publieke instellingen om afscheid te nemen van Big Tech en over te stappen op lokale, autonome en open source alternatieven. Thematisch past dat uitstekend bij Buurtbox. Bij toeval stond er net een conferentie op de planning bij DACC:

De Digitale Autonomie Unconference.

Ik meldde me aan en begon na te denken over hoe ik me kon voorbereiden. Het unconference-concept begreep ik eerst niet helemaal. Wat hield het precies in?

Het idee blijkt simpel: iedereen die dat wil kan een idee pitchen, deelnemers stemmen op de sessies waar ze aan mee willen doen, en de sessie zelf is vrij van opzet.

Buurtbox zat nog in de conceptuele en plannende fase, en er was nog veel onbekend. Hardwarekeuzes, ontwerpkeuzes, welke data er eigenlijk op de box moet staan. Toch voelde ik dat ik meer indruk zou maken als ik iets fysieks mee kon nemen.

Dus zette ik mijn zinnen erop en begon aan het ontwerp van een prototype. De kern van het idee is een zeer draagbare, zuinige computer die aan een accupack met hoge capaciteit hangt en als server dient. Ik koos voor de volgende opstelling:

- Raspberry Pi 5 (8GB)
- SanDisk MicroSDXC Extreme 64GB
- Anker Prime Powerbank
- SanDisk Extreme Portable SSD 1TB
- IP65 waterdichte aansluitdoos
- Afstandhouders en kabels

![De hardwarecomponenten van Buurtbox: Raspberry Pi, SSD, powerbank en onderdelen van de behuizing.](/images/posts/dacc-unconference/components.jpg)

Toen de hardware binnen was, kostte het me ongeveer een dag om alles netjes in de behuizing te krijgen en een basisserver op de Raspberry Pi draaiend te krijgen. Ik flashte Raspberry Pi OS op de SanDisk-microSD en configureerde daarna SSH via mijn lokale netwerk.

De Raspberry Pi zit op hoge afstandhouders in de behuizing en de SSD ligt eronder. De powerbank zit aan de linkerkant.

Ik dacht dat ik een ruime behuizing had gekocht en dat alles er makkelijk in zou passen. In de praktijk was ik veel tijd kwijt aan het heen en weer schuiven van onderdelen. Ik had onvoldoende nagedacht over waar de poorten van de SSD, de Raspberry Pi en het accupack zitten. Daarnaast houden stroom- en datakabels niet van perfecte hoeken van 90 graden. Ik denk dat ik alles vier of vijf keer in elkaar heb gezet en weer uit elkaar heb gehaald.

Uiteindelijk was het geen echt probleem, gewoon Tetris met andere blokjes.

![Buurtbox v0.1 voor het eerst in elkaar gezet in de behuizing.](/images/posts/dacc-unconference/first-assembly.jpg)

Aan het eind van dag 1 had ik een apparaat draaien waarop ik kon inloggen via SSH en dat ik kon omtoveren tot hotspot. Als hotspot stuurde het gebruikers door naar een tijdelijk captive portal. Geweldig.

Dag 2 stond helemaal in het teken van software.

Ik verving het tijdelijke captive portal door een Rails-app die als dashboard fungeert. Die draait in Docker en start op zodra de Raspberry Pi stroom krijgt. Dit zou de thuisomgeving worden die we met allerlei diensten kunnen uitbreiden.

Natuurlijk werkte ik nog steeds met veel aannames. Welke data of diensten moeten er beschikbaar zijn op zo'n apparaat?

Het eerste wat ik opzette was Kiwix. Kiwix is een open source offline browser die .zim-bestanden leest. Er is veel data beschikbaar in .zim-formaat, en ik verwachtte dat dit het belangrijkste gebruik van de schijf van 1TB zou worden:

Een complete offline meertalige Wikipedia. Een brede selectie kaarten. Een grote medische database. Reparatiehandleidingen van iFixit.

Nu durfde ik het apparaat gerust Buurtbox te noemen.

Terwijl ik al die data uploadde, besefte ik snel dat 1TB enorm veel is. Er kan veel, veel meer op dit ding. Vindbaarheid van data, met goede zoekfunctionaliteit of een eenvoudige AI-assistent, wordt later een belangrijke functie.

Het was verleidelijk om de schijf verder te vullen, maar de tijd was beperkt en er moest nog meer gebeuren. Ik besloot nog een paar functies als applicaties toe te voegen. De Raspberry Pi met 8GB geheugen is krachtig genoeg om meerdere appservers te hosten.

Ik voegde PairDrop toe voor het uitwisselen van bestanden tussen apparaten op het netwerk, Kanboard voor open source kanban-workflows, en Nextcloud voor tools zoals agenda en contactbeheer. Elk draait in een eigen Docker-container.

Tot slot maakte ik alle diensten bereikbaar via het captive portal door ze met iframes in de Rails-app in te sluiten.

Als kers op de taart testte ik de hele opstelling met meerdere telefoons en laptops. Geen bugs, op wat UX-oneffenheden rond responsiviteit na.

Ik printte een paar simpele labels en sloot de dag af.

Buurtbox v0.1 is live.

De conferentiedag brak aan en ik bezocht het kantoor van AMS Institute op het Marineterrein in Amsterdam. De dag begon met een openingspresentatie. Het unconference-format werd kort uitgelegd en wie een sessie wilde hosten, kon zich voorstellen.

Ik was een van de deelnemers die een idee pitchte en werd ingedeeld bij de middaggroep.

In de ochtendgroep volgde ik een sessie over het aansturen van verandering richting autonomie vanuit een organisatie. Een erg interessante sessie met mensen uit een brede variëteit aan organisaties. De ochtend vloog voorbij, daarna was er een korte lunch voordat de volgende sessies begonnen.

Ik pitchte de vraag: hoe lokaal moet iets zijn om als autonoom te kunnen gelden?

Een aantal deelnemers sloot aan en de sessie ging van start.

Ik gebruikte Buurtbox als vertrekpunt voor de discussie en kreeg veel nuttige vragen. Op dit moment is Buurtbox gepositioneerd als een lokale databackup voor gemeenschappen, die bereikbaar blijft tijdens een totale black-out.

Een aantal deelnemers merkte op dat een vergelijkbaar idee ook relevant kan zijn voor bedrijven, als manier om diensten beschikbaar te houden wanneer systemen uitvallen. Van daaruit onderzochten we waar een hub als deze past en waar niet.

Voor grote organisaties concludeerden we dat een grotere lokale back-upinfrastructuur logischer is, zoals on-prem servers in combinatie met noodgeneratoren. Buurtbox is meer geschikt voor de schaal van een buurt.

Daarna zoomden we weer uit naar de kernvraag. Betekent autonomie dat je alles in hetzelfde gebouw hebt staan, of is het genoeg om dingen nationaal te organiseren, of in ons geval binnen de EU?

We kwamen niet uit op één definitief antwoord, en ik denk ook niet dat dat bestaat. Autonomie voelt minder als een vaste grens en meer als een spectrum. Elke stap dichter bij huis geeft meer controle, maar ook meer verantwoordelijkheid.

![Sessiediscussie tijdens de DACC Digitale Autonomie Unconference. Foto: DACC.](/images/posts/dacc-unconference/dacc-session.jpg)

Terug in de presentatieruimte gaf elke groep een korte terugkoppeling, en daarmee was de dag afgerond.

Ik vertrok met een hoofd vol nieuwe vragen en een hoop waardevolle feedback voor Buurtbox. Een fysiek prototype bleek een geweldige gespreksstarter.

Nu is het tijd om die gesprekken om te zetten in de volgende versie.

![Borrel na afloop van de DACC Digitale Autonomie Unconference. Foto: DACC.](/images/posts/dacc-unconference/dacc-drinks.jpg)

*Fotoverantwoording: de twee conferentiefoto's hierboven zijn van het Digital Autonomy Competence Center (DACC).*