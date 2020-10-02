<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_2/aw33/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_2/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_2/zk33/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_2/io31/schema">

    <!-- iWlz 2.2 CS107 version 2.1.4 (2020-07-08) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS107"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS107"/>
    </xsl:template>

    <xsl:template match="aw33:GeindiceerdeFunctie/aw33:Vervoer" mode="CS107">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">1,2</xsl:with-param>
            <xsl:with-param name="pRule">CS107</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:ToegewezenFunctie/aw33:Vervoer" mode="CS107">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">1,2</xsl:with-param>
            <xsl:with-param name="pRule">CS107</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:GeindiceerdeFunctie/io31:Vervoer" mode="CS107">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">1,2</xsl:with-param>
            <xsl:with-param name="pRule">CS107</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:GeindiceerdeFunctie/zk31:Vervoer" mode="CS107">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">1,2</xsl:with-param>
            <xsl:with-param name="pRule">CS107</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenFunctie/zk31:Vervoer" mode="CS107">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">1,2</xsl:with-param>
            <xsl:with-param name="pRule">CS107</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:GeindiceerdeFunctie/zk33:Vervoer" mode="CS107">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">1,2</xsl:with-param>
            <xsl:with-param name="pRule">CS107</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenFunctie/zk33:Vervoer" mode="CS107">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">1,2</xsl:with-param>
            <xsl:with-param name="pRule">CS107</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
