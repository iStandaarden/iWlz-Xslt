<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema">
    <!-- iWlz 2.1 CS093 version 1.9.21 (2020-04-07) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS093"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS093"/>
    </xsl:template>

    <xsl:template match="aw317:WachtlijstZorgzwaartepakket/aw317:Mutatiedatum" mode="CS093">
        <xsl:if test="../aw317:Begindatum">
            <xsl:call-template name="checkafter">
                <xsl:with-param name="pOther" select="../aw317:Begindatum"/>
                <xsl:with-param name="pRule">
                    CS093
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
