<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
>

    <!-- iWlz 1.2 CS113 version 1.8.2 (2019-08-05) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS113"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS113"/>
    </xsl:template>

    <xsl:template match="io31:Indicatie/io31:Soort" mode="CS113">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">1,4</xsl:with-param>
            <xsl:with-param name="pRule">CS113</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:Indicatie/zk31:Soort" mode="CS113">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">1,4</xsl:with-param>
            <xsl:with-param name="pRule">CS113</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
