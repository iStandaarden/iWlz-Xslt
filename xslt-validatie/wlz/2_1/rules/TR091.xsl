<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
>
    <!-- iwlz 2.1 TR091 version 1.9.21 (2020-04-07) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR091"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR091"/>
    </xsl:template>

    <xsl:template match="aw317:Header" mode="TR091">
        <xsl:call-template name="checkDateRelation">
            <xsl:with-param name="pSource" select="aw317:BerichtIdentificatie/iwlz:Dagtekening"/>
            <xsl:with-param name="pDate" select="aw317:Periode/iwlz:Einddatum"/>
			<xsl:with-param name="pRelation">daysAfter</xsl:with-param>
            <xsl:with-param name="pExtra">6</xsl:with-param>
            <xsl:with-param name="pRule">
                TR091
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
