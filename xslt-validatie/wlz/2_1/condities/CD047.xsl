<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema">

    <!-- iWlz 2.1 CD047 version 1.9.14 (2019-12-02) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD047"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD047"/>
    </xsl:template>

    <xsl:template match="aw39:Doelmatig" mode="CD047">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pValue1">2</xsl:with-param>
            <xsl:with-param name="pOther" select="../aw39:BijzondereSituatie"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD047</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk39:Doelmatig" mode="CD047">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pValue1">2</xsl:with-param>
            <xsl:with-param name="pOther" select="../zk39:BijzondereSituatie"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD047</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
