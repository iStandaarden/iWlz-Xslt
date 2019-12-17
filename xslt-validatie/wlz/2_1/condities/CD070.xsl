<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema">
    <!-- iWlz 2.1 CD070 version 1.9.12 (2019-10-22) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD070"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD070"/>
    </xsl:template>

    <xsl:template match="aw33:Wzd" mode="CD070">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="iwlz:WzdVerklaring"/>
            <xsl:with-param name="pValue1">1</xsl:with-param>
            <xsl:with-param name="pOther" select="iwlz:WzdIngangsdatum"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD070</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="iwlz:WzdVerklaring"/>
            <xsl:with-param name="pValue1">1</xsl:with-param>
            <xsl:with-param name="pOther" select="iwlz:WzdEinddatum"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD070</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:Wzd" mode="CD070">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="iwlz:WzdVerklaring"/>
            <xsl:with-param name="pValue1">1</xsl:with-param>
            <xsl:with-param name="pOther" select="iwlz:WzdIngangsdatum"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD070</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="iwlz:WzdVerklaring"/>
            <xsl:with-param name="pValue1">1</xsl:with-param>
            <xsl:with-param name="pOther" select="iwlz:WzdEinddatum"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD070</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:Wzd" mode="CD070">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="iwlz:WzdVerklaring"/>
            <xsl:with-param name="pValue1">1</xsl:with-param>
            <xsl:with-param name="pOther" select="iwlz:WzdIngangsdatum"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD070</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="iwlz:WzdVerklaring"/>
            <xsl:with-param name="pValue1">1</xsl:with-param>
            <xsl:with-param name="pOther" select="iwlz:WzdEinddatum"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD070</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:Wzd" mode="CD070">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="iwlz:WzdVerklaring"/>
            <xsl:with-param name="pValue1">1</xsl:with-param>
            <xsl:with-param name="pOther" select="iwlz:WzdIngangsdatum"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD070</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="iwlz:WzdVerklaring"/>
            <xsl:with-param name="pValue1">1</xsl:with-param>
            <xsl:with-param name="pOther" select="iwlz:WzdEinddatum"/>
            <xsl:with-param name="pValue2">#</xsl:with-param>
            <xsl:with-param name="pRule">CD070</xsl:with-param>
        </xsl:call-template>
    </xsl:template>


</xsl:stylesheet>