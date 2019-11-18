<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
>
    <!-- iwlz 2.1 TR097 version 1.9.7 (2019-10-01) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR097"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR097"/>
    </xsl:template>

    <xsl:template match="*[iwlz:Datum and iwlz:DatumGebruik]" mode="TR097">
        <xsl:choose>
            <xsl:when test="iwlz:DatumGebruik = '3' and iwlz:Datum != '1900-01-01'">
                <xsl:call-template name="addError">
                    <xsl:with-param name="pElements" select="iwlz:Datum | iwlz:DatumGebruik"/>
                    <xsl:with-param name="pRule">
                        TR097
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="iwlz:DatumGebruik = '2' and substring-after(iwlz:Datum, '-') != '01-01'">
                <xsl:call-template name="addError">
                    <xsl:with-param name="pElements" select="iwlz:Datum | iwlz:DatumGebruik"/>
                    <xsl:with-param name="pRule">
                        TR097
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="iwlz:DatumGebruik = '1' and substring-after(substring-after(iwlz:Datum, '-'), '-') != '01'">
                <xsl:call-template name="addError">
                    <xsl:with-param name="pElements" select="iwlz:Datum | iwlz:DatumGebruik"/>
                    <xsl:with-param name="pRule">
                        TR097
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
