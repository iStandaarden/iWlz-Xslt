<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:aw39="http://www.istandaarden.nl/iwlz/2_2/aw39/schema"
	xmlns:zk39="http://www.istandaarden.nl/iwlz/2_2/zk39/schema"
	xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_2/basisschema/schema">
	<!-- iWlz 2.2 TR127 version 2.1.4 (2020-07-08) -->

	<xsl:import href="../common/basis.xsl" />
	<xsl:template match="*" mode="TR127" />
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="TR127" />
	</xsl:template>

	<xsl:template
		match="aw39:Aanvraag[aw39:Leveringsvorm/text() = '8']/aw39:AanvraagInstellingen/aw39:AanvraagInstelling[aw39:Opname/text() = '2']"
		mode="TR127">
		<xsl:call-template name="checkDateCover">
			<xsl:with-param name="pRule">TR127</xsl:with-param>
			<xsl:with-param name="pStartName">ToewijzingIngangsdatum</xsl:with-param>
			<xsl:with-param name="pEndName">ToewijzingEinddatum</xsl:with-param>
			<xsl:with-param name="pElements" select="../aw39:AanvraagInstelling[aw39:Opname/text() = '1']" />
			<xsl:with-param name="pExtra" select="." />
		</xsl:call-template>
	</xsl:template>
	<xsl:template
		match="aw39:Aanvraag[aw39:Leveringsvorm/text() = '8']/aw39:AanvraagInstellingen"
		mode="TR127">
		<xsl:call-template name="checkNoOverlap">
			<xsl:with-param name="pRule">TR127</xsl:with-param>
			<xsl:with-param name="pStartName">ToewijzingIngangsdatum</xsl:with-param>
			<xsl:with-param name="pEndName">ToewijzingEinddatum</xsl:with-param>
			<xsl:with-param name="pElements" select="aw39:AanvraagInstelling[aw39:Opname/text() = '1']" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template
		match="zk39:Aanvraag[zk39:Leveringsvorm/text() = '8']/zk39:AanvraagInstellingen/zk39:AanvraagInstelling[zk39:Opname/text() = '2']"
		mode="TR127">
		<xsl:call-template name="checkDateCover">
			<xsl:with-param name="pRule">TR127</xsl:with-param>
			<xsl:with-param name="pStartName">ToewijzingIngangsdatum</xsl:with-param>
			<xsl:with-param name="pEndName">ToewijzingEinddatum</xsl:with-param>
			<xsl:with-param name="pElements" select="../zk39:AanvraagInstelling[zk39:Opname/text() = '1']" />
			<xsl:with-param name="pExtra" select="." />
		</xsl:call-template>
	</xsl:template>
	<xsl:template
		match="zk39:Aanvraag[zk39:Leveringsvorm/text() = '8']/zk39:AanvraagInstellingen"
		mode="TR127">
		<xsl:call-template name="checkNoOverlap">
			<xsl:with-param name="pRule">TR127</xsl:with-param>
			<xsl:with-param name="pStartName">ToewijzingIngangsdatum</xsl:with-param>
			<xsl:with-param name="pEndName">ToewijzingEinddatum</xsl:with-param>
			<xsl:with-param name="pElements" select="zk39:AanvraagInstelling[zk39:Opname/text() = '1']" />
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>