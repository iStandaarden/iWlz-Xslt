<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema">
    <!-- iWlz 2.1 CS050 version 1.8.2 (2019-08-05) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS050"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS050"/>
    </xsl:template>

    <xsl:template match="*[iwlz:Partnernaam or iwlz:NaamGebruik]" mode="CS050">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="iwlz:Partnernaam"/>
            <xsl:with-param name="pValue1">#</xsl:with-param>
            <xsl:with-param name="pOther" select="iwlz:NaamGebruik"/>
            <xsl:with-param name="pValue2">1,2,3,4</xsl:with-param>
            <xsl:with-param name="pRule">
                CS050
            </xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pThis" select="iwlz:Partnernaam"/>
            <xsl:with-param name="pValue1">!#</xsl:with-param>
            <xsl:with-param name="pOther" select="iwlz:NaamGebruik"/>
            <xsl:with-param name="pValue2">1</xsl:with-param>
            <xsl:with-param name="pExtra" select="."/>
            <xsl:with-param name="pRule">
                CS050
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
