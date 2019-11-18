<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:aw35="http://www.istandaarden.nl/iwlz/2_1/aw35/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema"
                xmlns:ca317="http://www.istandaarden.nl/iwlz/2_1/ca317/schema"
                xmlns:ca319="http://www.istandaarden.nl/iwlz/2_1/ca319/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:zk35="http://www.istandaarden.nl/iwlz/2_1/zk35/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
>
    <!-- iwlz 2.1 TR101 version 1.8.5 (2019-08-28) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR101"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR101"/>
    </xsl:template>

    <xsl:template match="aw33:Clienten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw33:Client"/>
            <xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:Relaties" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw33:Relatie"/>
            <xsl:with-param name="pKeys">/Nummer,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:Contactgegevens" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw33:Contact"/>
            <xsl:with-param name="pKeys">/Soort,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:Stoornissen" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw33:Stoornis"/>
            <xsl:with-param name="pKeys">/Grondslag, /DiagnoseCodelijst, /ZiektebeeldStoornis,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:Indicatie" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="."/>
            <xsl:with-param name="pKeys">/Besluitnummer,/Afgiftedatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:StoornisScores" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw33:StoornisScore"/>
            <xsl:with-param name="pKeys">/Vraag,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:Beperkingen" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw33:Beperking"/>
            <xsl:with-param name="pKeys">/Categorie,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:BeperkingScores" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw33:BeperkingScore"/>
            <xsl:with-param name="pKeys">/Vraag,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:GeindiceerdeZorgzwaartepakketten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw33:GeindiceerdZorgzwaartepakket"/>
            <xsl:with-param name="pKeys">/ZzpCode, /Ingangsdatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:GeindiceerdeFuncties" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw33:GeindiceerdeFunctie"/>
            <xsl:with-param name="pKeys">/FunctieCode, /Ingangsdatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:ToegewezenZorgzwaartepakketten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw33:ToegewezenZorgzwaartepakket"/>
            <xsl:with-param name="pKeys">/ZzpCode, /Instelling, /Ingangsdatum, /Leveringsvorm,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:ToegewezenFuncties" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw33:ToegewezenFunctie"/>
            <xsl:with-param name="pKeys">/FunctieCode, /Instelling, /Ingangsdatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw35:Clienten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw35:Client"/>
            <xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw35:GeleverdeFuncties" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw35:GeleverdeFunctie"/>
            <xsl:with-param name="pKeys">/Besluitnummer, /FunctieCode, /ToewijzingIngangsdatum, /Begindatum,
                /Instelling,
            </xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw35:GeleverdeZorgzwaartepakketten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw35:GeleverdZorgzwaartepakket"/>
            <xsl:with-param name="pKeys">/Besluitnummer, /ZzpCode, /ToewijzingIngangsdatum, /Begindatum, /Instelling,
                /Leveringsvorm,
            </xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw39:Clienten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw39:Client"/>
            <xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw39:Aanvragen" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw39:Aanvraag"/>
            <xsl:with-param name="pKeys">/Besluitnummer, /ZzpCode, /Afgiftedatum, </xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw39:AanvraagInstellingen" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw39:AanvraagInstelling"/>
            <xsl:with-param name="pKeys">/Instelling, /ToewijzingIngangsdatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw39:MutatieZorgzwaartepakketten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw39:MutatieZorgzwaartepakket"/>
            <xsl:with-param name="pKeys">/Besluitnummer, /ZzpCode, /ToewijzingIngangsdatum, /Instelling,
                /Mutatiedatum, /Leveringsvorm, 
            </xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw39:MutatieFuncties" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw39:MutatieFunctie"/>
            <xsl:with-param name="pKeys">/Besluitnummer, /FunctieCode, /ToewijzingIngangsdatum, /Instelling,
                /Mutatiedatum,
            </xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw317:Clienten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw317:Client"/>
            <xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw317:Indicaties" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw317:Indicatie"/>
            <xsl:with-param name="pKeys">/VolgnummerIndicatie,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw317:Stoornissen" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw317:Stoornis"/>
            <xsl:with-param name="pKeys">/Grondslag, /DiagnoseCodelijst, /ZiektebeeldStoornis,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw317:Beperkingen" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw317:Beperking"/>
            <xsl:with-param name="pKeys">/Categorie,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw317:GeindiceerdeZorgzwaartepakketten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw317:GeindiceerdZorgzwaartepakket"/>
            <xsl:with-param name="pKeys">/ZzpCode, /Ingangsdatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw317:WachtlijstZorgzwaartepakketten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="aw317:WachtlijstZorgzwaartepakket"/>
		<xsl:with-param name="pKeys">/ZzpCode, /Instelling, /Ingangsdatum, /Leveringsvorm,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="ca317:Clienten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="ca317:Client"/>
            <xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="ca317:ZorgLeveringen" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="ca317:GeleverdeZorg"/>
            <xsl:with-param name="pKeys">/GeleverdeZorgID,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="ca319:Clienten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="ca319:Client"/>
            <xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="ca319:MutatiesZorg" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="ca319:MutatieZorg"/>
            <xsl:with-param name="pKeys">/MutatieZorgID,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:Clienten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="io31:Client"/>
            <xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:Relaties" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="io31:Relatie"/>
            <xsl:with-param name="pKeys">/Nummer,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:Contactgegevens" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="io31:Contact"/>
            <xsl:with-param name="pKeys">/Soort,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:Indicatie" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="."/>
            <xsl:with-param name="pKeys">/Besluitnummer,/Afgiftedatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:StoornisScores" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="io31:StoornisScore"/>
            <xsl:with-param name="pKeys">/Vraag,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:Stoornissen" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="io31:Stoornis"/>
		<xsl:with-param name="pKeys">/Grondslag, /DiagnoseCodelijst, /ZiektebeeldStoornis, </xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:Beperkingen" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="io31:Beperking"/>
            <xsl:with-param name="pKeys">/Categorie,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:BeperkingScores" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="io31:BeperkingScore"/>
            <xsl:with-param name="pKeys">/Vraag,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:GeindiceerdeZorgzwaartepakketten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="io31:GeindiceerdZorgzwaartepakket"/>
            <xsl:with-param name="pKeys">/ZzpCode, /Ingangsdatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:GeindiceerdeFuncties" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="io31:GeindiceerdeFunctie"/>
            <xsl:with-param name="pKeys">/FunctieCode, /Ingangsdatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="zk31:Clienten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk31:Client"/>
            <xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:Relaties" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk31:Relatie"/>
            <xsl:with-param name="pKeys">/Nummer,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:Contactgegevens" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk31:Contact"/>
            <xsl:with-param name="pKeys">/Soort,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:Indicatie" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="."/>
            <xsl:with-param name="pKeys">/Besluitnummer,/Afgiftedatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:Stoornissen" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk31:Stoornis"/>
            <xsl:with-param name="pKeys">/Grondslag,/DiagnoseCodelijst, /ZiektebeeldStoornis,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="zk31:StoornisScores" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk31:StoornisScore"/>
            <xsl:with-param name="pKeys">/Vraag,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:Beperkingen" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk31:Beperking"/>
            <xsl:with-param name="pKeys">/Categorie,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:BeperkingScores" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk31:BeperkingScore"/>
            <xsl:with-param name="pKeys">/Vraag,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:GeindiceerdeZorgzwaartepakketten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk31:GeindiceerdZorgzwaartepakket"/>
            <xsl:with-param name="pKeys">/ZzpCode, /Ingangsdatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:GeindiceerdeFuncties" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk31:GeindiceerdeFunctie"/>
            <xsl:with-param name="pKeys">/FunctieCode, /Ingangsdatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenZorgzwaartepakketten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk31:ToegewezenZorgzwaartepakket"/>
            <xsl:with-param name="pKeys">/ZzpCode, /Instelling, /Ingangsdatum, /Leveringsvorm,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenFuncties" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk31:ToegewezenFunctie"/>
            <xsl:with-param name="pKeys">/FunctieCode, /Instelling, /Ingangsdatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:Clienten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk33:Client"/>
            <xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:Relaties" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk33:Relatie"/>
            <xsl:with-param name="pKeys">/Nummer,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:Contactgegevens" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk33:Contact"/>
            <xsl:with-param name="pKeys">/Soort,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:Stoornissen" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk33:Stoornis"/>
            <xsl:with-param name="pKeys">/Grondslag, /DiagnoseCodelijst, /ZiektebeeldStoornis,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:Indicatie" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="."/>
            <xsl:with-param name="pKeys">/Besluitnummer,/Afgiftedatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:StoornisScores" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk33:StoornisScore"/>
            <xsl:with-param name="pKeys">/Vraag,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:Beperkingen" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk33:Beperking"/>
            <xsl:with-param name="pKeys">/Categorie,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:BeperkingScores" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk33:BeperkingScore"/>
            <xsl:with-param name="pKeys">/Vraag,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:GeindiceerdeZorgzwaartepakketten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk33:GeindiceerdZorgzwaartepakket"/>
            <xsl:with-param name="pKeys">/ZzpCode, /Ingangsdatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:GeindiceerdeFuncties" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk33:GeindiceerdeFunctie"/>
            <xsl:with-param name="pKeys">/FunctieCode, /Ingangsdatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenZorgzwaartepakketten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk33:ToegewezenZorgzwaartepakket"/>
            <xsl:with-param name="pKeys">/ZzpCode, /Instelling, /Ingangsdatum, /Leveringsvorm,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenFuncties" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk33:ToegewezenFunctie"/>
            <xsl:with-param name="pKeys">/FunctieCode, /Instelling, /Ingangsdatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk35:Clienten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk35:Client"/>
            <xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk35:GeleverdeFuncties" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk35:GeleverdeFunctie"/>
            <xsl:with-param name="pKeys">/Besluitnummer, /FunctieCode, /ToewijzingIngangsdatum, /Begindatum,
                /Instelling,
            </xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk35:GeleverdeZorgzwaartepakketten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk35:GeleverdZorgzwaartepakket"/>
            <xsl:with-param name="pKeys">/Besluitnummer, /ZzpCode, /ToewijzingIngangsdatum, /Begindatum, /Instelling,
                /Leveringsvorm,
            </xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk39:Clienten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk39:Client"/>
            <xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk39:Aanvragen" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk39:Aanvraag"/>
            <xsl:with-param name="pKeys">/Besluitnummer, /ZzpCode, /Afgiftedatum, </xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk39:AanvraagInstellingen" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk39:AanvraagInstelling"/>
            <xsl:with-param name="pKeys">/Instelling, /ToewijzingIngangsdatum,</xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk39:MutatieZorgzwaartepakketten" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk39:MutatieZorgzwaartepakket"/>
            <xsl:with-param name="pKeys">/Besluitnummer, /ZzpCode, /ToewijzingIngangsdatum, /Instelling,
                /Mutatiedatum, /Leveringsvorm, 
            </xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk39:MutatieFuncties" mode="TR101">
        <xsl:call-template name="checkDuplicateKeys">
            <xsl:with-param name="pElement" select="zk39:MutatieFunctie"/>
            <xsl:with-param name="pKeys">/Besluitnummer, /FunctieCode, /ToewijzingIngangsdatum, /Instelling,
                /Mutatiedatum,
            </xsl:with-param>
            <xsl:with-param name="pRule">TR101</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
