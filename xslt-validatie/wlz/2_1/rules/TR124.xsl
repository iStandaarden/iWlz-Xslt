<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
	xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
	xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
	xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema">
	<!-- iwlz 2.1 TR124 version 1.9.11 (2019-10-11) -->

	<xsl:import href="../common/basis.xsl" />
	<xsl:template match="*" mode="TR124" />
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="TR124" />
	</xsl:template>

	<xsl:template
		match="aw33:ToegewezenZorgzwaartepakket[aw33:Leveringsvorm/text() = '8']"
		mode="TR124">
		<xsl:call-template name="checkDateRelation">
			<xsl:with-param name="pRule">TR124</xsl:with-param>
			<xsl:with-param name="pSource" select="aw33:Ingangsdatum" />
			<xsl:with-param name="pDate">2020-01-01</xsl:with-param>
			<xsl:with-param name="pRelation">equalsGt</xsl:with-param>
			<xsl:with-param name="pExtra" select="aw33:Leveringsvorm" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template
		match="zk31:ToegewezenZorgzwaartepakket[zk31:Leveringsvorm/text() = '8']"
		mode="TR124">
		<xsl:call-template name="checkDateRelation">
			<xsl:with-param name="pRule">TR124</xsl:with-param>
			<xsl:with-param name="pSource" select="zk31:Ingangsdatum" />
			<xsl:with-param name="pDate">2020-01-01</xsl:with-param>
			<xsl:with-param name="pRelation">equalsGt</xsl:with-param>
			<xsl:with-param name="pExtra" select="zk31:Leveringsvorm" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template
		match="zk33:ToegewezenZorgzwaartepakket[zk33:Leveringsvorm/text() = '8']"
		mode="TR124">
		<xsl:call-template name="checkDateRelation">
			<xsl:with-param name="pRule">TR124</xsl:with-param>
			<xsl:with-param name="pSource" select="zk33:Ingangsdatum" />
			<xsl:with-param name="pDate">2020-01-01</xsl:with-param>
			<xsl:with-param name="pRelation">equalsGt</xsl:with-param>
			<xsl:with-param name="pExtra" select="zk33:Leveringsvorm" />
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>