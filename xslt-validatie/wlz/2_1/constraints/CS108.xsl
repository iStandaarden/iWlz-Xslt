<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema">

    <!-- iWlz 2.1 CS108 version 1.9.19 (2020-03-25) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS108"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS108"/>
    </xsl:template>

    <xsl:template match="aw317:Periode/iwlz:Einddatum" mode="CS108">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../iwlz:Begindatum"/>
            <xsl:with-param name="pRule">
                CS108
            </xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pThis"
                            select="ancestor-or-self::aw317:Bericht/aw317:Header/aw317:BerichtIdentificatie/iwlz:Dagtekening"/>
            <xsl:with-param name="pOther" select="."/>
            <xsl:with-param name="pRule">
                CS108
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
