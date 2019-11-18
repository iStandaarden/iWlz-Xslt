<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema">
    <!-- iWlz 2.1 CD007 version 1.8.2 (2019-08-05) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD007"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD007"/>
    </xsl:template>

    <xsl:template match="*[iwlz:Taal | iwlz:Vorm]" mode="check">
        <xsl:call-template name="checksame">
            <xsl:with-param name="pThis" select="iwlz:Taal"/>
            <xsl:with-param name="pValue1">*</xsl:with-param>
            <xsl:with-param name="pOther" select="iwlz:Vorm"/>
            <xsl:with-param name="pValue2">1</xsl:with-param>
            <xsl:with-param name="pRule">CD007</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
