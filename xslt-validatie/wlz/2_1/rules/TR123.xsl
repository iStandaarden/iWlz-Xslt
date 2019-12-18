<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
	xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
	xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
	xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema">
	<!-- iwlz 2.1 TR123 version 1.9.13 (2019-11-13) -->

	<xsl:import href="../common/basis.xsl" />
	<xsl:template match="*" mode="TR123" />
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="TR123" />
	</xsl:template>

	<xsl:template
		match="aw33:ToegewezenZorgzwaartepakket[aw33:Leveringsvorm/text() = '4' and aw33:Opname/text() = '2']"
		mode="TR123">
		<xsl:call-template name="checkDateCover">
			<xsl:with-param name="pRule">TR123</xsl:with-param>
			<xsl:with-param name="pElements" select="../aw33:ToegewezenZorgzwaartepakket[aw33:Leveringsvorm/text() = '4' and aw33:Opname/text() = '1']" />
			<xsl:with-param name="pExtra" select="." />
		</xsl:call-template>
	</xsl:template>

	<xsl:template
		match="zk33:ToegewezenZorgzwaartepakket[zk33:Leveringsvorm/text() = '4' and zk33:Opname/text() = '2']"
		mode="TR123">
		<xsl:call-template name="checkDateCover">
			<xsl:with-param name="pRule">TR123</xsl:with-param>
			<xsl:with-param name="pElements" select="../zk33:ToegewezenZorgzwaartepakket[zk33:Leveringsvorm/text() = '4' and zk33:Opname/text() = '1']" />
			<xsl:with-param name="pExtra" select="." />
		</xsl:call-template>
	</xsl:template>

	<xsl:template
		match="zk31:ToegewezenZorgzwaartepakket[zk31:Leveringsvorm/text() = '4' and zk31:Opname/text() = '2']"
		mode="TR123">
		<xsl:call-template name="checkDateCover">
			<xsl:with-param name="pRule">TR123</xsl:with-param>
			<xsl:with-param name="pElements" select="../zk31:ToegewezenZorgzwaartepakket[zk31:Leveringsvorm/text() = '4' and zk31:Opname/text() = '1']" />
			<xsl:with-param name="pExtra" select="." />
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>