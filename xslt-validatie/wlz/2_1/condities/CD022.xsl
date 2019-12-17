<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema">
    <!-- iWlz 2.1 CD022 version 1.9.12 (2019-10-22) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD022"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD022"/>
    </xsl:template>

    <xsl:template match="aw33:GeindiceerdeFunctie" mode="CD022">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="aw33:FunctieCode"/>
            <xsl:with-param name="pValue1">64,82</xsl:with-param>
            <xsl:with-param name="pOther" select="aw33:Vervoer"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD022</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:ToegewezenFunctie" mode="CD022">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="aw33:FunctieCode"/>
            <xsl:with-param name="pValue1">64,82</xsl:with-param>
            <xsl:with-param name="pOther" select="aw33:Vervoer"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD022</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:GeindiceerdeFunctie" mode="CD022">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="io31:FunctieCode"/>
            <xsl:with-param name="pValue1">64,82</xsl:with-param>
            <xsl:with-param name="pOther" select="io31:Vervoer"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD022</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:GeindiceerdeFunctie" mode="CD022">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="zk31:FunctieCode"/>
            <xsl:with-param name="pValue1">64,82</xsl:with-param>
            <xsl:with-param name="pOther" select="zk31:Vervoer"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD022</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenFunctie" mode="CD022">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="zk31:FunctieCode"/>
            <xsl:with-param name="pValue1">64,82</xsl:with-param>
            <xsl:with-param name="pOther" select="zk31:Vervoer"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD022</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:GeindiceerdeFunctie" mode="CD022">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="zk33:FunctieCode"/>
            <xsl:with-param name="pValue1">64,82</xsl:with-param>
            <xsl:with-param name="pOther" select="zk33:Vervoer"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD022</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenFunctie" mode="CD022">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="zk33:FunctieCode"/>
            <xsl:with-param name="pValue1">64,82</xsl:with-param>
            <xsl:with-param name="pOther" select="zk33:Vervoer"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD022</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
