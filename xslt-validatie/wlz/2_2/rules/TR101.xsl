<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:aw317="http://www.istandaarden.nl/iwlz/2_2/aw317/schema"
	xmlns:aw33="http://www.istandaarden.nl/iwlz/2_2/aw33/schema"
	xmlns:aw35="http://www.istandaarden.nl/iwlz/2_2/aw35/schema"
	xmlns:aw39="http://www.istandaarden.nl/iwlz/2_2/aw39/schema"
	xmlns:ca317="http://www.istandaarden.nl/iwlz/2_2/ca317/schema"
	xmlns:ca319="http://www.istandaarden.nl/iwlz/2_2/ca319/schema"
	xmlns:io31="http://www.istandaarden.nl/iwlz/2_2/io31/schema"
	xmlns:zk31="http://www.istandaarden.nl/iwlz/2_2/zk31/schema"
	xmlns:zk33="http://www.istandaarden.nl/iwlz/2_2/zk33/schema"
	xmlns:zk35="http://www.istandaarden.nl/iwlz/2_2/zk35/schema"
	xmlns:zk39="http://www.istandaarden.nl/iwlz/2_2/zk39/schema"
>
	<!-- iWlz 2.2 TR101 version 2.1.1 (2020-06-17) -->

	<xsl:import href="../common/basis.xsl"/>
	<xsl:template match="*" mode="TR101"/>
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="TR101"/>
	</xsl:template>

	<!-- AW317 -->
	<xsl:template match="*[aw317:Beperking]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw317:Beperking"/>
			<xsl:with-param name="pKeys">/Categorie,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw317:Client]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw317:Client"/>
			<xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw317:GeindiceerdZorgzwaartepakket]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw317:GeindiceerdZorgzwaartepakket"/>
			<xsl:with-param name="pKeys">/Ingangsdatum,/ZzpCode,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw317:Indicatie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw317:Indicatie"/>
			<xsl:with-param name="pKeys">/VolgnummerIndicatie,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw317:Stoornis]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw317:Stoornis"/>
			<xsl:with-param name="pKeys">/DiagnoseCodelijst,/Grondslag,/ZiektebeeldStoornis,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw317:WachtlijstZorgzwaartepakket]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw317:WachtlijstZorgzwaartepakket"/>
			<xsl:with-param name="pKeys">/Ingangsdatum,/Instelling,/Leveringsvorm,/ZzpCode,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!-- AW33 -->
	<xsl:template match="*[aw33:Beperking]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw33:Beperking"/>
			<xsl:with-param name="pKeys">/Categorie,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw33:BeperkingScore]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw33:BeperkingScore"/>
			<xsl:with-param name="pKeys">/Vraag,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw33:Client]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw33:Client"/>
			<xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw33:Contact]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw33:Contact"/>
			<xsl:with-param name="pKeys">/Soort,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw33:GeindiceerdZorgzwaartepakket]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw33:GeindiceerdZorgzwaartepakket"/>
			<xsl:with-param name="pKeys">/Ingangsdatum,/ZzpCode,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw33:GeindiceerdeFunctie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw33:GeindiceerdeFunctie"/>
			<xsl:with-param name="pKeys">/FunctieCode,/Ingangsdatum,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw33:Indicatie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw33:Indicatie"/>
			<xsl:with-param name="pKeys">/Afgiftedatum,/Besluitnummer,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw33:Relatie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw33:Relatie"/>
			<xsl:with-param name="pKeys">/Nummer,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw33:Stoornis]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw33:Stoornis"/>
			<xsl:with-param name="pKeys">/DiagnoseCodelijst,/Grondslag,/ZiektebeeldStoornis,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw33:StoornisScore]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw33:StoornisScore"/>
			<xsl:with-param name="pKeys">/Vraag,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw33:ToegewezenFunctie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw33:ToegewezenFunctie"/>
			<xsl:with-param name="pKeys">/FunctieCode,/Ingangsdatum,/Instelling,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw33:ToegewezenZorgzwaartepakket]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw33:ToegewezenZorgzwaartepakket"/>
			<xsl:with-param name="pKeys">/Ingangsdatum,/Instelling,/Leveringsvorm,/ZzpCode,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!-- AW35 -->
	<xsl:template match="*[aw35:Client]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw35:Client"/>
			<xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw35:GeleverdZorgzwaartepakket]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw35:GeleverdZorgzwaartepakket"/>
			<xsl:with-param name="pKeys">/Begindatum,/Besluitnummer,/Instelling,/Leveringsvorm,/ToewijzingIngangsdatum,/ZzpCode,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw35:GeleverdeFunctie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw35:GeleverdeFunctie"/>
			<xsl:with-param name="pKeys">/Begindatum,/Besluitnummer,/FunctieCode,/Instelling,/ToewijzingIngangsdatum,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!-- AW39 -->
	<xsl:template match="*[aw39:Aanvraag]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw39:Aanvraag"/>
			<xsl:with-param name="pKeys">/Afgiftedatum,/Besluitnummer,/Instelling,/ZzpCode,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw39:AanvraagInstelling]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw39:AanvraagInstelling"/>
			<xsl:with-param name="pKeys">/Instelling,/ToewijzingIngangsdatum,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw39:Client]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw39:Client"/>
			<xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw39:MutatieFunctie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw39:MutatieFunctie"/>
			<xsl:with-param name="pKeys">/Besluitnummer,/FunctieCode,/Instelling,/Mutatiedatum,/ToewijzingIngangsdatum,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[aw39:MutatieZorgzwaartepakket]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="aw39:MutatieZorgzwaartepakket"/>
			<xsl:with-param name="pKeys">/Besluitnummer,/Instelling,/Leveringsvorm,/Mutatiedatum,/ToewijzingIngangsdatum,/ZzpCode,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!-- CA317 -->
	<xsl:template match="*[ca317:Client]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="ca317:Client"/>
			<xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[ca317:GeleverdeZorg]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="ca317:GeleverdeZorg"/>
			<xsl:with-param name="pKeys">/GeleverdeZorgID,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!-- CA319 -->
	<xsl:template match="*[ca319:Client]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="ca319:Client"/>
			<xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[ca319:MutatieZorg]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="ca319:MutatieZorg"/>
			<xsl:with-param name="pKeys">/MutatieZorgID,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!-- IO31 -->
	<xsl:template match="*[io31:Beperking]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="io31:Beperking"/>
			<xsl:with-param name="pKeys">/Categorie,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[io31:BeperkingScore]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="io31:BeperkingScore"/>
			<xsl:with-param name="pKeys">/Vraag,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[io31:Client]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="io31:Client"/>
			<xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[io31:Contact]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="io31:Contact"/>
			<xsl:with-param name="pKeys">/Soort,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[io31:GeindiceerdZorgzwaartepakket]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="io31:GeindiceerdZorgzwaartepakket"/>
			<xsl:with-param name="pKeys">/Ingangsdatum,/ZzpCode,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[io31:GeindiceerdeFunctie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="io31:GeindiceerdeFunctie"/>
			<xsl:with-param name="pKeys">/FunctieCode,/Ingangsdatum,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[io31:Indicatie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="io31:Indicatie"/>
			<xsl:with-param name="pKeys">/Afgiftedatum,/Besluitnummer,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[io31:Relatie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="io31:Relatie"/>
			<xsl:with-param name="pKeys">/Nummer,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[io31:Stoornis]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="io31:Stoornis"/>
			<xsl:with-param name="pKeys">/DiagnoseCodelijst,/Grondslag,/ZiektebeeldStoornis,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[io31:StoornisScore]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="io31:StoornisScore"/>
			<xsl:with-param name="pKeys">/Vraag,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!-- ZK31 -->
	<xsl:template match="*[zk31:Beperking]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk31:Beperking"/>
			<xsl:with-param name="pKeys">/Categorie,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk31:BeperkingScore]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk31:BeperkingScore"/>
			<xsl:with-param name="pKeys">/Vraag,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk31:Client]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk31:Client"/>
			<xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk31:Contact]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk31:Contact"/>
			<xsl:with-param name="pKeys">/Soort,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk31:GeindiceerdZorgzwaartepakket]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk31:GeindiceerdZorgzwaartepakket"/>
			<xsl:with-param name="pKeys">/Ingangsdatum,/ZzpCode,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk31:GeindiceerdeFunctie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk31:GeindiceerdeFunctie"/>
			<xsl:with-param name="pKeys">/FunctieCode,/Ingangsdatum,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk31:Indicatie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk31:Indicatie"/>
			<xsl:with-param name="pKeys">/Afgiftedatum,/Besluitnummer,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk31:Relatie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk31:Relatie"/>
			<xsl:with-param name="pKeys">/Nummer,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk31:Stoornis]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk31:Stoornis"/>
			<xsl:with-param name="pKeys">/DiagnoseCodelijst,/Grondslag,/ZiektebeeldStoornis,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk31:StoornisScore]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk31:StoornisScore"/>
			<xsl:with-param name="pKeys">/Vraag,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk31:ToegewezenFunctie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk31:ToegewezenFunctie"/>
			<xsl:with-param name="pKeys">/FunctieCode,/Ingangsdatum,/Instelling,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk31:ToegewezenZorgzwaartepakket]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk31:ToegewezenZorgzwaartepakket"/>
			<xsl:with-param name="pKeys">/Ingangsdatum,/Instelling,/Leveringsvorm,/ZzpCode,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!-- ZK33 -->
	<xsl:template match="*[zk33:Beperking]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk33:Beperking"/>
			<xsl:with-param name="pKeys">/Categorie,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk33:BeperkingScore]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk33:BeperkingScore"/>
			<xsl:with-param name="pKeys">/Vraag,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk33:Client]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk33:Client"/>
			<xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk33:Contact]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk33:Contact"/>
			<xsl:with-param name="pKeys">/Soort,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk33:GeindiceerdZorgzwaartepakket]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk33:GeindiceerdZorgzwaartepakket"/>
			<xsl:with-param name="pKeys">/Ingangsdatum,/ZzpCode,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk33:GeindiceerdeFunctie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk33:GeindiceerdeFunctie"/>
			<xsl:with-param name="pKeys">/FunctieCode,/Ingangsdatum,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk33:Indicatie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk33:Indicatie"/>
			<xsl:with-param name="pKeys">/Afgiftedatum,/Besluitnummer,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk33:Relatie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk33:Relatie"/>
			<xsl:with-param name="pKeys">/Nummer,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk33:Stoornis]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk33:Stoornis"/>
			<xsl:with-param name="pKeys">/DiagnoseCodelijst,/Grondslag,/ZiektebeeldStoornis,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk33:StoornisScore]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk33:StoornisScore"/>
			<xsl:with-param name="pKeys">/Vraag,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk33:ToegewezenFunctie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk33:ToegewezenFunctie"/>
			<xsl:with-param name="pKeys">/FunctieCode,/Ingangsdatum,/Instelling,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk33:ToegewezenZorgzwaartepakket]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk33:ToegewezenZorgzwaartepakket"/>
			<xsl:with-param name="pKeys">/Ingangsdatum,/Instelling,/Leveringsvorm,/ZzpCode,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!-- ZK35 -->
	<xsl:template match="*[zk35:Client]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk35:Client"/>
			<xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk35:GeleverdZorgzwaartepakket]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk35:GeleverdZorgzwaartepakket"/>
			<xsl:with-param name="pKeys">/Begindatum,/Besluitnummer,/Instelling,/Leveringsvorm,/ToewijzingIngangsdatum,/ZzpCode,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk35:GeleverdeFunctie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk35:GeleverdeFunctie"/>
			<xsl:with-param name="pKeys">/Begindatum,/Besluitnummer,/FunctieCode,/Instelling,/ToewijzingIngangsdatum,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!-- ZK39 -->
	<xsl:template match="*[zk39:Aanvraag]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk39:Aanvraag"/>
			<xsl:with-param name="pKeys">/Afgiftedatum,/Besluitnummer,/Instelling,/ZzpCode,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk39:AanvraagInstelling]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk39:AanvraagInstelling"/>
			<xsl:with-param name="pKeys">/Instelling,/ToewijzingIngangsdatum,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk39:Client]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk39:Client"/>
			<xsl:with-param name="pKeys">/Bsn,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk39:MutatieFunctie]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk39:MutatieFunctie"/>
			<xsl:with-param name="pKeys">/Besluitnummer,/FunctieCode,/Instelling,/Mutatiedatum,/ToewijzingIngangsdatum,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*[zk39:MutatieZorgzwaartepakket]" mode="TR101">
		<xsl:call-template name="checkDuplicateKeys">
			<xsl:with-param name="pElement" select="zk39:MutatieZorgzwaartepakket"/>
			<xsl:with-param name="pKeys">/Besluitnummer,/Instelling,/Leveringsvorm,/Mutatiedatum,/ToewijzingIngangsdatum,/ZzpCode,</xsl:with-param>
			<xsl:with-param name="pRule">TR101</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>
