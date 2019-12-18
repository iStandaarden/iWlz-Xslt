<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema">
    
    <!-- iWlz 2.1 CS035 version 1.9.16 (2019-12-17) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS035"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS035"/>
    </xsl:template>

    <xsl:template match="aw33:Client/aw33:BurgerlijkeStaat" mode="CS035">
        <xsl:call-template name="checknvalue">
            <xsl:with-param name="pValues">3,6</xsl:with-param>
            <xsl:with-param name="pRule">CS035</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="io31:Client/io31:BurgerlijkeStaat" mode="CS035">
        <xsl:call-template name="checknvalue">
            <xsl:with-param name="pValues">3,6</xsl:with-param>
            <xsl:with-param name="pRule">CS035</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk31:Client/zk31:BurgerlijkeStaat" mode="CS035">
        <xsl:call-template name="checknvalue">
            <xsl:with-param name="pValues">3,6</xsl:with-param>
            <xsl:with-param name="pRule">CS035</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="zk33:Client/zk33:BurgerlijkeStaat" mode="CS035">
        <xsl:call-template name="checknvalue">
            <xsl:with-param name="pValues">3,6</xsl:with-param>
            <xsl:with-param name="pRule">CS035</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
