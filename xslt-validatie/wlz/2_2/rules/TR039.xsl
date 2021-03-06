<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw35="http://www.istandaarden.nl/iwlz/2_2/aw35/schema"
                xmlns:zk35="http://www.istandaarden.nl/iwlz/2_2/zk35/schema"
>
    <!-- iWlz 2.2 TR039 version 2.1.4 (2020-07-08) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR039"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR039"/>
    </xsl:template>

    <xsl:template match="aw35:Client" mode="TR039">
    	<xsl:call-template name="checkSingleCorrect">
    		<xsl:with-param name="pExtra" select="."/>
            <xsl:with-param name="pThis" select="aw35:GeleverdeFuncties/aw35:GeleverdeFunctie"/>
            <xsl:with-param name="pValue1">#</xsl:with-param>
            <xsl:with-param name="pOther" select="aw35:GeleverdeZorgzwaartepakketten/aw35:GeleverdZorgzwaartepakket"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">
                TR039
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk35:Client" mode="TR039">
    	<xsl:call-template name="checkSingleCorrect">
    		<xsl:with-param name="pExtra" select="."/>
            <xsl:with-param name="pThis" select="zk35:GeleverdeFuncties/zk35:GeleverdeFunctie"/>
            <xsl:with-param name="pValue1">#</xsl:with-param>
            <xsl:with-param name="pOther" select="zk35:GeleverdeZorgzwaartepakketten/zk35:GeleverdZorgzwaartepakket"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">
                TR039
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
