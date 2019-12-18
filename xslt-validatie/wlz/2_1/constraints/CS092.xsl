<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema"
>

    <!-- iWlz 2.1 CS092 version 1.9.14 (2019-12-02) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS092"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS092"/>
    </xsl:template>

    <xsl:template match="aw317:WachtlijstZorgzwaartepakket/aw317:Begindatum" mode="CS092">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../aw317:Ingangsdatum"/>
            <xsl:with-param name="pRule">
                CS092
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
