<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- iWlz 2.1 version 1.9.18 (2020-01-24) -->
	<xsl:import href="../../../common/2_0/basis.xsl"/>

	<xsl:template match="*" mode="getDetails" priority="1">
		<xsl:param name="pRule">FOUT</xsl:param>
		<xsl:choose>
			<xsl:when test="$pRule='CD004'">Alleen als Leveringsvorm de waarde 4 (Verblijf) heeft, is vullen toegestaan.</xsl:when>
			<xsl:when test="$pRule='CD005'">Als Postcode gevuld is, dan verplicht vullen, anders leeg laten.</xsl:when>
			<xsl:when test="$pRule='CD007'">Als Communicatie / Vorm de waarde 1 (tolk taal) heeft, dan verplicht vullen, anders leeglaten.</xsl:when>
			<xsl:when test="$pRule='CD009'">Alleen als Soort adres de waarde 04 (tijdelijk adres) heeft, is vullen toegestaan.</xsl:when>
			<xsl:when test="$pRule='CD016'">Als Soort relatie een waarde ongelijk 12 (partner) heeft, dan verplicht vullen.</xsl:when>
			<xsl:when test="$pRule='CD017'">Als Soort relatie de waarde 12 (partner) heeft, dan verplicht vullen.</xsl:when>
			<xsl:when test="$pRule='CD020'">Als Mutatiecode de waarde 17 (overplaatsing) of 21 (overdracht) heeft, dan verplicht vullen, anders leeg laten.</xsl:when>
			<xsl:when test="$pRule='CD022'">Als Functiecode de waarde 64 (BH-GRP) of 82 (BG-GRP) heeft, dan verplicht vullen, anders leeg laten.</xsl:when>
			<xsl:when test="$pRule='CD023'">Als BOPZ / Verklaring de waarde 1 (Opname op basis van artikel 60 is aan de orde) bevat, dan verplicht vullen, anders leeg laten.</xsl:when>
			<xsl:when test="$pRule='CD025'">Als Adres / LandCode de waarde NL (Nederland) heeft, dan verplicht vullen.</xsl:when>
			<xsl:when test="$pRule='CD029'">Verplicht vullen, tenzij de Indicatie leeg is (negatief indicatiebesluit) of uitsluitend een Zorgzwaartepakket met Zzpcode 999 (ZZP0) bevat, dan is leeglaten toegestaan.</xsl:when>
			<xsl:when test="$pRule='CD034'">Als Soort adres de waarde 1 (BRP-adres) of 3 (verblijfadres) heeft, dan verplicht vullen.</xsl:when>
			<xsl:when test="$pRule='CD036'">Alleen als LandCode de waarde NL (Nederland) heeft, is vullen toegestaan.</xsl:when>
			<xsl:when test="$pRule='CD040'">Als Leveringsvorm de waarde 2 (PGB) bevat, dan leeglaten, anders verplicht vullen.</xsl:when>
			<xsl:when test="$pRule='CD047'">Als Doelmatig de waarde 2 (Nee) heeft, dan BijzondereSituatie verplicht vullen.</xsl:when>
			<xsl:when test="$pRule='CD048'">Als ExtraKostenThuis en ToeslagBeademing niet gevuld zijn, dan verplicht vullen, anders leeg laten.</xsl:when>
			<xsl:when test="$pRule='CD050'">Als leveringsvorm de waarde 7 (MPT) heeft, dan verplicht vullen, anders leeg laten.</xsl:when>
			<xsl:when test="$pRule='CD051'">Als Leveringsvorm de waarde 4 (Verblijf) of 5 (VPT) heeft, dan verplicht vullen, anders leeglaten.</xsl:when>
			<xsl:when test="$pRule='CD052'">Als leveringsvorm de waarde 4 (Verblijf) of 8 (DTV) heeft, dan verplicht vullen, anders leeglaten.</xsl:when>
			<xsl:when test="$pRule='CD054'">Als StatusAanlevering de waarde 1 (eerste aanlevering) of 2 (gewijzigde aanlevering) heeft, dan verplicht vullen.</xsl:when>
			<xsl:when test="$pRule='CD070'">Als WzdVerklaring de waarde 1 (Opname op basis van artikel 21 is aan de orde) bevat, dan verplicht vullen, anders leeg laten.</xsl:when>
			<xsl:when test="$pRule='CD071'">Als Leveringsvorm de waarde 4 (Verblijf) of 5 (VPT) heeft en Startdatum is kleiner of gelijk aan 31-12-2019, dan verplicht vullen, anders leeglaten.</xsl:when>
			<xsl:when test="$pRule='CD072'">Als Leveringsvorm de waarde 8 (DTV) heeft, dan verplicht vullen, anders leeglaten.</xsl:when>
			<xsl:when test="$pRule='CD073'">Als Leveringsvorm de waarde 4 (Verblijf), 5 (VPT) of 8 (DTV) heeft, dan verplicht vullen, anders leeglaten.</xsl:when>
			<xsl:when test="$pRule='CD074'">Als Leveringsvorm de waarde 7 (MPT) of 8 (DTV) heeft, dan verplicht vullen, anders leeglaten.</xsl:when>
			<xsl:when test="$pRule='CS002'">De waarde moet voldoen aan de 11-proef.</xsl:when>
			<xsl:when test="$pRule='CS003'">Indien van toepassing vullen met een waarde die groter is dan, of gelijk is aan de Begindatum (of Ingangsdatum) van de aangeduide periode.</xsl:when>
			<xsl:when test="$pRule='CS004'">Aaneengesloten vullen (zonder punten of spaties).</xsl:when>
			<xsl:when test="$pRule='CS005'">Aaneengesloten vullen met cijfers.</xsl:when>
			<xsl:when test="$pRule='CS012'">Vullen conform opgegeven codelijst.</xsl:when>
			<xsl:when test="$pRule='CS014'">Vullen met een waarde die hoort bij de waarde van Diagnosecodelijst.</xsl:when>
			<xsl:when test="$pRule='CS015'">BerichtSubversie vullen met 0.</xsl:when>
			<xsl:when test="$pRule='CS023'">Vullen met een bestaande datum die niet groter is dan de Dagtekening van het bestand.</xsl:when>
			<xsl:when test="$pRule='CS025'">BerichtVersie vullen met 5.</xsl:when>
			<xsl:when test="$pRule='CS035'">3 (gescheiden) en 6 (gescheiden geregistreerd partner) niet vullen.</xsl:when>
			<xsl:when test="$pRule='CS050'">Als Partnernaam gevuld is, dan NaamGebruik vullen met waarde 1, 2, 3 of 4. Anders waarde 1 vullen.</xsl:when>
			<xsl:when test="$pRule='CS057'">Als StatusAanlevering in alle onderliggende producten de waarde 3 (verwijderen aanlevering) heeft, dan 9 (niet van toepassing (ongewijzigd)) vullen, anders 1 (eerste aanlevering) vullen.</xsl:when>
			<xsl:when test="$pRule='CS058'">1 (eerste aanlevering) of 3 (verwijderen aanlevering) vullen.</xsl:when>
			<xsl:when test="$pRule='CS062'">1 (actief wachtend), 3 (niet wachtend) of 4 (in zorg) vullen.</xsl:when>
			<xsl:when test="$pRule='CS064'">Vullen met een bestaande datum die niet in de toekomst ligt.</xsl:when>
			<xsl:when test="$pRule='CS067'">19 (levering is beeindigd - zorgtoewijzing intrekken), of 20 (levering is beeindigd - zorgtoewijzing open laten) vullen.</xsl:when>
			<xsl:when test="$pRule='CS069'">Eerste twee posities moet de waarde 01 (huisartsen) bevatten.</xsl:when>
			<xsl:when test="$pRule='CS072'">5 (administratief) niet vullen.</xsl:when>
			<xsl:when test="$pRule='CS074'">'KE4', 'KE5', 'KE6' of 'KE7' vullen.</xsl:when>
			<xsl:when test="$pRule='CS088'">Vullen met een datum die kleiner is dan de Begindatum.</xsl:when>
			<xsl:when test="$pRule='CS089'">Als LandCode de waarde NL (Nederland) heeft, dan moet het formaat overeenkomen met dat van een Nederlandse postcode.</xsl:when>
			<xsl:when test="$pRule='CS092'">Vullen met een datum die groter is dan, of gelijk is aan de Ingangsdatum.</xsl:when>
			<xsl:when test="$pRule='CS093'">Vullen met een datum die groter is dan, of gelijk is aan de Begindatum (indien deze is gevuld).</xsl:when>
			<xsl:when test="$pRule='CS107'">1 (vervoer nodig) of 2 (vervoer niet nodig) vullen.</xsl:when>
			<xsl:when test="$pRule='CS108'">Vullen met een waarde die groter is dan, of gelijk is aan de Begindatum van de aangeduide periode én die niet groter is dan de Dagtekening van het bericht.</xsl:when>
			<xsl:when test="$pRule='CS113'">1 (CIZ indicatie) of 4 (Experimenten) vullen.</xsl:when>
			<xsl:when test="$pRule='CS118'">Als LandCode de waarde NL (Nederland) heeft, dan uitsluitend het numerieke deel (de 4 cijfers) van een Nederlandse postcode invullen.</xsl:when>
			<xsl:when test="$pRule='CS123'">25 (Wijkcoach) niet vullen.</xsl:when>
			<xsl:when test="$pRule='CS124'">Vullen met een datum die groter is dan, of gelijk is aan de Startdatum</xsl:when>
			<xsl:when test="$pRule='CS125'">Vullen met '1' (eerste aanlevering), '2' (wijzigen aanlevering) of '3' (verwijderen aanlevering) vullen.</xsl:when>
			<xsl:when test="$pRule='CS126'">Vullen met BerichtCode volgens de specificatie</xsl:when>
			<xsl:when test="$pRule='CS127'">2 (Persoons gebonden budget (PGB)) niet vullen</xsl:when>
			<xsl:when test="$pRule='CS128'">Vullen met een versienummer bestaande uit drie gehele getallen, gescheiden met punten.</xsl:when>
			<xsl:when test="$pRule='CS129'">Vullen in hele procenten</xsl:when>
			<xsl:when test="$pRule='CS130'">Vullen in hele procenten, tenzij de leveringsvorm de waarde 2 (PGB) bevat.</xsl:when>
			<xsl:when test="$pRule='TR002'">Geboortedatum mag niet meer dan 120 jaar voor de Dagtekening liggen.</xsl:when>
			<xsl:when test="$pRule='TR004'">Als er een huishouden met partner is, moet de partner als relatie worden opgenomen.</xsl:when>
			<xsl:when test="$pRule='TR005'">Als Afgiftedatum in de Indicatie groter is dan 1 maart 2007 en Soort van de Relatie de waarde 12 (partner) heeft, dan moeten in het Adres Huisnummer en Postcode gevuld zijn.</xsl:when>
			<xsl:when test="$pRule='TR006'">De berichtklasse Contact moet een berichtelement Telefoon, en/of de combinatie Huis en Postcode bevatten.</xsl:when>
			<xsl:when test="$pRule='TR008'">De Klasse moet horen bij de betreffende FunctieCode</xsl:when>
			<xsl:when test="$pRule='TR010'">Opslag mag niet gevuld zijn als Klasse de waarde '99' bevat of Klasse niet de maximum waarde bevat.</xsl:when>
			<xsl:when test="$pRule='TR014'">De grootste Einddatum van een geïndiceerde zorgeenheid moet samenvallen met Einddatum in de Indicatie.</xsl:when>
			<xsl:when test="$pRule='TR015'">De kleinste Ingangsdatum van een geïndiceerde zorgeenheid moet samenvallen met Ingangsdatum in de Indicatie.</xsl:when>
			<xsl:when test="$pRule='TR016'">De geldigheidsduur van de zorgtoewijzing moet vallen binnen de geldigheidsduur van de indicatie.</xsl:when>
			<xsl:when test="$pRule='TR017'">Begindatum en (indien van toepassing) Sleuteldatum van een geleverde zorgeenheid moeten vallen binnen de geldigheidsduur van de zorgtoewijzing.</xsl:when>
			<xsl:when test="$pRule='TR018'">Indien Begindatum in een MutatieZorgzwaartepakket of MutatieFunctie gevuld is, moet Mutatiedatum groter dan of gelijk zijn aan deze Begindatum.</xsl:when>
			<xsl:when test="$pRule='TR019'">De melding aanvang zorg of de mutatie moet gerelateerd zijn aan een zorgtoewijzing (op basis van de sleutelvelden).</xsl:when>
			<xsl:when test="$pRule='TR020'">Mutatiedatum per geleverde zorgeenheid mag niet voorbij de Einddatum van de bijbehorende toewijzing liggen.</xsl:when>
			<xsl:when test="$pRule='TR021'">Voor iedere client geldt dat er minimaal één toegewezen zorgeenheid moet zijn waarbij Instelling hoort bij Ontvanger.</xsl:when>
			<xsl:when test="$pRule='TR034'">Opslag mag niet gevuld zijn als Functiecode de waarde ' 71' (verblijf tijdelijk) bevat.</xsl:when>
			<xsl:when test="$pRule='TR035'">Wanneer eenzelfde zorgeenheid meer dan één keer is geindiceerd, mogen de geldigheidsduren behorend bij deze zorgeenheden elkaar niet overlappen.</xsl:when>
			<xsl:when test="$pRule='TR037'">Bij een Indicatie komt in ieder geval een zorgeenheid (GeindiceerdeFunctie of GeindiceerdZorgzwaartepakket) voor.</xsl:when>
			<xsl:when test="$pRule='TR039'">Bij een Client in een AW35 komt in ieder geval één geleverde zorgeenheid (GeleverdeFunctie of GeleverdZorgzwaartepakket) voor.</xsl:when>
			<xsl:when test="$pRule='TR040'">Bij een Client in een AW39 komt in ieder geval één mutatie (MutatieFunctie of MutatieZorgzwaartepakket) of één Aanvraag voor.</xsl:when>
			<xsl:when test="$pRule='TR041'">Als een AanvraagZorgzwaartepakket in hetzelfde bericht gecombineerd wordt met een MutatieZorgzwaartepakket moet de Mutatiecode gelijk zijn aan 12, 18 of 19.</xsl:when>
			<xsl:when test="$pRule='TR042'">De gebruikte AGB-code moet geldig zijn.</xsl:when>
			<xsl:when test="$pRule='TR046'">De Leveringsstatus moet toegestaan zijn bij de opgegeven Mutatiecode.</xsl:when>
			<xsl:when test="$pRule='TR052'">Begindatum of Startdatum van een geleverde zorgeenheid mag niet groter zijn dan Dagtekening in de Header.</xsl:when>
			<xsl:when test="$pRule='TR056'">Identificatie moet per berichtsoort uniek zijn voor de verzendende partij.</xsl:when>
			<xsl:when test="$pRule='TR057'">Wanneer meer GeindiceerdeZorgzwaartepakketten aanwezig zijn bij een Indicatie, dan mogen de geldigheidsduren van deze zorgzwaartepakketten elkaar niet overlappen.</xsl:when>
			<xsl:when test="$pRule='TR061'">Bij een Client moet minimaal één Adres voorkomen waarvan Soort de waarde '01' (BRP-adres) of '03' (Verblijfadres) heeft.</xsl:when>
			<xsl:when test="$pRule='TR063'">Indien StatusAanlevering de waarde 3 (aanlevering verwijderen) bevat, dan moet voor de betreffende Client een eerdere aanlevering met dezelfde sleutel verstuurd zijn.</xsl:when>
			<xsl:when test="$pRule='TR064'">Instelling moet overeenkomen met Afzender in de Header of moet (indien de verzendende partij een zorgkantoor is) conform de iWlz-AGB-codelijst horen bij Afzender.</xsl:when>
			<xsl:when test="$pRule='TR065'">De toewijzende partij moet overeenkomen met de Afzender van het bericht.</xsl:when>
			<xsl:when test="$pRule='TR066'">Het vullen van Begindatum is afhankelijk van Mutatiecode.</xsl:when>
			<xsl:when test="$pRule='TR067'">Klasse en Opslag moeten kleiner zijn dan of gelijk zijn aan Klasse en Opslag in de bijbehorende zorgtoewijzing.</xsl:when>
			<xsl:when test="$pRule='TR069'">Indien Begindatum is gevuld, dan moet deze datum overeenkomen met de Begindatum uit de actuele melding aanvang zorg die op of voor Mutatiedatum ligt.</xsl:when>
			<xsl:when test="$pRule='TR070'">Ingangsdatum en Einddatum van de aangevraagde zorgtoewijzing moeten vallen binnen de geldigheidsduur van de toewijzing waarop het MutatieZorgzwaartepakket van toepassing is.</xsl:when>
			<xsl:when test="$pRule='TR071'">StatusAanlevering mag niet de waarde '3' bevatten als er voor de betreffende geleverde zorgeenheid al een mutatie zorgeenheid (einde zorg) is verstuurd.</xsl:when>
			<xsl:when test="$pRule='TR073'">De Mutatiecode moet toegestaan zijn bij de Soort uit de toegewezen zorgeenheid.</xsl:when>
			<xsl:when test="$pRule='TR074'">Indien StatusAanlevering de waarde '3' kan bevatten maar de waarde '1' bevat, dan moet de logische sleutel van de betreffende aanlevering ook uniek zijn in combinatie met alle reeds ontvangen berichten.</xsl:when>
			<xsl:when test="$pRule='TR076'">Indien een zorgtoewijzing met dezelfde logische sleutel reeds voorkomt, mogen Klasse en Opslag niet kleiner zijn dan in de eerdere toewijzing.</xsl:when>
			<xsl:when test="$pRule='TR077'">Wanneer meer ToegewezenFuncties met dezelfde Functiecode en dezelfde Soort voorkomen, dan mogen deze ToegewezenFuncties maximaal een dag overlappen.</xsl:when>
			<xsl:when test="$pRule='TR078'">Een mutatie (geen eindezorg) mag niet voorafgegaan zijn door een melding aanvang zorg, tenzij de zorglevering is beeindigd met het aanhouden van de zorgtoewijzing.</xsl:when>
			<xsl:when test="$pRule='TR079'">Opvolgende indicatiebesluiten voor dezelfde client moeten opvolgend genummerd worden.</xsl:when>
			<xsl:when test="$pRule='TR080'">De Begindatum van Periode moet precies een dag liggen na de Einddatum van Periode van een eerder correct ontvangen bestand van hetzelfde Zorgkantoor.</xsl:when>
			<xsl:when test="$pRule='TR082'">Indien FunctieCode de waarde 91 (ADL) bevat, dan moet Soort in de ToegewezenFunctie de waarde 1 (Regulier) bevatten en moet Toegewezen FunctieCode gelijk zijn aan Geindiceerde FunctieCode.</xsl:when>
			<xsl:when test="$pRule='TR084'">Indien geleverde Klasse en Opslag groter of gelijk zijn aan Klasse en Opslag in de zorgtoewijzing, dan moet Leveringsstatus de waarde 4 (in zorg) bevatten.</xsl:when>
			<xsl:when test="$pRule='TR091'">Dagtekening moet minimaal 7 dagen na de Einddatum van Periode liggen.</xsl:when>
			<xsl:when test="$pRule='TR097'">Voor een Geboortedatum geldt dat DatumGebruik en Datum met elkaar in overeenstemming moeten zijn.</xsl:when>
			<xsl:when test="$pRule='TR100'">Ontvanger moet conform de iWlz-AGB-codelijst horen bij Afzender.</xsl:when>
			<xsl:when test="$pRule='TR101'">Binnen een bestand zijn dubbele regels niet toegestaan.</xsl:when>
			<xsl:when test="$pRule='TR102'">Indien StatusAanlevering de waarde '1' (Eerste aanlevering) bevat, dan moet de logische sleutel van de aanlevering voor de betreffende client niet alleen uniek zijn binnen het bericht zelf maar ook in combinatie met alle reeds ontvangen berichten.</xsl:when>
			<xsl:when test="$pRule='TR103'">Indien StatusAanlevering de waarde '2' (Gewijzigde aanlevering) bevat, dan moet voor de betreffende client een eerdere aanlevering met StatusAanlevering '1' (Eerste aanlevering) verstuurd zijn met dezelfde technische sleutel.</xsl:when>
			<xsl:when test="$pRule='TR104'">Een verwijderd bericht kan niet gewijzigd worden.</xsl:when>
			<xsl:when test="$pRule='TR106'">Wanneer dezelfde zorgeenheid met dezelfde leveringsvorm meer dan een keer aan dezelfde zorgaanbieder is toegewezen of wanneer pgb meer dan een keer is toegewezen, dan mogen de zorgtoewijzingperiodes niet overlappen.</xsl:when>
			<xsl:when test="$pRule='TR107'">Een aanbieder die de rol van dossierhouder en/of coordinator zorg thuis heeft, mag een aanvraag voor een aangepaste zorgtoewijzing doen als hij voor het indicatiebesluit waarop de aanvraag betrekking heeft een zorgtoewijzing heeft.</xsl:when>
			<xsl:when test="$pRule='TR108'">Indien Indicatie tenminste een ToegewezenZorgzwaartepakket bevat waarvan Leveringsvorm de waarde '2'(Persoonsgebonden budget (PGB)) heeft, moet Dagtekening in de maand november of december liggen.</xsl:when>
			<xsl:when test="$pRule='TR109'">Indien Indicatie tenminste een ToegewezenZorgzwaartepakket bevat waarvan Leveringsvorm de waarde '2' (Persoonsgebonden budget (PGB)) heeft, moet Overdrachtdatum gelijk zijn aan 1 januari.</xsl:when>
			<xsl:when test="$pRule='TR110'">Overdrachtdatum moet groter zijn dan Dagtekening.</xsl:when>
			<xsl:when test="$pRule='TR111'">De einddatum van de toegewezen zorgeenheid moet leeg zijn of groter of gelijk zijn aan de overdrachtdatum van de indicatie.</xsl:when>
			<xsl:when test="$pRule='TR119'">Indien Soort de waarde 5 (Administratief) bevat, dan moet Opname de waarde 1 (Ja) bevatten.</xsl:when>
			<xsl:when test="$pRule='TR120'">Als Leveringsvorm in Aanvraag de waarde ‘4’ (Verblijf) bevat, mag er voor iedere ToewijzingIngangsdatum maximaal één AanvraagInstelling aanwezig zijn waarvan Opname de waarde ‘1’ (Ja) bevat.</xsl:when>
			<xsl:when test="$pRule='TR123'">Voor iedere dag dat er een zorgtoewijzing is voor verblijf met opname Nee moet er tenminste een (1) zorgtoewijzing zijn voor verblijf met opname Ja.</xsl:when>
			<xsl:when test="$pRule='TR124'">Indien Leveringsvorm de waarde 8 (Deeltijdverblijf (DTV)) heeft, moet Ingangsdatum groter of gelijk zijn aan 01-01-2020.</xsl:when>
			<xsl:when test="$pRule='TR126'">Voor iedere dag dat er een zorgtoewijzing is voor deeltijdverblijf moet er precies een (1) zorgtoewijzing zijn voor deeltijdverblijf met opname J.</xsl:when>
			<xsl:when test="$pRule='TR127'">Als leveringsvorm in Aanvraag de waarde '8' (Deeltijdverblijf) bevat, moet er voor iedere dag van de aangevraagde periode precies een (1) AanvraagInstelling zijn waarvan Opname de waarde '1'(Ja) bevat.</xsl:when>
			</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
