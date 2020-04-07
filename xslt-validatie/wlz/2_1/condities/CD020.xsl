<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
	xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
	xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
	>
	<!-- iWlz 2.1 CD020 version 1.9.21 (2020-04-07) -->

	<xsl:import href="../common/basis.xsl" />
	<xsl:template match="*" mode="CD020" />
	<xsl:template match="*" mode="check">
		<xsl:apply-templates select="*" mode="CD020"/>
	</xsl:template>

	<xsl:template match="aw39:MutatieFunctie" mode="CD020">
		<xsl:call-template name="checksame">
			<xsl:with-param name="pThis" select="aw39:Mutatiecode" />
			<xsl:with-param name="pValue1">17,21</xsl:with-param>
			<xsl:with-param name="pOther" select="aw39:InstellingBestemming" />
			<xsl:with-param name="pValue2">#</xsl:with-param>
			<xsl:with-param name="pRule">CD020</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="aw39:MutatieZorgzwaartepakket" mode="CD020">
		<xsl:call-template name="checksame">
			<xsl:with-param name="pThis" select="aw39:Mutatiecode" />
			<xsl:with-param name="pValue1">17,21</xsl:with-param>
			<xsl:with-param name="pOther" select="aw39:InstellingBestemming" />
			<xsl:with-param name="pValue2">#</xsl:with-param>
			<xsl:with-param name="pRule">CD020</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="zk39:MutatieFunctie" mode="CD020">
		<xsl:call-template name="checksame">
			<xsl:with-param name="pThis" select="zk39:Mutatiecode" />
			<xsl:with-param name="pValue1">17,21</xsl:with-param>
			<xsl:with-param name="pOther" select="zk39:InstellingBestemming" />
			<xsl:with-param name="pValue2">#</xsl:with-param>
			<xsl:with-param name="pRule">CD020</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="zk39:MutatieZorgzwaartepakket" mode="CD020">
		<xsl:call-template name="checksame">
			<xsl:with-param name="pThis" select="zk39:Mutatiecode" />
			<xsl:with-param name="pValue1">17,21</xsl:with-param>
			<xsl:with-param name="pOther" select="zk39:InstellingBestemming" />
			<xsl:with-param name="pValue2">#</xsl:with-param>
			<xsl:with-param name="pRule">CD020</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>
