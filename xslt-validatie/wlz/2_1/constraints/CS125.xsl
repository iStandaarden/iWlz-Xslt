<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
                xmlns:ca317="http://www.istandaarden.nl/iwlz/2_1/ca317/schema"
                xmlns:ca319="http://www.istandaarden.nl/iwlz/2_1/ca319/schema"
>
    <!-- iWlz 2.1 CS125 version 1.8.2 (2019-08-05) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS125"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS125"/>
    </xsl:template>

    <xsl:template match="ca317:GeleverdeZorg/ca317:StatusAanlevering" mode="CS125">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">1,2,3</xsl:with-param>
            <xsl:with-param name="pRule">
                CS125
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="ca319:MutatieZorg/ca319:StatusAanlevering" mode="CS125">
        <xsl:call-template name="checkvalue">
            <xsl:with-param name="pValues">1,2,3</xsl:with-param>
            <xsl:with-param name="pRule">
                CS125
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
