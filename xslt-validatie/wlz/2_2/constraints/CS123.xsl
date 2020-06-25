<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_2/aw33/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_2/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_2/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_2/zk33/schema"
>
    <!-- iWlz 2.1 CS123 version 2.1.1 (2020-06-17) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS123"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS123"/>
    </xsl:template>

    <xsl:template match="aw33:Relatie/aw33:Soort" mode="CS123">
        <xsl:call-template name="checknvalue">
            <xsl:with-param name="pValues">25</xsl:with-param>
            <xsl:with-param name="pRule">CS123</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:Relatie/io31:Soort" mode="CS123">
        <xsl:call-template name="checknvalue">
            <xsl:with-param name="pValues">25</xsl:with-param>
            <xsl:with-param name="pRule">CS123</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:Relatie/zk31:Soort" mode="CS123">
        <xsl:call-template name="checknvalue">
            <xsl:with-param name="pValues">25</xsl:with-param>
            <xsl:with-param name="pRule">CS123</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:Relatie/zk33:Soort" mode="CS123">
        <xsl:call-template name="checknvalue">
            <xsl:with-param name="pValues">25</xsl:with-param>
            <xsl:with-param name="pRule">CS123</xsl:with-param>
        </xsl:call-template>
    </xsl:template>


</xsl:stylesheet>
