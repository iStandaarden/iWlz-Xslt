<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_2/basisschema/schema"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_2/aw317/schema">
    <!-- iWlz 2.1 CS118 version 2.1.1 (2020-06-17) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS118"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS118"/>
    </xsl:template>

    <xsl:template match="aw317:LandCode" mode="CS118">
        <xsl:call-template name="checkimplication">
            <xsl:with-param name="pValue1">NL</xsl:with-param>
            <xsl:with-param name="pOther" select="../aw317:Postcode"/>
            <xsl:with-param name="pValue2">#1000</xsl:with-param>
            <xsl:with-param name="pRule">CS118</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
