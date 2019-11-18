<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
>
    <!-- iwlz 2.1 TR006 version 1.8.2 (2019-08-05) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR006"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR006"/>
    </xsl:template>

    <xsl:template match="aw33:Contact" mode="TR006">
        <xsl:call-template name="checkSingleCorrect">
            <xsl:with-param name="pThis" select="aw33:Telefoon"/>
            <xsl:with-param name="pValue1">#</xsl:with-param>
            <xsl:with-param name="pOther" select="aw33:Adres/iwlz:Huis"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pExtra" select="."/>
            <xsl:with-param name="pRule">TR006</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checkSingleCorrect">
            <xsl:with-param name="pThis" select="aw33:Telefoon"/>
            <xsl:with-param name="pValue1">#</xsl:with-param>
            <xsl:with-param name="pOther" select="aw33:Adres/iwlz:Postcode"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pExtra" select="."/>
            <xsl:with-param name="pRule">TR006</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:Contact" mode="TR006">
        <xsl:call-template name="checkSingleCorrect">
            <xsl:with-param name="pThis" select="zk31:Telefoon"/>
            <xsl:with-param name="pValue1">#</xsl:with-param>
            <xsl:with-param name="pOther" select="zk31:Adres/iwlz:Huis"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pExtra" select="."/>
            <xsl:with-param name="pRule">TR006</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checkSingleCorrect">
            <xsl:with-param name="pThis" select="zk31:Telefoon"/>
            <xsl:with-param name="pValue1">#</xsl:with-param>
            <xsl:with-param name="pOther" select="zk31:Adres/iwlz:Postcode"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pExtra" select="."/>
            <xsl:with-param name="pRule">TR006</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:Contact" mode="TR006">
        <xsl:call-template name="checkSingleCorrect">
            <xsl:with-param name="pThis" select="zk33:Telefoon"/>
            <xsl:with-param name="pValue1">#</xsl:with-param>
            <xsl:with-param name="pOther" select="zk33:Adres/iwlz:Huis"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pExtra" select="."/>
            <xsl:with-param name="pRule">TR006</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checkSingleCorrect">
            <xsl:with-param name="pThis" select="zk33:Telefoon"/>
            <xsl:with-param name="pValue1">#</xsl:with-param>
            <xsl:with-param name="pOther" select="zk33:Adres/iwlz:Postcode"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pExtra" select="."/>
            <xsl:with-param name="pRule">TR006</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:Contact" mode="TR006">
        <xsl:call-template name="checkSingleCorrect">
            <xsl:with-param name="pThis" select="io31:Telefoon"/>
            <xsl:with-param name="pValue1">#</xsl:with-param>
            <xsl:with-param name="pOther" select="io31:Adres/iwlz:Huis"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pExtra" select="."/>
            <xsl:with-param name="pRule">TR006</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checkSingleCorrect">
            <xsl:with-param name="pThis" select="io31:Telefoon"/>
            <xsl:with-param name="pValue1">#</xsl:with-param>
            <xsl:with-param name="pOther" select="io31:Adres/iwlz:Postcode"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pExtra" select="."/>
            <xsl:with-param name="pRule">TR006</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
