--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2015-09-17 00:04:49

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 232 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 232
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 22898)
-- Name: acl; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE acl (
    managedobjectid integer NOT NULL,
    modificationtime bigint NOT NULL
);


ALTER TABLE acl OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 22911)
-- Name: acl_aclentry; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE acl_aclentry (
    acl_managedobjectid integer NOT NULL,
    entries_pk integer NOT NULL
);


ALTER TABLE acl_aclentry OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 22903)
-- Name: aclentry; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE aclentry (
    pk integer NOT NULL,
    principaldn character varying(255),
    allowedpermissionordinals bytea,
    deniedpermissionordinals bytea
);


ALTER TABLE aclentry OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 22916)
-- Name: artifacttrigger; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE artifacttrigger (
    dtype character varying(31) NOT NULL,
    id integer NOT NULL,
    name character varying(255),
    artifactid integer NOT NULL,
    minimumlength integer,
    permissions bytea,
    attributetypeids bytea
);


ALTER TABLE artifacttrigger OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 22924)
-- Name: attribute; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attribute (
    dtype character varying(31) NOT NULL,
    id integer NOT NULL,
    name character varying(255),
    description text,
    typeid integer NOT NULL,
    latest boolean NOT NULL,
    text_value text,
    boolean_value boolean,
    background_color character varying(255),
    date_value timestamp without time zone,
    integer_value integer,
    items bytea,
    selecteditem character varying(255),
    selecteddn character varying(255)
);


ALTER TABLE attribute OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 22932)
-- Name: attribute_dns; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attribute_dns (
    attribute_id integer NOT NULL,
    element character varying(255),
    p_index integer NOT NULL
);


ALTER TABLE attribute_dns OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 22937)
-- Name: attribute_listitems; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attribute_listitems (
    attribute_id integer NOT NULL,
    element character varying(255),
    p_index integer NOT NULL
);


ALTER TABLE attribute_listitems OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 22942)
-- Name: attribute_selecteddns; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attribute_selecteddns (
    attribute_id integer NOT NULL,
    element character varying(255),
    sp_index integer NOT NULL
);


ALTER TABLE attribute_selecteddns OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 22947)
-- Name: attribute_selecteditems; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attribute_selecteditems (
    attribute_id integer NOT NULL,
    element character varying(255),
    p_index integer NOT NULL
);


ALTER TABLE attribute_selecteditems OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 22952)
-- Name: axiomlock; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE axiomlock (
    artifactid integer NOT NULL,
    "timestamp" bigint NOT NULL,
    userid character varying(255),
    explicitlock boolean NOT NULL
);


ALTER TABLE axiomlock OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 22957)
-- Name: childhistory; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE childhistory (
    managedobjectid integer NOT NULL
);


ALTER TABLE childhistory OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 22967)
-- Name: childhistory_childhistoryentry; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE childhistory_childhistoryentry (
    childhistory_managedobjectid integer NOT NULL,
    entries_pk integer NOT NULL
);


ALTER TABLE childhistory_childhistoryentry OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 22962)
-- Name: childhistoryentry; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE childhistoryentry (
    pk integer NOT NULL,
    starttime bigint NOT NULL,
    endtime bigint NOT NULL,
    childpks oid
);


ALTER TABLE childhistoryentry OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 23223)
-- Name: cndition; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cndition (
    pk integer NOT NULL,
    enabled boolean NOT NULL,
    rmo oid,
    includeroot boolean NOT NULL,
    treeviewconfiguration bytea,
    rootmanagedobject oid,
    rootexpression_id integer
);


ALTER TABLE cndition OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 23231)
-- Name: cndition_sortdescriptors; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cndition_sortdescriptors (
    cndition_pk integer NOT NULL,
    element bytea,
    sd_index integer NOT NULL
);


ALTER TABLE cndition_sortdescriptors OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 22972)
-- Name: configuration; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE configuration (
    id integer NOT NULL,
    version integer,
    xmppservername character varying(255),
    xmppserverport integer NOT NULL,
    topologyroothost character varying(255),
    topologyparenthost character varying(255),
    rootserver boolean
);


ALTER TABLE configuration OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 22980)
-- Name: consequence; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE consequence (
    pk integer NOT NULL,
    handlerid character varying(255),
    configurationxml text
);


ALTER TABLE consequence OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 23239)
-- Name: decision_cell; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE decision_cell (
    id bigint NOT NULL,
    value character varying(255),
    textdirection integer,
    width integer NOT NULL,
    height integer NOT NULL,
    arlcontent boolean NOT NULL,
    bold boolean NOT NULL,
    italic boolean NOT NULL,
    underline boolean NOT NULL,
    foregroundcolor character varying(255),
    backgroundcolor character varying(255),
    fontsize integer NOT NULL,
    textalignment integer,
    referencedartifactids oid
);


ALTER TABLE decision_cell OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 23247)
-- Name: decision_row; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE decision_row (
    id bigint NOT NULL
);


ALTER TABLE decision_row OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 23252)
-- Name: decision_row_decision_cell; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE decision_row_decision_cell (
    decision_row_id bigint NOT NULL,
    cells_id bigint NOT NULL,
    cell_index integer NOT NULL
);


ALTER TABLE decision_row_decision_cell OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 22988)
-- Name: decisionmatrix; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE decisionmatrix (
    pk integer NOT NULL
);


ALTER TABLE decisionmatrix OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 22993)
-- Name: decisionmatrix_decision_row; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE decisionmatrix_decision_row (
    decisionmatrix_pk integer NOT NULL,
    rows_id bigint NOT NULL,
    row_index integer NOT NULL
);


ALTER TABLE decisionmatrix_decision_row OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 23000)
-- Name: expression; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE expression (
    dtype character varying(40) NOT NULL,
    id integer NOT NULL,
    operator integer,
    expressiontype integer,
    expressiondirection integer,
    fieldname character varying(255),
    objectid integer,
    attributename character varying(255),
    typeid integer,
    booleanvalue boolean,
    stringvalue0 character varying(255),
    intvalue integer,
    conditionreference bytea,
    templateid integer,
    attribute_id integer
);


ALTER TABLE expression OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 23008)
-- Name: expression_expression; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE expression_expression (
    expression_id integer NOT NULL,
    expressions_id integer NOT NULL
);


ALTER TABLE expression_expression OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 23013)
-- Name: expression_linktype; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE expression_linktype (
    expression_id integer NOT NULL,
    searchablelinktypes_pk integer NOT NULL,
    search_links integer NOT NULL
);


ALTER TABLE expression_linktype OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 23020)
-- Name: fileartifact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fileartifact (
    pk integer NOT NULL,
    contenttype character varying(255),
    shortcut boolean NOT NULL
);


ALTER TABLE fileartifact OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 23494)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 23025)
-- Name: id; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE id (
    typeordinal integer NOT NULL,
    value bigint NOT NULL
);


ALTER TABLE id OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 23030)
-- Name: latestversion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE latestversion (
    idnumber integer NOT NULL,
    version integer NOT NULL
);


ALTER TABLE latestversion OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 23035)
-- Name: licensekey; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE licensekey (
    guid character varying(255) NOT NULL,
    licensekeytext character varying(255)
);


ALTER TABLE licensekey OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 23043)
-- Name: lightweightnode; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lightweightnode (
    dtype character varying(31) NOT NULL,
    pk integer NOT NULL,
    version bigint NOT NULL,
    managedobjectid integer,
    managedobjectpk integer,
    parentid integer NOT NULL,
    childindex integer,
    name character varying(255),
    state integer,
    leftindex integer,
    rightindex integer,
    templateid integer
);


ALTER TABLE lightweightnode OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 23048)
-- Name: link; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE link (
    id bigint NOT NULL,
    source bytea,
    target bytea,
    targeturl character varying(255),
    sourceurl character varying(255),
    linktypeid integer NOT NULL,
    targeturltexttodisplay character varying(255),
    sourceurltexttodisplay character varying(255)
);


ALTER TABLE link OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 23056)
-- Name: linktype; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE linktype (
    pk integer NOT NULL,
    style_id integer
);


ALTER TABLE linktype OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 23066)
-- Name: managedobject; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE managedobject (
    pk integer NOT NULL,
    name character varying(255),
    version integer NOT NULL,
    contenttype character varying(255),
    username character varying(1024),
    xml text,
    guid character varying(255),
    endtime bigint NOT NULL,
    deleted boolean NOT NULL,
    template boolean NOT NULL,
    objectid integer NOT NULL,
    rootpk integer NOT NULL,
    containerid integer NOT NULL,
    ruleids bytea,
    propagatedruleids bytea,
    modificationtime bigint NOT NULL,
    image oid,
    modificationcomment text,
    templatereference_id integer
);


ALTER TABLE managedobject OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 23074)
-- Name: managedobject_attribute; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE managedobject_attribute (
    managedobject_pk integer NOT NULL,
    attributes_id integer NOT NULL,
    attrib_index integer NOT NULL
);


ALTER TABLE managedobject_attribute OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 23081)
-- Name: managedobject_link; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE managedobject_link (
    managedobject_pk integer NOT NULL,
    links_id bigint NOT NULL,
    link_index integer NOT NULL
);


ALTER TABLE managedobject_link OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 23086)
-- Name: managedobject_managedobject; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE managedobject_managedobject (
    managedobject_pk integer NOT NULL,
    embeddedobjects_pk integer NOT NULL,
    embed_index integer NOT NULL
);


ALTER TABLE managedobject_managedobject OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 23093)
-- Name: managedobject_templatecontexts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE managedobject_templatecontexts (
    managedobject_pk integer NOT NULL,
    element integer,
    tmp_index integer NOT NULL
);


ALTER TABLE managedobject_templatecontexts OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 23098)
-- Name: message; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE message (
    dtype character varying(31) NOT NULL,
    pk integer NOT NULL,
    "timestamp" bigint NOT NULL,
    subject text,
    body text,
    userid character varying(255),
    artifactid integer NOT NULL,
    discussionpk integer NOT NULL
);


ALTER TABLE message OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 23106)
-- Name: message_message; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE message_message (
    message_pk integer NOT NULL,
    messages_pk integer NOT NULL,
    message_index integer NOT NULL
);


ALTER TABLE message_message OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 23113)
-- Name: message_readbyuserids; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE message_readbyuserids (
    message_pk integer NOT NULL,
    element character varying(255)
);


ALTER TABLE message_readbyuserids OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 23116)
-- Name: metricevent; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE metricevent (
    id integer NOT NULL,
    classname character varying(255),
    methodname character varying(255),
    "timestamp" bigint NOT NULL,
    timespan integer NOT NULL
);


ALTER TABLE metricevent OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 23061)
-- Name: mor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mor (
    id integer NOT NULL,
    type integer,
    metadata character varying(255),
    managedobjectid integer,
    managedobjectversion integer,
    managedobjectreferences_id integer,
    ref_index integer
);


ALTER TABLE mor OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 23124)
-- Name: principal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE principal (
    dtype character varying(31) NOT NULL,
    pk integer NOT NULL,
    commonname character varying(255),
    distinguishedname character varying(255),
    password character varying(255),
    userid character varying(255),
    emailaddress character varying(255),
    embedded boolean,
    firstname character varying(255),
    lastname character varying(255)
);


ALTER TABLE principal OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 23259)
-- Name: rul; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rul (
    pk integer NOT NULL,
    active boolean NOT NULL,
    triggeraction integer NOT NULL,
    cndition oid
);


ALTER TABLE rul OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 23132)
-- Name: runtimemetric; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE runtimemetric (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    totalmemory bigint NOT NULL,
    freememory bigint NOT NULL,
    maxmemory bigint NOT NULL,
    threadcount integer NOT NULL
);


ALTER TABLE runtimemetric OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 23137)
-- Name: seatusagerecord; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE seatusagerecord (
    userdn character varying(255) NOT NULL,
    "timestamp" bigint NOT NULL
);


ALTER TABLE seatusagerecord OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 23142)
-- Name: signature; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE signature (
    pk integer NOT NULL,
    objectid integer NOT NULL,
    meaning text,
    objectpk integer NOT NULL,
    objectversion integer NOT NULL
);


ALTER TABLE signature OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 23155)
-- Name: signature_signatureentry; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE signature_signatureentry (
    signature_pk integer NOT NULL,
    entries_pk integer NOT NULL,
    entry_index integer NOT NULL
);


ALTER TABLE signature_signatureentry OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 23150)
-- Name: signatureentry; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE signatureentry (
    pk integer NOT NULL,
    "timestamp" bigint NOT NULL,
    userdn character varying(255)
);


ALTER TABLE signatureentry OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 23162)
-- Name: style; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE style (
    id integer NOT NULL,
    backgroundred integer NOT NULL,
    backgroundgreen integer NOT NULL,
    backgroundblue integer NOT NULL,
    foregroundred integer NOT NULL,
    foregroundgreen integer NOT NULL,
    foregroundblue integer NOT NULL,
    linecolorred integer NOT NULL,
    linecolorgreen integer NOT NULL,
    linecolorblue integer NOT NULL,
    linewidth integer NOT NULL,
    linestyle integer
);


ALTER TABLE style OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 23167)
-- Name: systemadministrator; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE systemadministrator (
    pk integer NOT NULL,
    userdn character varying(255)
);


ALTER TABLE systemadministrator OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 23172)
-- Name: treemodificationrecord; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE treemodificationrecord (
    treemodificationid integer NOT NULL,
    parentid integer NOT NULL
);


ALTER TABLE treemodificationrecord OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 23177)
-- Name: treeview; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE treeview (
    pk integer NOT NULL
);


ALTER TABLE treeview OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 23187)
-- Name: treeview_treeviewconfiguration; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE treeview_treeviewconfiguration (
    treeview_pk integer NOT NULL,
    configurations_pk integer NOT NULL,
    config_index integer NOT NULL
);


ALTER TABLE treeview_treeviewconfiguration OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 23182)
-- Name: treeviewconfiguration; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE treeviewconfiguration (
    pk integer NOT NULL,
    tree_date bigint,
    rootid integer NOT NULL
);


ALTER TABLE treeviewconfiguration OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 23194)
-- Name: uiartifact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE uiartifact (
    pk integer NOT NULL,
    actions oid,
    events oid,
    componenttypeid character varying(255),
    bold boolean,
    italic boolean,
    underline boolean,
    fontsize integer,
    textalignment character varying(255),
    childidtoxcoordinate oid,
    childidtoycoordinate oid,
    childidtowidth oid,
    childidtoheight oid,
    label text,
    foregroundcolorred integer,
    backgroundcolorred integer,
    backgroundcolorgreen integer,
    backgroundcolorblue integer,
    namehasbeenexplicitlyset boolean,
    foregroundcolorgreen integer,
    foregroundcolorblue integer,
    fontfamily character varying(255),
    hyperlink text,
    valuespace text,
    maximumvalue text,
    minimumvalue text,
    validation text,
    componentpropertiesvalues oid,
    templatecomponentproperties oid
);


ALTER TABLE uiartifact OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 23202)
-- Name: uiartifactdescriptor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE uiartifactdescriptor (
    artifactid integer NOT NULL,
    embeddeddescriptors oid,
    name character varying(255),
    templateid integer NOT NULL,
    artifactpk integer NOT NULL,
    componenttypeid character varying(255)
);


ALTER TABLE uiartifactdescriptor OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 23210)
-- Name: updatebundledescriptor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE updatebundledescriptor (
    id integer NOT NULL,
    filename character varying(255),
    updateversion character varying(255),
    bundledeployeddate timestamp without time zone,
    changedescription text,
    bundleinstalleddate timestamp without time zone,
    checksum bigint NOT NULL,
    requiredversions bytea
);


ALTER TABLE updatebundledescriptor OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 23218)
-- Name: viewpermission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE viewpermission (
    pk integer NOT NULL,
    managedobjectid integer,
    distinguisedname character varying(255)
);


ALTER TABLE viewpermission OWNER TO postgres;

--
-- TOC entry 2479 (class 2613 OID 23496)
-- Name: 23496; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23496');


ALTER LARGE OBJECT 23496 OWNER TO postgres;

--
-- TOC entry 2480 (class 2613 OID 23497)
-- Name: 23497; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23497');


ALTER LARGE OBJECT 23497 OWNER TO postgres;

--
-- TOC entry 2481 (class 2613 OID 23498)
-- Name: 23498; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23498');


ALTER LARGE OBJECT 23498 OWNER TO postgres;

--
-- TOC entry 2482 (class 2613 OID 23499)
-- Name: 23499; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23499');


ALTER LARGE OBJECT 23499 OWNER TO postgres;

--
-- TOC entry 2483 (class 2613 OID 23500)
-- Name: 23500; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23500');


ALTER LARGE OBJECT 23500 OWNER TO postgres;

--
-- TOC entry 2484 (class 2613 OID 23501)
-- Name: 23501; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23501');


ALTER LARGE OBJECT 23501 OWNER TO postgres;

--
-- TOC entry 2485 (class 2613 OID 23502)
-- Name: 23502; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23502');


ALTER LARGE OBJECT 23502 OWNER TO postgres;

--
-- TOC entry 2486 (class 2613 OID 23503)
-- Name: 23503; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23503');


ALTER LARGE OBJECT 23503 OWNER TO postgres;

--
-- TOC entry 2487 (class 2613 OID 23504)
-- Name: 23504; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23504');


ALTER LARGE OBJECT 23504 OWNER TO postgres;

--
-- TOC entry 2488 (class 2613 OID 23505)
-- Name: 23505; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23505');


ALTER LARGE OBJECT 23505 OWNER TO postgres;

--
-- TOC entry 2489 (class 2613 OID 23506)
-- Name: 23506; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23506');


ALTER LARGE OBJECT 23506 OWNER TO postgres;

--
-- TOC entry 2490 (class 2613 OID 23507)
-- Name: 23507; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23507');


ALTER LARGE OBJECT 23507 OWNER TO postgres;

--
-- TOC entry 2491 (class 2613 OID 23508)
-- Name: 23508; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23508');


ALTER LARGE OBJECT 23508 OWNER TO postgres;

--
-- TOC entry 2492 (class 2613 OID 23509)
-- Name: 23509; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23509');


ALTER LARGE OBJECT 23509 OWNER TO postgres;

--
-- TOC entry 2493 (class 2613 OID 23510)
-- Name: 23510; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23510');


ALTER LARGE OBJECT 23510 OWNER TO postgres;

--
-- TOC entry 2494 (class 2613 OID 23511)
-- Name: 23511; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23511');


ALTER LARGE OBJECT 23511 OWNER TO postgres;

--
-- TOC entry 2495 (class 2613 OID 23512)
-- Name: 23512; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23512');


ALTER LARGE OBJECT 23512 OWNER TO postgres;

--
-- TOC entry 2496 (class 2613 OID 23513)
-- Name: 23513; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23513');


ALTER LARGE OBJECT 23513 OWNER TO postgres;

--
-- TOC entry 2497 (class 2613 OID 23514)
-- Name: 23514; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23514');


ALTER LARGE OBJECT 23514 OWNER TO postgres;

--
-- TOC entry 2498 (class 2613 OID 23515)
-- Name: 23515; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23515');


ALTER LARGE OBJECT 23515 OWNER TO postgres;

--
-- TOC entry 2499 (class 2613 OID 23516)
-- Name: 23516; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23516');


ALTER LARGE OBJECT 23516 OWNER TO postgres;

--
-- TOC entry 2500 (class 2613 OID 23517)
-- Name: 23517; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23517');


ALTER LARGE OBJECT 23517 OWNER TO postgres;

--
-- TOC entry 2501 (class 2613 OID 23518)
-- Name: 23518; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23518');


ALTER LARGE OBJECT 23518 OWNER TO postgres;

--
-- TOC entry 2502 (class 2613 OID 23519)
-- Name: 23519; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23519');


ALTER LARGE OBJECT 23519 OWNER TO postgres;

--
-- TOC entry 2503 (class 2613 OID 23520)
-- Name: 23520; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23520');


ALTER LARGE OBJECT 23520 OWNER TO postgres;

--
-- TOC entry 2504 (class 2613 OID 23521)
-- Name: 23521; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23521');


ALTER LARGE OBJECT 23521 OWNER TO postgres;

--
-- TOC entry 2505 (class 2613 OID 23522)
-- Name: 23522; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23522');


ALTER LARGE OBJECT 23522 OWNER TO postgres;

--
-- TOC entry 2506 (class 2613 OID 23523)
-- Name: 23523; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23523');


ALTER LARGE OBJECT 23523 OWNER TO postgres;

--
-- TOC entry 2507 (class 2613 OID 23524)
-- Name: 23524; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23524');


ALTER LARGE OBJECT 23524 OWNER TO postgres;

--
-- TOC entry 2508 (class 2613 OID 23526)
-- Name: 23526; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23526');


ALTER LARGE OBJECT 23526 OWNER TO postgres;

--
-- TOC entry 2509 (class 2613 OID 23528)
-- Name: 23528; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23528');


ALTER LARGE OBJECT 23528 OWNER TO postgres;

--
-- TOC entry 2510 (class 2613 OID 23529)
-- Name: 23529; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23529');


ALTER LARGE OBJECT 23529 OWNER TO postgres;

--
-- TOC entry 2511 (class 2613 OID 23530)
-- Name: 23530; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23530');


ALTER LARGE OBJECT 23530 OWNER TO postgres;

--
-- TOC entry 2512 (class 2613 OID 23531)
-- Name: 23531; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23531');


ALTER LARGE OBJECT 23531 OWNER TO postgres;

--
-- TOC entry 2513 (class 2613 OID 23532)
-- Name: 23532; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23532');


ALTER LARGE OBJECT 23532 OWNER TO postgres;

--
-- TOC entry 2514 (class 2613 OID 23533)
-- Name: 23533; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23533');


ALTER LARGE OBJECT 23533 OWNER TO postgres;

--
-- TOC entry 2515 (class 2613 OID 23534)
-- Name: 23534; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23534');


ALTER LARGE OBJECT 23534 OWNER TO postgres;

--
-- TOC entry 2516 (class 2613 OID 23535)
-- Name: 23535; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23535');


ALTER LARGE OBJECT 23535 OWNER TO postgres;

--
-- TOC entry 2517 (class 2613 OID 23536)
-- Name: 23536; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23536');


ALTER LARGE OBJECT 23536 OWNER TO postgres;

--
-- TOC entry 2518 (class 2613 OID 23537)
-- Name: 23537; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23537');


ALTER LARGE OBJECT 23537 OWNER TO postgres;

--
-- TOC entry 2519 (class 2613 OID 23538)
-- Name: 23538; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23538');


ALTER LARGE OBJECT 23538 OWNER TO postgres;

--
-- TOC entry 2520 (class 2613 OID 23539)
-- Name: 23539; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23539');


ALTER LARGE OBJECT 23539 OWNER TO postgres;

--
-- TOC entry 2521 (class 2613 OID 23540)
-- Name: 23540; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23540');


ALTER LARGE OBJECT 23540 OWNER TO postgres;

--
-- TOC entry 2522 (class 2613 OID 23541)
-- Name: 23541; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23541');


ALTER LARGE OBJECT 23541 OWNER TO postgres;

--
-- TOC entry 2523 (class 2613 OID 23542)
-- Name: 23542; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23542');


ALTER LARGE OBJECT 23542 OWNER TO postgres;

--
-- TOC entry 2524 (class 2613 OID 23543)
-- Name: 23543; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23543');


ALTER LARGE OBJECT 23543 OWNER TO postgres;

--
-- TOC entry 2525 (class 2613 OID 23544)
-- Name: 23544; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23544');


ALTER LARGE OBJECT 23544 OWNER TO postgres;

--
-- TOC entry 2526 (class 2613 OID 23545)
-- Name: 23545; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23545');


ALTER LARGE OBJECT 23545 OWNER TO postgres;

--
-- TOC entry 2527 (class 2613 OID 23546)
-- Name: 23546; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23546');


ALTER LARGE OBJECT 23546 OWNER TO postgres;

--
-- TOC entry 2528 (class 2613 OID 23547)
-- Name: 23547; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23547');


ALTER LARGE OBJECT 23547 OWNER TO postgres;

--
-- TOC entry 2529 (class 2613 OID 23548)
-- Name: 23548; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23548');


ALTER LARGE OBJECT 23548 OWNER TO postgres;

--
-- TOC entry 2530 (class 2613 OID 23549)
-- Name: 23549; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23549');


ALTER LARGE OBJECT 23549 OWNER TO postgres;

--
-- TOC entry 2531 (class 2613 OID 23550)
-- Name: 23550; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23550');


ALTER LARGE OBJECT 23550 OWNER TO postgres;

--
-- TOC entry 2532 (class 2613 OID 23551)
-- Name: 23551; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23551');


ALTER LARGE OBJECT 23551 OWNER TO postgres;

--
-- TOC entry 2533 (class 2613 OID 23552)
-- Name: 23552; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23552');


ALTER LARGE OBJECT 23552 OWNER TO postgres;

--
-- TOC entry 2534 (class 2613 OID 23553)
-- Name: 23553; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23553');


ALTER LARGE OBJECT 23553 OWNER TO postgres;

--
-- TOC entry 2535 (class 2613 OID 23554)
-- Name: 23554; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23554');


ALTER LARGE OBJECT 23554 OWNER TO postgres;

--
-- TOC entry 2536 (class 2613 OID 23555)
-- Name: 23555; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23555');


ALTER LARGE OBJECT 23555 OWNER TO postgres;

--
-- TOC entry 2537 (class 2613 OID 23556)
-- Name: 23556; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23556');


ALTER LARGE OBJECT 23556 OWNER TO postgres;

--
-- TOC entry 2538 (class 2613 OID 23557)
-- Name: 23557; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23557');


ALTER LARGE OBJECT 23557 OWNER TO postgres;

--
-- TOC entry 2539 (class 2613 OID 23558)
-- Name: 23558; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23558');


ALTER LARGE OBJECT 23558 OWNER TO postgres;

--
-- TOC entry 2540 (class 2613 OID 23559)
-- Name: 23559; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23559');


ALTER LARGE OBJECT 23559 OWNER TO postgres;

--
-- TOC entry 2541 (class 2613 OID 23560)
-- Name: 23560; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23560');


ALTER LARGE OBJECT 23560 OWNER TO postgres;

--
-- TOC entry 2542 (class 2613 OID 23561)
-- Name: 23561; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23561');


ALTER LARGE OBJECT 23561 OWNER TO postgres;

--
-- TOC entry 2543 (class 2613 OID 23562)
-- Name: 23562; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23562');


ALTER LARGE OBJECT 23562 OWNER TO postgres;

--
-- TOC entry 2544 (class 2613 OID 23563)
-- Name: 23563; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23563');


ALTER LARGE OBJECT 23563 OWNER TO postgres;

--
-- TOC entry 2545 (class 2613 OID 23564)
-- Name: 23564; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23564');


ALTER LARGE OBJECT 23564 OWNER TO postgres;

--
-- TOC entry 2546 (class 2613 OID 23565)
-- Name: 23565; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23565');


ALTER LARGE OBJECT 23565 OWNER TO postgres;

--
-- TOC entry 2547 (class 2613 OID 23566)
-- Name: 23566; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23566');


ALTER LARGE OBJECT 23566 OWNER TO postgres;

--
-- TOC entry 2548 (class 2613 OID 23567)
-- Name: 23567; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23567');


ALTER LARGE OBJECT 23567 OWNER TO postgres;

--
-- TOC entry 2549 (class 2613 OID 23568)
-- Name: 23568; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23568');


ALTER LARGE OBJECT 23568 OWNER TO postgres;

--
-- TOC entry 2550 (class 2613 OID 23569)
-- Name: 23569; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23569');


ALTER LARGE OBJECT 23569 OWNER TO postgres;

--
-- TOC entry 2551 (class 2613 OID 23570)
-- Name: 23570; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23570');


ALTER LARGE OBJECT 23570 OWNER TO postgres;

--
-- TOC entry 2552 (class 2613 OID 23571)
-- Name: 23571; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23571');


ALTER LARGE OBJECT 23571 OWNER TO postgres;

--
-- TOC entry 2553 (class 2613 OID 23572)
-- Name: 23572; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23572');


ALTER LARGE OBJECT 23572 OWNER TO postgres;

--
-- TOC entry 2554 (class 2613 OID 23573)
-- Name: 23573; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23573');


ALTER LARGE OBJECT 23573 OWNER TO postgres;

--
-- TOC entry 2555 (class 2613 OID 23574)
-- Name: 23574; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23574');


ALTER LARGE OBJECT 23574 OWNER TO postgres;

--
-- TOC entry 2556 (class 2613 OID 23575)
-- Name: 23575; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23575');


ALTER LARGE OBJECT 23575 OWNER TO postgres;

--
-- TOC entry 2557 (class 2613 OID 23576)
-- Name: 23576; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23576');


ALTER LARGE OBJECT 23576 OWNER TO postgres;

--
-- TOC entry 2558 (class 2613 OID 23577)
-- Name: 23577; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23577');


ALTER LARGE OBJECT 23577 OWNER TO postgres;

--
-- TOC entry 2559 (class 2613 OID 23578)
-- Name: 23578; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23578');


ALTER LARGE OBJECT 23578 OWNER TO postgres;

--
-- TOC entry 2560 (class 2613 OID 23579)
-- Name: 23579; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23579');


ALTER LARGE OBJECT 23579 OWNER TO postgres;

--
-- TOC entry 2561 (class 2613 OID 23580)
-- Name: 23580; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23580');


ALTER LARGE OBJECT 23580 OWNER TO postgres;

--
-- TOC entry 2562 (class 2613 OID 23581)
-- Name: 23581; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23581');


ALTER LARGE OBJECT 23581 OWNER TO postgres;

--
-- TOC entry 2563 (class 2613 OID 23582)
-- Name: 23582; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23582');


ALTER LARGE OBJECT 23582 OWNER TO postgres;

--
-- TOC entry 2564 (class 2613 OID 23583)
-- Name: 23583; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23583');


ALTER LARGE OBJECT 23583 OWNER TO postgres;

--
-- TOC entry 2565 (class 2613 OID 23584)
-- Name: 23584; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23584');


ALTER LARGE OBJECT 23584 OWNER TO postgres;

--
-- TOC entry 2566 (class 2613 OID 23585)
-- Name: 23585; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23585');


ALTER LARGE OBJECT 23585 OWNER TO postgres;

--
-- TOC entry 2567 (class 2613 OID 23586)
-- Name: 23586; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23586');


ALTER LARGE OBJECT 23586 OWNER TO postgres;

--
-- TOC entry 2568 (class 2613 OID 23587)
-- Name: 23587; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23587');


ALTER LARGE OBJECT 23587 OWNER TO postgres;

--
-- TOC entry 2569 (class 2613 OID 23588)
-- Name: 23588; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23588');


ALTER LARGE OBJECT 23588 OWNER TO postgres;

--
-- TOC entry 2570 (class 2613 OID 23589)
-- Name: 23589; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23589');


ALTER LARGE OBJECT 23589 OWNER TO postgres;

--
-- TOC entry 2571 (class 2613 OID 23590)
-- Name: 23590; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23590');


ALTER LARGE OBJECT 23590 OWNER TO postgres;

--
-- TOC entry 2572 (class 2613 OID 23591)
-- Name: 23591; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23591');


ALTER LARGE OBJECT 23591 OWNER TO postgres;

--
-- TOC entry 2573 (class 2613 OID 23592)
-- Name: 23592; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23592');


ALTER LARGE OBJECT 23592 OWNER TO postgres;

--
-- TOC entry 2574 (class 2613 OID 23593)
-- Name: 23593; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23593');


ALTER LARGE OBJECT 23593 OWNER TO postgres;

--
-- TOC entry 2575 (class 2613 OID 23594)
-- Name: 23594; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23594');


ALTER LARGE OBJECT 23594 OWNER TO postgres;

--
-- TOC entry 2576 (class 2613 OID 23595)
-- Name: 23595; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23595');


ALTER LARGE OBJECT 23595 OWNER TO postgres;

--
-- TOC entry 2577 (class 2613 OID 23596)
-- Name: 23596; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23596');


ALTER LARGE OBJECT 23596 OWNER TO postgres;

--
-- TOC entry 2578 (class 2613 OID 23597)
-- Name: 23597; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23597');


ALTER LARGE OBJECT 23597 OWNER TO postgres;

--
-- TOC entry 2579 (class 2613 OID 23598)
-- Name: 23598; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23598');


ALTER LARGE OBJECT 23598 OWNER TO postgres;

--
-- TOC entry 2580 (class 2613 OID 23599)
-- Name: 23599; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23599');


ALTER LARGE OBJECT 23599 OWNER TO postgres;

--
-- TOC entry 2581 (class 2613 OID 23600)
-- Name: 23600; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23600');


ALTER LARGE OBJECT 23600 OWNER TO postgres;

--
-- TOC entry 2582 (class 2613 OID 23601)
-- Name: 23601; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23601');


ALTER LARGE OBJECT 23601 OWNER TO postgres;

--
-- TOC entry 2583 (class 2613 OID 23602)
-- Name: 23602; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23602');


ALTER LARGE OBJECT 23602 OWNER TO postgres;

--
-- TOC entry 2584 (class 2613 OID 23603)
-- Name: 23603; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23603');


ALTER LARGE OBJECT 23603 OWNER TO postgres;

--
-- TOC entry 2585 (class 2613 OID 23604)
-- Name: 23604; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23604');


ALTER LARGE OBJECT 23604 OWNER TO postgres;

--
-- TOC entry 2586 (class 2613 OID 23605)
-- Name: 23605; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23605');


ALTER LARGE OBJECT 23605 OWNER TO postgres;

--
-- TOC entry 2587 (class 2613 OID 23606)
-- Name: 23606; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23606');


ALTER LARGE OBJECT 23606 OWNER TO postgres;

--
-- TOC entry 2588 (class 2613 OID 23607)
-- Name: 23607; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23607');


ALTER LARGE OBJECT 23607 OWNER TO postgres;

--
-- TOC entry 2589 (class 2613 OID 23608)
-- Name: 23608; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23608');


ALTER LARGE OBJECT 23608 OWNER TO postgres;

--
-- TOC entry 2590 (class 2613 OID 23609)
-- Name: 23609; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23609');


ALTER LARGE OBJECT 23609 OWNER TO postgres;

--
-- TOC entry 2591 (class 2613 OID 23610)
-- Name: 23610; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23610');


ALTER LARGE OBJECT 23610 OWNER TO postgres;

--
-- TOC entry 2592 (class 2613 OID 23611)
-- Name: 23611; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23611');


ALTER LARGE OBJECT 23611 OWNER TO postgres;

--
-- TOC entry 2593 (class 2613 OID 23612)
-- Name: 23612; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23612');


ALTER LARGE OBJECT 23612 OWNER TO postgres;

--
-- TOC entry 2594 (class 2613 OID 23613)
-- Name: 23613; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23613');


ALTER LARGE OBJECT 23613 OWNER TO postgres;

--
-- TOC entry 2595 (class 2613 OID 23614)
-- Name: 23614; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23614');


ALTER LARGE OBJECT 23614 OWNER TO postgres;

--
-- TOC entry 2596 (class 2613 OID 23615)
-- Name: 23615; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23615');


ALTER LARGE OBJECT 23615 OWNER TO postgres;

--
-- TOC entry 2597 (class 2613 OID 23616)
-- Name: 23616; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23616');


ALTER LARGE OBJECT 23616 OWNER TO postgres;

--
-- TOC entry 2598 (class 2613 OID 23617)
-- Name: 23617; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23617');


ALTER LARGE OBJECT 23617 OWNER TO postgres;

--
-- TOC entry 2599 (class 2613 OID 23618)
-- Name: 23618; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23618');


ALTER LARGE OBJECT 23618 OWNER TO postgres;

--
-- TOC entry 2600 (class 2613 OID 23619)
-- Name: 23619; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23619');


ALTER LARGE OBJECT 23619 OWNER TO postgres;

--
-- TOC entry 2601 (class 2613 OID 23620)
-- Name: 23620; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23620');


ALTER LARGE OBJECT 23620 OWNER TO postgres;

--
-- TOC entry 2602 (class 2613 OID 23621)
-- Name: 23621; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23621');


ALTER LARGE OBJECT 23621 OWNER TO postgres;

--
-- TOC entry 2603 (class 2613 OID 23622)
-- Name: 23622; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23622');


ALTER LARGE OBJECT 23622 OWNER TO postgres;

--
-- TOC entry 2604 (class 2613 OID 23623)
-- Name: 23623; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23623');


ALTER LARGE OBJECT 23623 OWNER TO postgres;

--
-- TOC entry 2605 (class 2613 OID 23624)
-- Name: 23624; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23624');


ALTER LARGE OBJECT 23624 OWNER TO postgres;

--
-- TOC entry 2606 (class 2613 OID 23625)
-- Name: 23625; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23625');


ALTER LARGE OBJECT 23625 OWNER TO postgres;

--
-- TOC entry 2607 (class 2613 OID 23626)
-- Name: 23626; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23626');


ALTER LARGE OBJECT 23626 OWNER TO postgres;

--
-- TOC entry 2608 (class 2613 OID 23627)
-- Name: 23627; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23627');


ALTER LARGE OBJECT 23627 OWNER TO postgres;

--
-- TOC entry 2609 (class 2613 OID 23628)
-- Name: 23628; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23628');


ALTER LARGE OBJECT 23628 OWNER TO postgres;

--
-- TOC entry 2610 (class 2613 OID 23629)
-- Name: 23629; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23629');


ALTER LARGE OBJECT 23629 OWNER TO postgres;

--
-- TOC entry 2611 (class 2613 OID 23630)
-- Name: 23630; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23630');


ALTER LARGE OBJECT 23630 OWNER TO postgres;

--
-- TOC entry 2612 (class 2613 OID 23631)
-- Name: 23631; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23631');


ALTER LARGE OBJECT 23631 OWNER TO postgres;

--
-- TOC entry 2613 (class 2613 OID 23632)
-- Name: 23632; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23632');


ALTER LARGE OBJECT 23632 OWNER TO postgres;

--
-- TOC entry 2614 (class 2613 OID 23633)
-- Name: 23633; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23633');


ALTER LARGE OBJECT 23633 OWNER TO postgres;

--
-- TOC entry 2615 (class 2613 OID 23634)
-- Name: 23634; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23634');


ALTER LARGE OBJECT 23634 OWNER TO postgres;

--
-- TOC entry 2616 (class 2613 OID 23635)
-- Name: 23635; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23635');


ALTER LARGE OBJECT 23635 OWNER TO postgres;

--
-- TOC entry 2617 (class 2613 OID 23636)
-- Name: 23636; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23636');


ALTER LARGE OBJECT 23636 OWNER TO postgres;

--
-- TOC entry 2618 (class 2613 OID 23637)
-- Name: 23637; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23637');


ALTER LARGE OBJECT 23637 OWNER TO postgres;

--
-- TOC entry 2619 (class 2613 OID 23638)
-- Name: 23638; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23638');


ALTER LARGE OBJECT 23638 OWNER TO postgres;

--
-- TOC entry 2620 (class 2613 OID 23639)
-- Name: 23639; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23639');


ALTER LARGE OBJECT 23639 OWNER TO postgres;

--
-- TOC entry 2621 (class 2613 OID 23640)
-- Name: 23640; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23640');


ALTER LARGE OBJECT 23640 OWNER TO postgres;

--
-- TOC entry 2622 (class 2613 OID 23641)
-- Name: 23641; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23641');


ALTER LARGE OBJECT 23641 OWNER TO postgres;

--
-- TOC entry 2623 (class 2613 OID 23642)
-- Name: 23642; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23642');


ALTER LARGE OBJECT 23642 OWNER TO postgres;

--
-- TOC entry 2624 (class 2613 OID 23643)
-- Name: 23643; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23643');


ALTER LARGE OBJECT 23643 OWNER TO postgres;

--
-- TOC entry 2625 (class 2613 OID 23644)
-- Name: 23644; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23644');


ALTER LARGE OBJECT 23644 OWNER TO postgres;

--
-- TOC entry 2626 (class 2613 OID 23645)
-- Name: 23645; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23645');


ALTER LARGE OBJECT 23645 OWNER TO postgres;

--
-- TOC entry 2627 (class 2613 OID 23646)
-- Name: 23646; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23646');


ALTER LARGE OBJECT 23646 OWNER TO postgres;

--
-- TOC entry 2628 (class 2613 OID 23647)
-- Name: 23647; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23647');


ALTER LARGE OBJECT 23647 OWNER TO postgres;

--
-- TOC entry 2629 (class 2613 OID 23648)
-- Name: 23648; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23648');


ALTER LARGE OBJECT 23648 OWNER TO postgres;

--
-- TOC entry 2630 (class 2613 OID 23649)
-- Name: 23649; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23649');


ALTER LARGE OBJECT 23649 OWNER TO postgres;

--
-- TOC entry 2631 (class 2613 OID 23650)
-- Name: 23650; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23650');


ALTER LARGE OBJECT 23650 OWNER TO postgres;

--
-- TOC entry 2632 (class 2613 OID 23651)
-- Name: 23651; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23651');


ALTER LARGE OBJECT 23651 OWNER TO postgres;

--
-- TOC entry 2633 (class 2613 OID 23652)
-- Name: 23652; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23652');


ALTER LARGE OBJECT 23652 OWNER TO postgres;

--
-- TOC entry 2634 (class 2613 OID 23653)
-- Name: 23653; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23653');


ALTER LARGE OBJECT 23653 OWNER TO postgres;

--
-- TOC entry 2635 (class 2613 OID 23654)
-- Name: 23654; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23654');


ALTER LARGE OBJECT 23654 OWNER TO postgres;

--
-- TOC entry 2636 (class 2613 OID 23655)
-- Name: 23655; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23655');


ALTER LARGE OBJECT 23655 OWNER TO postgres;

--
-- TOC entry 2637 (class 2613 OID 23656)
-- Name: 23656; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23656');


ALTER LARGE OBJECT 23656 OWNER TO postgres;

--
-- TOC entry 2638 (class 2613 OID 23657)
-- Name: 23657; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23657');


ALTER LARGE OBJECT 23657 OWNER TO postgres;

--
-- TOC entry 2639 (class 2613 OID 23658)
-- Name: 23658; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23658');


ALTER LARGE OBJECT 23658 OWNER TO postgres;

--
-- TOC entry 2640 (class 2613 OID 23659)
-- Name: 23659; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23659');


ALTER LARGE OBJECT 23659 OWNER TO postgres;

--
-- TOC entry 2641 (class 2613 OID 23660)
-- Name: 23660; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23660');


ALTER LARGE OBJECT 23660 OWNER TO postgres;

--
-- TOC entry 2642 (class 2613 OID 23661)
-- Name: 23661; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23661');


ALTER LARGE OBJECT 23661 OWNER TO postgres;

--
-- TOC entry 2643 (class 2613 OID 23662)
-- Name: 23662; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23662');


ALTER LARGE OBJECT 23662 OWNER TO postgres;

--
-- TOC entry 2644 (class 2613 OID 23663)
-- Name: 23663; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23663');


ALTER LARGE OBJECT 23663 OWNER TO postgres;

--
-- TOC entry 2645 (class 2613 OID 23664)
-- Name: 23664; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23664');


ALTER LARGE OBJECT 23664 OWNER TO postgres;

--
-- TOC entry 2646 (class 2613 OID 23665)
-- Name: 23665; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23665');


ALTER LARGE OBJECT 23665 OWNER TO postgres;

--
-- TOC entry 2647 (class 2613 OID 23666)
-- Name: 23666; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23666');


ALTER LARGE OBJECT 23666 OWNER TO postgres;

--
-- TOC entry 2648 (class 2613 OID 23667)
-- Name: 23667; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23667');


ALTER LARGE OBJECT 23667 OWNER TO postgres;

--
-- TOC entry 2649 (class 2613 OID 23668)
-- Name: 23668; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23668');


ALTER LARGE OBJECT 23668 OWNER TO postgres;

--
-- TOC entry 2650 (class 2613 OID 23669)
-- Name: 23669; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23669');


ALTER LARGE OBJECT 23669 OWNER TO postgres;

--
-- TOC entry 2651 (class 2613 OID 23670)
-- Name: 23670; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23670');


ALTER LARGE OBJECT 23670 OWNER TO postgres;

--
-- TOC entry 2652 (class 2613 OID 23671)
-- Name: 23671; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23671');


ALTER LARGE OBJECT 23671 OWNER TO postgres;

--
-- TOC entry 2653 (class 2613 OID 23672)
-- Name: 23672; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23672');


ALTER LARGE OBJECT 23672 OWNER TO postgres;

--
-- TOC entry 2654 (class 2613 OID 23673)
-- Name: 23673; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23673');


ALTER LARGE OBJECT 23673 OWNER TO postgres;

--
-- TOC entry 2655 (class 2613 OID 23674)
-- Name: 23674; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23674');


ALTER LARGE OBJECT 23674 OWNER TO postgres;

--
-- TOC entry 2656 (class 2613 OID 23675)
-- Name: 23675; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23675');


ALTER LARGE OBJECT 23675 OWNER TO postgres;

--
-- TOC entry 2657 (class 2613 OID 23676)
-- Name: 23676; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23676');


ALTER LARGE OBJECT 23676 OWNER TO postgres;

--
-- TOC entry 2658 (class 2613 OID 23677)
-- Name: 23677; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23677');


ALTER LARGE OBJECT 23677 OWNER TO postgres;

--
-- TOC entry 2659 (class 2613 OID 23678)
-- Name: 23678; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23678');


ALTER LARGE OBJECT 23678 OWNER TO postgres;

--
-- TOC entry 2660 (class 2613 OID 23679)
-- Name: 23679; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23679');


ALTER LARGE OBJECT 23679 OWNER TO postgres;

--
-- TOC entry 2661 (class 2613 OID 23680)
-- Name: 23680; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23680');


ALTER LARGE OBJECT 23680 OWNER TO postgres;

--
-- TOC entry 2662 (class 2613 OID 23681)
-- Name: 23681; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23681');


ALTER LARGE OBJECT 23681 OWNER TO postgres;

--
-- TOC entry 2663 (class 2613 OID 23682)
-- Name: 23682; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23682');


ALTER LARGE OBJECT 23682 OWNER TO postgres;

--
-- TOC entry 2664 (class 2613 OID 23683)
-- Name: 23683; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23683');


ALTER LARGE OBJECT 23683 OWNER TO postgres;

--
-- TOC entry 2665 (class 2613 OID 23684)
-- Name: 23684; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23684');


ALTER LARGE OBJECT 23684 OWNER TO postgres;

--
-- TOC entry 2666 (class 2613 OID 23685)
-- Name: 23685; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23685');


ALTER LARGE OBJECT 23685 OWNER TO postgres;

--
-- TOC entry 2667 (class 2613 OID 23686)
-- Name: 23686; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23686');


ALTER LARGE OBJECT 23686 OWNER TO postgres;

--
-- TOC entry 2668 (class 2613 OID 23687)
-- Name: 23687; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23687');


ALTER LARGE OBJECT 23687 OWNER TO postgres;

--
-- TOC entry 2669 (class 2613 OID 23688)
-- Name: 23688; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23688');


ALTER LARGE OBJECT 23688 OWNER TO postgres;

--
-- TOC entry 2670 (class 2613 OID 23689)
-- Name: 23689; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23689');


ALTER LARGE OBJECT 23689 OWNER TO postgres;

--
-- TOC entry 2671 (class 2613 OID 23690)
-- Name: 23690; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23690');


ALTER LARGE OBJECT 23690 OWNER TO postgres;

--
-- TOC entry 2672 (class 2613 OID 23691)
-- Name: 23691; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23691');


ALTER LARGE OBJECT 23691 OWNER TO postgres;

--
-- TOC entry 2673 (class 2613 OID 23692)
-- Name: 23692; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23692');


ALTER LARGE OBJECT 23692 OWNER TO postgres;

--
-- TOC entry 2674 (class 2613 OID 23693)
-- Name: 23693; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23693');


ALTER LARGE OBJECT 23693 OWNER TO postgres;

--
-- TOC entry 2675 (class 2613 OID 23694)
-- Name: 23694; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23694');


ALTER LARGE OBJECT 23694 OWNER TO postgres;

--
-- TOC entry 2676 (class 2613 OID 23695)
-- Name: 23695; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23695');


ALTER LARGE OBJECT 23695 OWNER TO postgres;

--
-- TOC entry 2677 (class 2613 OID 23696)
-- Name: 23696; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23696');


ALTER LARGE OBJECT 23696 OWNER TO postgres;

--
-- TOC entry 2678 (class 2613 OID 23697)
-- Name: 23697; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23697');


ALTER LARGE OBJECT 23697 OWNER TO postgres;

--
-- TOC entry 2679 (class 2613 OID 23698)
-- Name: 23698; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23698');


ALTER LARGE OBJECT 23698 OWNER TO postgres;

--
-- TOC entry 2680 (class 2613 OID 23699)
-- Name: 23699; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23699');


ALTER LARGE OBJECT 23699 OWNER TO postgres;

--
-- TOC entry 2681 (class 2613 OID 23700)
-- Name: 23700; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23700');


ALTER LARGE OBJECT 23700 OWNER TO postgres;

--
-- TOC entry 2682 (class 2613 OID 23701)
-- Name: 23701; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23701');


ALTER LARGE OBJECT 23701 OWNER TO postgres;

--
-- TOC entry 2683 (class 2613 OID 23702)
-- Name: 23702; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23702');


ALTER LARGE OBJECT 23702 OWNER TO postgres;

--
-- TOC entry 2684 (class 2613 OID 23703)
-- Name: 23703; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23703');


ALTER LARGE OBJECT 23703 OWNER TO postgres;

--
-- TOC entry 2685 (class 2613 OID 23704)
-- Name: 23704; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23704');


ALTER LARGE OBJECT 23704 OWNER TO postgres;

--
-- TOC entry 2686 (class 2613 OID 23705)
-- Name: 23705; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23705');


ALTER LARGE OBJECT 23705 OWNER TO postgres;

--
-- TOC entry 2687 (class 2613 OID 23706)
-- Name: 23706; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23706');


ALTER LARGE OBJECT 23706 OWNER TO postgres;

--
-- TOC entry 2688 (class 2613 OID 23707)
-- Name: 23707; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23707');


ALTER LARGE OBJECT 23707 OWNER TO postgres;

--
-- TOC entry 2689 (class 2613 OID 23708)
-- Name: 23708; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23708');


ALTER LARGE OBJECT 23708 OWNER TO postgres;

--
-- TOC entry 2690 (class 2613 OID 23709)
-- Name: 23709; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23709');


ALTER LARGE OBJECT 23709 OWNER TO postgres;

--
-- TOC entry 2691 (class 2613 OID 23710)
-- Name: 23710; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23710');


ALTER LARGE OBJECT 23710 OWNER TO postgres;

--
-- TOC entry 2692 (class 2613 OID 23711)
-- Name: 23711; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23711');


ALTER LARGE OBJECT 23711 OWNER TO postgres;

--
-- TOC entry 2693 (class 2613 OID 23712)
-- Name: 23712; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23712');


ALTER LARGE OBJECT 23712 OWNER TO postgres;

--
-- TOC entry 2694 (class 2613 OID 23713)
-- Name: 23713; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23713');


ALTER LARGE OBJECT 23713 OWNER TO postgres;

--
-- TOC entry 2695 (class 2613 OID 23714)
-- Name: 23714; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23714');


ALTER LARGE OBJECT 23714 OWNER TO postgres;

--
-- TOC entry 2696 (class 2613 OID 23715)
-- Name: 23715; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23715');


ALTER LARGE OBJECT 23715 OWNER TO postgres;

--
-- TOC entry 2697 (class 2613 OID 23716)
-- Name: 23716; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23716');


ALTER LARGE OBJECT 23716 OWNER TO postgres;

--
-- TOC entry 2698 (class 2613 OID 23717)
-- Name: 23717; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23717');


ALTER LARGE OBJECT 23717 OWNER TO postgres;

--
-- TOC entry 2699 (class 2613 OID 23718)
-- Name: 23718; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23718');


ALTER LARGE OBJECT 23718 OWNER TO postgres;

--
-- TOC entry 2700 (class 2613 OID 23719)
-- Name: 23719; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23719');


ALTER LARGE OBJECT 23719 OWNER TO postgres;

--
-- TOC entry 2701 (class 2613 OID 23720)
-- Name: 23720; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23720');


ALTER LARGE OBJECT 23720 OWNER TO postgres;

--
-- TOC entry 2702 (class 2613 OID 23721)
-- Name: 23721; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23721');


ALTER LARGE OBJECT 23721 OWNER TO postgres;

--
-- TOC entry 2703 (class 2613 OID 23722)
-- Name: 23722; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23722');


ALTER LARGE OBJECT 23722 OWNER TO postgres;

--
-- TOC entry 2704 (class 2613 OID 23723)
-- Name: 23723; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23723');


ALTER LARGE OBJECT 23723 OWNER TO postgres;

--
-- TOC entry 2705 (class 2613 OID 23724)
-- Name: 23724; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23724');


ALTER LARGE OBJECT 23724 OWNER TO postgres;

--
-- TOC entry 2706 (class 2613 OID 23725)
-- Name: 23725; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23725');


ALTER LARGE OBJECT 23725 OWNER TO postgres;

--
-- TOC entry 2707 (class 2613 OID 23726)
-- Name: 23726; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23726');


ALTER LARGE OBJECT 23726 OWNER TO postgres;

--
-- TOC entry 2708 (class 2613 OID 23727)
-- Name: 23727; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23727');


ALTER LARGE OBJECT 23727 OWNER TO postgres;

--
-- TOC entry 2709 (class 2613 OID 23728)
-- Name: 23728; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23728');


ALTER LARGE OBJECT 23728 OWNER TO postgres;

--
-- TOC entry 2710 (class 2613 OID 23729)
-- Name: 23729; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23729');


ALTER LARGE OBJECT 23729 OWNER TO postgres;

--
-- TOC entry 2711 (class 2613 OID 23730)
-- Name: 23730; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23730');


ALTER LARGE OBJECT 23730 OWNER TO postgres;

--
-- TOC entry 2712 (class 2613 OID 23731)
-- Name: 23731; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23731');


ALTER LARGE OBJECT 23731 OWNER TO postgres;

--
-- TOC entry 2713 (class 2613 OID 23732)
-- Name: 23732; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23732');


ALTER LARGE OBJECT 23732 OWNER TO postgres;

--
-- TOC entry 2714 (class 2613 OID 23733)
-- Name: 23733; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23733');


ALTER LARGE OBJECT 23733 OWNER TO postgres;

--
-- TOC entry 2715 (class 2613 OID 23734)
-- Name: 23734; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23734');


ALTER LARGE OBJECT 23734 OWNER TO postgres;

--
-- TOC entry 2716 (class 2613 OID 23735)
-- Name: 23735; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23735');


ALTER LARGE OBJECT 23735 OWNER TO postgres;

--
-- TOC entry 2717 (class 2613 OID 23736)
-- Name: 23736; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23736');


ALTER LARGE OBJECT 23736 OWNER TO postgres;

--
-- TOC entry 2718 (class 2613 OID 23737)
-- Name: 23737; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23737');


ALTER LARGE OBJECT 23737 OWNER TO postgres;

--
-- TOC entry 2719 (class 2613 OID 23738)
-- Name: 23738; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23738');


ALTER LARGE OBJECT 23738 OWNER TO postgres;

--
-- TOC entry 2720 (class 2613 OID 23739)
-- Name: 23739; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23739');


ALTER LARGE OBJECT 23739 OWNER TO postgres;

--
-- TOC entry 2721 (class 2613 OID 23740)
-- Name: 23740; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23740');


ALTER LARGE OBJECT 23740 OWNER TO postgres;

--
-- TOC entry 2722 (class 2613 OID 23741)
-- Name: 23741; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23741');


ALTER LARGE OBJECT 23741 OWNER TO postgres;

--
-- TOC entry 2723 (class 2613 OID 23742)
-- Name: 23742; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23742');


ALTER LARGE OBJECT 23742 OWNER TO postgres;

--
-- TOC entry 2724 (class 2613 OID 23743)
-- Name: 23743; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23743');


ALTER LARGE OBJECT 23743 OWNER TO postgres;

--
-- TOC entry 2725 (class 2613 OID 23744)
-- Name: 23744; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23744');


ALTER LARGE OBJECT 23744 OWNER TO postgres;

--
-- TOC entry 2726 (class 2613 OID 23745)
-- Name: 23745; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23745');


ALTER LARGE OBJECT 23745 OWNER TO postgres;

--
-- TOC entry 2727 (class 2613 OID 23746)
-- Name: 23746; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23746');


ALTER LARGE OBJECT 23746 OWNER TO postgres;

--
-- TOC entry 2728 (class 2613 OID 23747)
-- Name: 23747; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23747');


ALTER LARGE OBJECT 23747 OWNER TO postgres;

--
-- TOC entry 2729 (class 2613 OID 23748)
-- Name: 23748; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23748');


ALTER LARGE OBJECT 23748 OWNER TO postgres;

--
-- TOC entry 2730 (class 2613 OID 23749)
-- Name: 23749; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23749');


ALTER LARGE OBJECT 23749 OWNER TO postgres;

--
-- TOC entry 2731 (class 2613 OID 23750)
-- Name: 23750; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23750');


ALTER LARGE OBJECT 23750 OWNER TO postgres;

--
-- TOC entry 2732 (class 2613 OID 23751)
-- Name: 23751; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23751');


ALTER LARGE OBJECT 23751 OWNER TO postgres;

--
-- TOC entry 2733 (class 2613 OID 23752)
-- Name: 23752; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23752');


ALTER LARGE OBJECT 23752 OWNER TO postgres;

--
-- TOC entry 2734 (class 2613 OID 23753)
-- Name: 23753; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23753');


ALTER LARGE OBJECT 23753 OWNER TO postgres;

--
-- TOC entry 2735 (class 2613 OID 23754)
-- Name: 23754; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23754');


ALTER LARGE OBJECT 23754 OWNER TO postgres;

--
-- TOC entry 2736 (class 2613 OID 23755)
-- Name: 23755; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23755');


ALTER LARGE OBJECT 23755 OWNER TO postgres;

--
-- TOC entry 2737 (class 2613 OID 23756)
-- Name: 23756; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23756');


ALTER LARGE OBJECT 23756 OWNER TO postgres;

--
-- TOC entry 2738 (class 2613 OID 23757)
-- Name: 23757; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23757');


ALTER LARGE OBJECT 23757 OWNER TO postgres;

--
-- TOC entry 2739 (class 2613 OID 23758)
-- Name: 23758; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23758');


ALTER LARGE OBJECT 23758 OWNER TO postgres;

--
-- TOC entry 2740 (class 2613 OID 23759)
-- Name: 23759; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23759');


ALTER LARGE OBJECT 23759 OWNER TO postgres;

--
-- TOC entry 2741 (class 2613 OID 23760)
-- Name: 23760; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23760');


ALTER LARGE OBJECT 23760 OWNER TO postgres;

--
-- TOC entry 2742 (class 2613 OID 23761)
-- Name: 23761; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23761');


ALTER LARGE OBJECT 23761 OWNER TO postgres;

--
-- TOC entry 2743 (class 2613 OID 23762)
-- Name: 23762; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23762');


ALTER LARGE OBJECT 23762 OWNER TO postgres;

--
-- TOC entry 2744 (class 2613 OID 23763)
-- Name: 23763; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23763');


ALTER LARGE OBJECT 23763 OWNER TO postgres;

--
-- TOC entry 2745 (class 2613 OID 23764)
-- Name: 23764; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23764');


ALTER LARGE OBJECT 23764 OWNER TO postgres;

--
-- TOC entry 2746 (class 2613 OID 23765)
-- Name: 23765; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23765');


ALTER LARGE OBJECT 23765 OWNER TO postgres;

--
-- TOC entry 2747 (class 2613 OID 23766)
-- Name: 23766; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23766');


ALTER LARGE OBJECT 23766 OWNER TO postgres;

--
-- TOC entry 2748 (class 2613 OID 23767)
-- Name: 23767; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23767');


ALTER LARGE OBJECT 23767 OWNER TO postgres;

--
-- TOC entry 2749 (class 2613 OID 23768)
-- Name: 23768; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23768');


ALTER LARGE OBJECT 23768 OWNER TO postgres;

--
-- TOC entry 2750 (class 2613 OID 23769)
-- Name: 23769; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23769');


ALTER LARGE OBJECT 23769 OWNER TO postgres;

--
-- TOC entry 2751 (class 2613 OID 23770)
-- Name: 23770; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23770');


ALTER LARGE OBJECT 23770 OWNER TO postgres;

--
-- TOC entry 2752 (class 2613 OID 23771)
-- Name: 23771; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23771');


ALTER LARGE OBJECT 23771 OWNER TO postgres;

--
-- TOC entry 2753 (class 2613 OID 23772)
-- Name: 23772; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23772');


ALTER LARGE OBJECT 23772 OWNER TO postgres;

--
-- TOC entry 2754 (class 2613 OID 23773)
-- Name: 23773; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23773');


ALTER LARGE OBJECT 23773 OWNER TO postgres;

--
-- TOC entry 2755 (class 2613 OID 23774)
-- Name: 23774; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23774');


ALTER LARGE OBJECT 23774 OWNER TO postgres;

--
-- TOC entry 2756 (class 2613 OID 23775)
-- Name: 23775; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23775');


ALTER LARGE OBJECT 23775 OWNER TO postgres;

--
-- TOC entry 2757 (class 2613 OID 23776)
-- Name: 23776; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23776');


ALTER LARGE OBJECT 23776 OWNER TO postgres;

--
-- TOC entry 2758 (class 2613 OID 23777)
-- Name: 23777; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23777');


ALTER LARGE OBJECT 23777 OWNER TO postgres;

--
-- TOC entry 2759 (class 2613 OID 23778)
-- Name: 23778; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23778');


ALTER LARGE OBJECT 23778 OWNER TO postgres;

--
-- TOC entry 2760 (class 2613 OID 23779)
-- Name: 23779; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23779');


ALTER LARGE OBJECT 23779 OWNER TO postgres;

--
-- TOC entry 2761 (class 2613 OID 23780)
-- Name: 23780; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23780');


ALTER LARGE OBJECT 23780 OWNER TO postgres;

--
-- TOC entry 2762 (class 2613 OID 23781)
-- Name: 23781; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23781');


ALTER LARGE OBJECT 23781 OWNER TO postgres;

--
-- TOC entry 2763 (class 2613 OID 23782)
-- Name: 23782; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23782');


ALTER LARGE OBJECT 23782 OWNER TO postgres;

--
-- TOC entry 2764 (class 2613 OID 23783)
-- Name: 23783; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23783');


ALTER LARGE OBJECT 23783 OWNER TO postgres;

--
-- TOC entry 2765 (class 2613 OID 23784)
-- Name: 23784; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23784');


ALTER LARGE OBJECT 23784 OWNER TO postgres;

--
-- TOC entry 2766 (class 2613 OID 23785)
-- Name: 23785; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23785');


ALTER LARGE OBJECT 23785 OWNER TO postgres;

--
-- TOC entry 2767 (class 2613 OID 23786)
-- Name: 23786; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23786');


ALTER LARGE OBJECT 23786 OWNER TO postgres;

--
-- TOC entry 2768 (class 2613 OID 23787)
-- Name: 23787; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23787');


ALTER LARGE OBJECT 23787 OWNER TO postgres;

--
-- TOC entry 2769 (class 2613 OID 23788)
-- Name: 23788; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23788');


ALTER LARGE OBJECT 23788 OWNER TO postgres;

--
-- TOC entry 2770 (class 2613 OID 23789)
-- Name: 23789; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23789');


ALTER LARGE OBJECT 23789 OWNER TO postgres;

--
-- TOC entry 2771 (class 2613 OID 23790)
-- Name: 23790; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23790');


ALTER LARGE OBJECT 23790 OWNER TO postgres;

--
-- TOC entry 2772 (class 2613 OID 23791)
-- Name: 23791; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23791');


ALTER LARGE OBJECT 23791 OWNER TO postgres;

--
-- TOC entry 2773 (class 2613 OID 23792)
-- Name: 23792; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23792');


ALTER LARGE OBJECT 23792 OWNER TO postgres;

--
-- TOC entry 2774 (class 2613 OID 23793)
-- Name: 23793; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23793');


ALTER LARGE OBJECT 23793 OWNER TO postgres;

--
-- TOC entry 2775 (class 2613 OID 23794)
-- Name: 23794; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23794');


ALTER LARGE OBJECT 23794 OWNER TO postgres;

--
-- TOC entry 2776 (class 2613 OID 23795)
-- Name: 23795; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23795');


ALTER LARGE OBJECT 23795 OWNER TO postgres;

--
-- TOC entry 2777 (class 2613 OID 23796)
-- Name: 23796; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23796');


ALTER LARGE OBJECT 23796 OWNER TO postgres;

--
-- TOC entry 2778 (class 2613 OID 23797)
-- Name: 23797; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23797');


ALTER LARGE OBJECT 23797 OWNER TO postgres;

--
-- TOC entry 2779 (class 2613 OID 23798)
-- Name: 23798; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23798');


ALTER LARGE OBJECT 23798 OWNER TO postgres;

--
-- TOC entry 2780 (class 2613 OID 23799)
-- Name: 23799; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23799');


ALTER LARGE OBJECT 23799 OWNER TO postgres;

--
-- TOC entry 2781 (class 2613 OID 23800)
-- Name: 23800; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23800');


ALTER LARGE OBJECT 23800 OWNER TO postgres;

--
-- TOC entry 2782 (class 2613 OID 23801)
-- Name: 23801; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23801');


ALTER LARGE OBJECT 23801 OWNER TO postgres;

--
-- TOC entry 2783 (class 2613 OID 23802)
-- Name: 23802; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23802');


ALTER LARGE OBJECT 23802 OWNER TO postgres;

--
-- TOC entry 2784 (class 2613 OID 23803)
-- Name: 23803; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23803');


ALTER LARGE OBJECT 23803 OWNER TO postgres;

--
-- TOC entry 2785 (class 2613 OID 23809)
-- Name: 23809; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23809');


ALTER LARGE OBJECT 23809 OWNER TO postgres;

--
-- TOC entry 2786 (class 2613 OID 23810)
-- Name: 23810; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23810');


ALTER LARGE OBJECT 23810 OWNER TO postgres;

--
-- TOC entry 2787 (class 2613 OID 23811)
-- Name: 23811; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23811');


ALTER LARGE OBJECT 23811 OWNER TO postgres;

--
-- TOC entry 2788 (class 2613 OID 23812)
-- Name: 23812; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23812');


ALTER LARGE OBJECT 23812 OWNER TO postgres;

--
-- TOC entry 2789 (class 2613 OID 23813)
-- Name: 23813; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23813');


ALTER LARGE OBJECT 23813 OWNER TO postgres;

--
-- TOC entry 2790 (class 2613 OID 23814)
-- Name: 23814; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23814');


ALTER LARGE OBJECT 23814 OWNER TO postgres;

--
-- TOC entry 2791 (class 2613 OID 23815)
-- Name: 23815; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23815');


ALTER LARGE OBJECT 23815 OWNER TO postgres;

--
-- TOC entry 2792 (class 2613 OID 23816)
-- Name: 23816; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23816');


ALTER LARGE OBJECT 23816 OWNER TO postgres;

--
-- TOC entry 2793 (class 2613 OID 23817)
-- Name: 23817; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23817');


ALTER LARGE OBJECT 23817 OWNER TO postgres;

--
-- TOC entry 2794 (class 2613 OID 23818)
-- Name: 23818; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23818');


ALTER LARGE OBJECT 23818 OWNER TO postgres;

--
-- TOC entry 2795 (class 2613 OID 23819)
-- Name: 23819; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23819');


ALTER LARGE OBJECT 23819 OWNER TO postgres;

--
-- TOC entry 2796 (class 2613 OID 23820)
-- Name: 23820; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23820');


ALTER LARGE OBJECT 23820 OWNER TO postgres;

--
-- TOC entry 2797 (class 2613 OID 23821)
-- Name: 23821; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23821');


ALTER LARGE OBJECT 23821 OWNER TO postgres;

--
-- TOC entry 2798 (class 2613 OID 23822)
-- Name: 23822; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23822');


ALTER LARGE OBJECT 23822 OWNER TO postgres;

--
-- TOC entry 2799 (class 2613 OID 23823)
-- Name: 23823; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23823');


ALTER LARGE OBJECT 23823 OWNER TO postgres;

--
-- TOC entry 2800 (class 2613 OID 23824)
-- Name: 23824; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23824');


ALTER LARGE OBJECT 23824 OWNER TO postgres;

--
-- TOC entry 2801 (class 2613 OID 23825)
-- Name: 23825; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23825');


ALTER LARGE OBJECT 23825 OWNER TO postgres;

--
-- TOC entry 2802 (class 2613 OID 23826)
-- Name: 23826; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23826');


ALTER LARGE OBJECT 23826 OWNER TO postgres;

--
-- TOC entry 2803 (class 2613 OID 23827)
-- Name: 23827; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23827');


ALTER LARGE OBJECT 23827 OWNER TO postgres;

--
-- TOC entry 2804 (class 2613 OID 23828)
-- Name: 23828; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23828');


ALTER LARGE OBJECT 23828 OWNER TO postgres;

--
-- TOC entry 2805 (class 2613 OID 23829)
-- Name: 23829; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23829');


ALTER LARGE OBJECT 23829 OWNER TO postgres;

--
-- TOC entry 2806 (class 2613 OID 23830)
-- Name: 23830; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23830');


ALTER LARGE OBJECT 23830 OWNER TO postgres;

--
-- TOC entry 2807 (class 2613 OID 23831)
-- Name: 23831; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23831');


ALTER LARGE OBJECT 23831 OWNER TO postgres;

--
-- TOC entry 2808 (class 2613 OID 23832)
-- Name: 23832; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23832');


ALTER LARGE OBJECT 23832 OWNER TO postgres;

--
-- TOC entry 2809 (class 2613 OID 23833)
-- Name: 23833; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23833');


ALTER LARGE OBJECT 23833 OWNER TO postgres;

--
-- TOC entry 2810 (class 2613 OID 23834)
-- Name: 23834; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23834');


ALTER LARGE OBJECT 23834 OWNER TO postgres;

--
-- TOC entry 2811 (class 2613 OID 23835)
-- Name: 23835; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23835');


ALTER LARGE OBJECT 23835 OWNER TO postgres;

--
-- TOC entry 2812 (class 2613 OID 23836)
-- Name: 23836; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23836');


ALTER LARGE OBJECT 23836 OWNER TO postgres;

--
-- TOC entry 2813 (class 2613 OID 23837)
-- Name: 23837; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23837');


ALTER LARGE OBJECT 23837 OWNER TO postgres;

--
-- TOC entry 2814 (class 2613 OID 23838)
-- Name: 23838; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23838');


ALTER LARGE OBJECT 23838 OWNER TO postgres;

--
-- TOC entry 2815 (class 2613 OID 23839)
-- Name: 23839; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23839');


ALTER LARGE OBJECT 23839 OWNER TO postgres;

--
-- TOC entry 2816 (class 2613 OID 23840)
-- Name: 23840; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23840');


ALTER LARGE OBJECT 23840 OWNER TO postgres;

--
-- TOC entry 2817 (class 2613 OID 23841)
-- Name: 23841; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23841');


ALTER LARGE OBJECT 23841 OWNER TO postgres;

--
-- TOC entry 2818 (class 2613 OID 23842)
-- Name: 23842; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23842');


ALTER LARGE OBJECT 23842 OWNER TO postgres;

--
-- TOC entry 2819 (class 2613 OID 23843)
-- Name: 23843; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23843');


ALTER LARGE OBJECT 23843 OWNER TO postgres;

--
-- TOC entry 2820 (class 2613 OID 23844)
-- Name: 23844; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23844');


ALTER LARGE OBJECT 23844 OWNER TO postgres;

--
-- TOC entry 2821 (class 2613 OID 23845)
-- Name: 23845; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23845');


ALTER LARGE OBJECT 23845 OWNER TO postgres;

--
-- TOC entry 2822 (class 2613 OID 23846)
-- Name: 23846; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23846');


ALTER LARGE OBJECT 23846 OWNER TO postgres;

--
-- TOC entry 2823 (class 2613 OID 23847)
-- Name: 23847; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23847');


ALTER LARGE OBJECT 23847 OWNER TO postgres;

--
-- TOC entry 2824 (class 2613 OID 23848)
-- Name: 23848; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23848');


ALTER LARGE OBJECT 23848 OWNER TO postgres;

--
-- TOC entry 2825 (class 2613 OID 23849)
-- Name: 23849; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23849');


ALTER LARGE OBJECT 23849 OWNER TO postgres;

--
-- TOC entry 2826 (class 2613 OID 23850)
-- Name: 23850; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23850');


ALTER LARGE OBJECT 23850 OWNER TO postgres;

--
-- TOC entry 2827 (class 2613 OID 23851)
-- Name: 23851; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23851');


ALTER LARGE OBJECT 23851 OWNER TO postgres;

--
-- TOC entry 2828 (class 2613 OID 23852)
-- Name: 23852; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23852');


ALTER LARGE OBJECT 23852 OWNER TO postgres;

--
-- TOC entry 2829 (class 2613 OID 23853)
-- Name: 23853; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23853');


ALTER LARGE OBJECT 23853 OWNER TO postgres;

--
-- TOC entry 2830 (class 2613 OID 23854)
-- Name: 23854; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23854');


ALTER LARGE OBJECT 23854 OWNER TO postgres;

--
-- TOC entry 2831 (class 2613 OID 23855)
-- Name: 23855; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23855');


ALTER LARGE OBJECT 23855 OWNER TO postgres;

--
-- TOC entry 2832 (class 2613 OID 23856)
-- Name: 23856; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23856');


ALTER LARGE OBJECT 23856 OWNER TO postgres;

--
-- TOC entry 2833 (class 2613 OID 23857)
-- Name: 23857; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23857');


ALTER LARGE OBJECT 23857 OWNER TO postgres;

--
-- TOC entry 2834 (class 2613 OID 23858)
-- Name: 23858; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23858');


ALTER LARGE OBJECT 23858 OWNER TO postgres;

--
-- TOC entry 2835 (class 2613 OID 23859)
-- Name: 23859; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23859');


ALTER LARGE OBJECT 23859 OWNER TO postgres;

--
-- TOC entry 2836 (class 2613 OID 23860)
-- Name: 23860; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23860');


ALTER LARGE OBJECT 23860 OWNER TO postgres;

--
-- TOC entry 2837 (class 2613 OID 23861)
-- Name: 23861; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23861');


ALTER LARGE OBJECT 23861 OWNER TO postgres;

--
-- TOC entry 2838 (class 2613 OID 23862)
-- Name: 23862; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23862');


ALTER LARGE OBJECT 23862 OWNER TO postgres;

--
-- TOC entry 2839 (class 2613 OID 23863)
-- Name: 23863; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23863');


ALTER LARGE OBJECT 23863 OWNER TO postgres;

--
-- TOC entry 2840 (class 2613 OID 23864)
-- Name: 23864; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23864');


ALTER LARGE OBJECT 23864 OWNER TO postgres;

--
-- TOC entry 2841 (class 2613 OID 23865)
-- Name: 23865; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23865');


ALTER LARGE OBJECT 23865 OWNER TO postgres;

--
-- TOC entry 2842 (class 2613 OID 23866)
-- Name: 23866; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23866');


ALTER LARGE OBJECT 23866 OWNER TO postgres;

--
-- TOC entry 2843 (class 2613 OID 23867)
-- Name: 23867; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23867');


ALTER LARGE OBJECT 23867 OWNER TO postgres;

--
-- TOC entry 2844 (class 2613 OID 23868)
-- Name: 23868; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23868');


ALTER LARGE OBJECT 23868 OWNER TO postgres;

--
-- TOC entry 2845 (class 2613 OID 23869)
-- Name: 23869; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23869');


ALTER LARGE OBJECT 23869 OWNER TO postgres;

--
-- TOC entry 2846 (class 2613 OID 23870)
-- Name: 23870; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23870');


ALTER LARGE OBJECT 23870 OWNER TO postgres;

--
-- TOC entry 2847 (class 2613 OID 23871)
-- Name: 23871; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23871');


ALTER LARGE OBJECT 23871 OWNER TO postgres;

--
-- TOC entry 2848 (class 2613 OID 23872)
-- Name: 23872; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23872');


ALTER LARGE OBJECT 23872 OWNER TO postgres;

--
-- TOC entry 2849 (class 2613 OID 23873)
-- Name: 23873; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23873');


ALTER LARGE OBJECT 23873 OWNER TO postgres;

--
-- TOC entry 2850 (class 2613 OID 23874)
-- Name: 23874; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23874');


ALTER LARGE OBJECT 23874 OWNER TO postgres;

--
-- TOC entry 2851 (class 2613 OID 23875)
-- Name: 23875; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23875');


ALTER LARGE OBJECT 23875 OWNER TO postgres;

--
-- TOC entry 2852 (class 2613 OID 23876)
-- Name: 23876; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23876');


ALTER LARGE OBJECT 23876 OWNER TO postgres;

--
-- TOC entry 2853 (class 2613 OID 23877)
-- Name: 23877; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23877');


ALTER LARGE OBJECT 23877 OWNER TO postgres;

--
-- TOC entry 2854 (class 2613 OID 23878)
-- Name: 23878; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23878');


ALTER LARGE OBJECT 23878 OWNER TO postgres;

--
-- TOC entry 2855 (class 2613 OID 23879)
-- Name: 23879; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23879');


ALTER LARGE OBJECT 23879 OWNER TO postgres;

--
-- TOC entry 2856 (class 2613 OID 23880)
-- Name: 23880; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23880');


ALTER LARGE OBJECT 23880 OWNER TO postgres;

--
-- TOC entry 2857 (class 2613 OID 23881)
-- Name: 23881; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23881');


ALTER LARGE OBJECT 23881 OWNER TO postgres;

--
-- TOC entry 2858 (class 2613 OID 23882)
-- Name: 23882; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23882');


ALTER LARGE OBJECT 23882 OWNER TO postgres;

--
-- TOC entry 2859 (class 2613 OID 23883)
-- Name: 23883; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23883');


ALTER LARGE OBJECT 23883 OWNER TO postgres;

--
-- TOC entry 2860 (class 2613 OID 23884)
-- Name: 23884; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23884');


ALTER LARGE OBJECT 23884 OWNER TO postgres;

--
-- TOC entry 2861 (class 2613 OID 23885)
-- Name: 23885; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23885');


ALTER LARGE OBJECT 23885 OWNER TO postgres;

--
-- TOC entry 2862 (class 2613 OID 23886)
-- Name: 23886; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23886');


ALTER LARGE OBJECT 23886 OWNER TO postgres;

--
-- TOC entry 2863 (class 2613 OID 23887)
-- Name: 23887; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23887');


ALTER LARGE OBJECT 23887 OWNER TO postgres;

--
-- TOC entry 2864 (class 2613 OID 23888)
-- Name: 23888; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23888');


ALTER LARGE OBJECT 23888 OWNER TO postgres;

--
-- TOC entry 2865 (class 2613 OID 23889)
-- Name: 23889; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23889');


ALTER LARGE OBJECT 23889 OWNER TO postgres;

--
-- TOC entry 2866 (class 2613 OID 23890)
-- Name: 23890; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23890');


ALTER LARGE OBJECT 23890 OWNER TO postgres;

--
-- TOC entry 2867 (class 2613 OID 23891)
-- Name: 23891; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23891');


ALTER LARGE OBJECT 23891 OWNER TO postgres;

--
-- TOC entry 2868 (class 2613 OID 23892)
-- Name: 23892; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23892');


ALTER LARGE OBJECT 23892 OWNER TO postgres;

--
-- TOC entry 2869 (class 2613 OID 23893)
-- Name: 23893; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23893');


ALTER LARGE OBJECT 23893 OWNER TO postgres;

--
-- TOC entry 2870 (class 2613 OID 23894)
-- Name: 23894; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23894');


ALTER LARGE OBJECT 23894 OWNER TO postgres;

--
-- TOC entry 2871 (class 2613 OID 23895)
-- Name: 23895; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23895');


ALTER LARGE OBJECT 23895 OWNER TO postgres;

--
-- TOC entry 2872 (class 2613 OID 23896)
-- Name: 23896; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23896');


ALTER LARGE OBJECT 23896 OWNER TO postgres;

--
-- TOC entry 2873 (class 2613 OID 23897)
-- Name: 23897; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23897');


ALTER LARGE OBJECT 23897 OWNER TO postgres;

--
-- TOC entry 2874 (class 2613 OID 23898)
-- Name: 23898; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23898');


ALTER LARGE OBJECT 23898 OWNER TO postgres;

--
-- TOC entry 2875 (class 2613 OID 23899)
-- Name: 23899; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23899');


ALTER LARGE OBJECT 23899 OWNER TO postgres;

--
-- TOC entry 2876 (class 2613 OID 23900)
-- Name: 23900; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23900');


ALTER LARGE OBJECT 23900 OWNER TO postgres;

--
-- TOC entry 2877 (class 2613 OID 23901)
-- Name: 23901; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23901');


ALTER LARGE OBJECT 23901 OWNER TO postgres;

--
-- TOC entry 2878 (class 2613 OID 23902)
-- Name: 23902; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23902');


ALTER LARGE OBJECT 23902 OWNER TO postgres;

--
-- TOC entry 2879 (class 2613 OID 23903)
-- Name: 23903; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23903');


ALTER LARGE OBJECT 23903 OWNER TO postgres;

--
-- TOC entry 2880 (class 2613 OID 23904)
-- Name: 23904; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23904');


ALTER LARGE OBJECT 23904 OWNER TO postgres;

--
-- TOC entry 2881 (class 2613 OID 23905)
-- Name: 23905; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23905');


ALTER LARGE OBJECT 23905 OWNER TO postgres;

--
-- TOC entry 2882 (class 2613 OID 23906)
-- Name: 23906; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23906');


ALTER LARGE OBJECT 23906 OWNER TO postgres;

--
-- TOC entry 2883 (class 2613 OID 23907)
-- Name: 23907; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23907');


ALTER LARGE OBJECT 23907 OWNER TO postgres;

--
-- TOC entry 2884 (class 2613 OID 23908)
-- Name: 23908; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23908');


ALTER LARGE OBJECT 23908 OWNER TO postgres;

--
-- TOC entry 2885 (class 2613 OID 23909)
-- Name: 23909; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23909');


ALTER LARGE OBJECT 23909 OWNER TO postgres;

--
-- TOC entry 2886 (class 2613 OID 23910)
-- Name: 23910; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23910');


ALTER LARGE OBJECT 23910 OWNER TO postgres;

--
-- TOC entry 2887 (class 2613 OID 23911)
-- Name: 23911; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23911');


ALTER LARGE OBJECT 23911 OWNER TO postgres;

--
-- TOC entry 2888 (class 2613 OID 23912)
-- Name: 23912; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23912');


ALTER LARGE OBJECT 23912 OWNER TO postgres;

--
-- TOC entry 2889 (class 2613 OID 23913)
-- Name: 23913; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23913');


ALTER LARGE OBJECT 23913 OWNER TO postgres;

--
-- TOC entry 2890 (class 2613 OID 23914)
-- Name: 23914; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23914');


ALTER LARGE OBJECT 23914 OWNER TO postgres;

--
-- TOC entry 2891 (class 2613 OID 23915)
-- Name: 23915; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23915');


ALTER LARGE OBJECT 23915 OWNER TO postgres;

--
-- TOC entry 2892 (class 2613 OID 23916)
-- Name: 23916; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23916');


ALTER LARGE OBJECT 23916 OWNER TO postgres;

--
-- TOC entry 2893 (class 2613 OID 23917)
-- Name: 23917; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23917');


ALTER LARGE OBJECT 23917 OWNER TO postgres;

--
-- TOC entry 2894 (class 2613 OID 23918)
-- Name: 23918; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23918');


ALTER LARGE OBJECT 23918 OWNER TO postgres;

--
-- TOC entry 2895 (class 2613 OID 23919)
-- Name: 23919; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23919');


ALTER LARGE OBJECT 23919 OWNER TO postgres;

--
-- TOC entry 2896 (class 2613 OID 23920)
-- Name: 23920; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23920');


ALTER LARGE OBJECT 23920 OWNER TO postgres;

--
-- TOC entry 2897 (class 2613 OID 23921)
-- Name: 23921; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23921');


ALTER LARGE OBJECT 23921 OWNER TO postgres;

--
-- TOC entry 2898 (class 2613 OID 23922)
-- Name: 23922; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23922');


ALTER LARGE OBJECT 23922 OWNER TO postgres;

--
-- TOC entry 2899 (class 2613 OID 23923)
-- Name: 23923; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23923');


ALTER LARGE OBJECT 23923 OWNER TO postgres;

--
-- TOC entry 2900 (class 2613 OID 23924)
-- Name: 23924; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23924');


ALTER LARGE OBJECT 23924 OWNER TO postgres;

--
-- TOC entry 2901 (class 2613 OID 23925)
-- Name: 23925; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23925');


ALTER LARGE OBJECT 23925 OWNER TO postgres;

--
-- TOC entry 2902 (class 2613 OID 23926)
-- Name: 23926; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23926');


ALTER LARGE OBJECT 23926 OWNER TO postgres;

--
-- TOC entry 2903 (class 2613 OID 23927)
-- Name: 23927; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23927');


ALTER LARGE OBJECT 23927 OWNER TO postgres;

--
-- TOC entry 2904 (class 2613 OID 23928)
-- Name: 23928; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23928');


ALTER LARGE OBJECT 23928 OWNER TO postgres;

--
-- TOC entry 2905 (class 2613 OID 23929)
-- Name: 23929; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23929');


ALTER LARGE OBJECT 23929 OWNER TO postgres;

--
-- TOC entry 2906 (class 2613 OID 23930)
-- Name: 23930; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23930');


ALTER LARGE OBJECT 23930 OWNER TO postgres;

--
-- TOC entry 2907 (class 2613 OID 23931)
-- Name: 23931; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23931');


ALTER LARGE OBJECT 23931 OWNER TO postgres;

--
-- TOC entry 2908 (class 2613 OID 23932)
-- Name: 23932; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23932');


ALTER LARGE OBJECT 23932 OWNER TO postgres;

--
-- TOC entry 2909 (class 2613 OID 23933)
-- Name: 23933; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23933');


ALTER LARGE OBJECT 23933 OWNER TO postgres;

--
-- TOC entry 2910 (class 2613 OID 23934)
-- Name: 23934; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23934');


ALTER LARGE OBJECT 23934 OWNER TO postgres;

--
-- TOC entry 2911 (class 2613 OID 23935)
-- Name: 23935; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23935');


ALTER LARGE OBJECT 23935 OWNER TO postgres;

--
-- TOC entry 2912 (class 2613 OID 23936)
-- Name: 23936; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23936');


ALTER LARGE OBJECT 23936 OWNER TO postgres;

--
-- TOC entry 2913 (class 2613 OID 23937)
-- Name: 23937; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23937');


ALTER LARGE OBJECT 23937 OWNER TO postgres;

--
-- TOC entry 2914 (class 2613 OID 23938)
-- Name: 23938; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23938');


ALTER LARGE OBJECT 23938 OWNER TO postgres;

--
-- TOC entry 2915 (class 2613 OID 23939)
-- Name: 23939; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23939');


ALTER LARGE OBJECT 23939 OWNER TO postgres;

--
-- TOC entry 2916 (class 2613 OID 23940)
-- Name: 23940; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23940');


ALTER LARGE OBJECT 23940 OWNER TO postgres;

--
-- TOC entry 2917 (class 2613 OID 23941)
-- Name: 23941; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23941');


ALTER LARGE OBJECT 23941 OWNER TO postgres;

--
-- TOC entry 2918 (class 2613 OID 23942)
-- Name: 23942; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23942');


ALTER LARGE OBJECT 23942 OWNER TO postgres;

--
-- TOC entry 2919 (class 2613 OID 23943)
-- Name: 23943; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23943');


ALTER LARGE OBJECT 23943 OWNER TO postgres;

--
-- TOC entry 2920 (class 2613 OID 23944)
-- Name: 23944; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23944');


ALTER LARGE OBJECT 23944 OWNER TO postgres;

--
-- TOC entry 2921 (class 2613 OID 23945)
-- Name: 23945; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23945');


ALTER LARGE OBJECT 23945 OWNER TO postgres;

--
-- TOC entry 2922 (class 2613 OID 23946)
-- Name: 23946; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23946');


ALTER LARGE OBJECT 23946 OWNER TO postgres;

--
-- TOC entry 2923 (class 2613 OID 23947)
-- Name: 23947; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23947');


ALTER LARGE OBJECT 23947 OWNER TO postgres;

--
-- TOC entry 2924 (class 2613 OID 23948)
-- Name: 23948; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23948');


ALTER LARGE OBJECT 23948 OWNER TO postgres;

--
-- TOC entry 2925 (class 2613 OID 23949)
-- Name: 23949; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23949');


ALTER LARGE OBJECT 23949 OWNER TO postgres;

--
-- TOC entry 2926 (class 2613 OID 23950)
-- Name: 23950; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23950');


ALTER LARGE OBJECT 23950 OWNER TO postgres;

--
-- TOC entry 2927 (class 2613 OID 23951)
-- Name: 23951; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23951');


ALTER LARGE OBJECT 23951 OWNER TO postgres;

--
-- TOC entry 2928 (class 2613 OID 23952)
-- Name: 23952; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23952');


ALTER LARGE OBJECT 23952 OWNER TO postgres;

--
-- TOC entry 2929 (class 2613 OID 23953)
-- Name: 23953; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23953');


ALTER LARGE OBJECT 23953 OWNER TO postgres;

--
-- TOC entry 2930 (class 2613 OID 23954)
-- Name: 23954; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23954');


ALTER LARGE OBJECT 23954 OWNER TO postgres;

--
-- TOC entry 2931 (class 2613 OID 23955)
-- Name: 23955; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23955');


ALTER LARGE OBJECT 23955 OWNER TO postgres;

--
-- TOC entry 2932 (class 2613 OID 23956)
-- Name: 23956; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23956');


ALTER LARGE OBJECT 23956 OWNER TO postgres;

--
-- TOC entry 2933 (class 2613 OID 23957)
-- Name: 23957; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23957');


ALTER LARGE OBJECT 23957 OWNER TO postgres;

--
-- TOC entry 2934 (class 2613 OID 23960)
-- Name: 23960; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23960');


ALTER LARGE OBJECT 23960 OWNER TO postgres;

--
-- TOC entry 2935 (class 2613 OID 23970)
-- Name: 23970; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23970');


ALTER LARGE OBJECT 23970 OWNER TO postgres;

--
-- TOC entry 2936 (class 2613 OID 23971)
-- Name: 23971; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23971');


ALTER LARGE OBJECT 23971 OWNER TO postgres;

--
-- TOC entry 2937 (class 2613 OID 23972)
-- Name: 23972; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23972');


ALTER LARGE OBJECT 23972 OWNER TO postgres;

--
-- TOC entry 2938 (class 2613 OID 23973)
-- Name: 23973; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23973');


ALTER LARGE OBJECT 23973 OWNER TO postgres;

--
-- TOC entry 2939 (class 2613 OID 23974)
-- Name: 23974; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23974');


ALTER LARGE OBJECT 23974 OWNER TO postgres;

--
-- TOC entry 2940 (class 2613 OID 23975)
-- Name: 23975; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23975');


ALTER LARGE OBJECT 23975 OWNER TO postgres;

--
-- TOC entry 2941 (class 2613 OID 23976)
-- Name: 23976; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23976');


ALTER LARGE OBJECT 23976 OWNER TO postgres;

--
-- TOC entry 2942 (class 2613 OID 23977)
-- Name: 23977; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23977');


ALTER LARGE OBJECT 23977 OWNER TO postgres;

--
-- TOC entry 2943 (class 2613 OID 23978)
-- Name: 23978; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23978');


ALTER LARGE OBJECT 23978 OWNER TO postgres;

--
-- TOC entry 2944 (class 2613 OID 23979)
-- Name: 23979; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('23979');


ALTER LARGE OBJECT 23979 OWNER TO postgres;

--
-- TOC entry 2419 (class 0 OID 22898)
-- Dependencies: 172
-- Data for Name: acl; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO acl VALUES (0, 1442457887028);
INSERT INTO acl VALUES (1, 1442457887214);
INSERT INTO acl VALUES (2, 1442457887456);
INSERT INTO acl VALUES (3, 1442457888694);
INSERT INTO acl VALUES (4, 1442457888843);
INSERT INTO acl VALUES (5, 1442457889173);
INSERT INTO acl VALUES (6, 1442457889292);
INSERT INTO acl VALUES (7, 1442457889413);
INSERT INTO acl VALUES (8, 1442457889525);
INSERT INTO acl VALUES (9, 1442457889662);
INSERT INTO acl VALUES (10, 1442457889834);
INSERT INTO acl VALUES (11, 1442457889997);
INSERT INTO acl VALUES (12, 1442457890114);
INSERT INTO acl VALUES (13, 1442457890258);
INSERT INTO acl VALUES (14, 1442457890684);
INSERT INTO acl VALUES (15, 1442457890918);
INSERT INTO acl VALUES (16, 1442457891022);
INSERT INTO acl VALUES (17, 1442457891132);
INSERT INTO acl VALUES (18, 1442457891246);
INSERT INTO acl VALUES (19, 1442457891354);
INSERT INTO acl VALUES (20, 1442457891498);
INSERT INTO acl VALUES (21, 1442457891635);
INSERT INTO acl VALUES (22, 1442457892041);
INSERT INTO acl VALUES (23, 1442457892148);
INSERT INTO acl VALUES (24, 1442457892271);
INSERT INTO acl VALUES (25, 1442457892430);
INSERT INTO acl VALUES (26, 1442457892548);
INSERT INTO acl VALUES (27, 1442457892682);
INSERT INTO acl VALUES (28, 1442457892838);
INSERT INTO acl VALUES (29, 1442457892947);
INSERT INTO acl VALUES (30, 1442457893199);
INSERT INTO acl VALUES (31, 1442457893329);
INSERT INTO acl VALUES (32, 1442457893477);
INSERT INTO acl VALUES (33, 1442457893650);
INSERT INTO acl VALUES (34, 1442457893760);
INSERT INTO acl VALUES (35, 1442457893894);
INSERT INTO acl VALUES (36, 1442457894061);
INSERT INTO acl VALUES (37, 1442457894201);
INSERT INTO acl VALUES (38, 1442457894334);
INSERT INTO acl VALUES (39, 1442457894545);
INSERT INTO acl VALUES (40, 1442457894657);
INSERT INTO acl VALUES (41, 1442457894767);
INSERT INTO acl VALUES (42, 1442457894891);
INSERT INTO acl VALUES (43, 1442457895022);
INSERT INTO acl VALUES (44, 1442457895137);
INSERT INTO acl VALUES (45, 1442457895245);
INSERT INTO acl VALUES (46, 1442457895354);
INSERT INTO acl VALUES (47, 1442457895465);
INSERT INTO acl VALUES (48, 1442457895565);
INSERT INTO acl VALUES (49, 1442457895665);
INSERT INTO acl VALUES (50, 1442457896011);
INSERT INTO acl VALUES (51, 1442457896123);
INSERT INTO acl VALUES (52, 1442457896231);
INSERT INTO acl VALUES (53, 1442457896331);
INSERT INTO acl VALUES (54, 1442457896431);
INSERT INTO acl VALUES (55, 1442457896579);
INSERT INTO acl VALUES (56, 1442457896739);
INSERT INTO acl VALUES (57, 1442457896833);
INSERT INTO acl VALUES (58, 1442457896948);
INSERT INTO acl VALUES (59, 1442457897094);
INSERT INTO acl VALUES (60, 1442457897274);
INSERT INTO acl VALUES (61, 1442457897488);
INSERT INTO acl VALUES (62, 1442457897748);
INSERT INTO acl VALUES (63, 1442457897861);
INSERT INTO acl VALUES (64, 1442457897980);
INSERT INTO acl VALUES (65, 1442457898094);
INSERT INTO acl VALUES (66, 1442457898221);
INSERT INTO acl VALUES (67, 1442457898343);
INSERT INTO acl VALUES (68, 1442457898552);
INSERT INTO acl VALUES (69, 1442457898695);
INSERT INTO acl VALUES (70, 1442457899072);
INSERT INTO acl VALUES (71, 1442457899172);
INSERT INTO acl VALUES (72, 1442457899271);
INSERT INTO acl VALUES (73, 1442457899395);
INSERT INTO acl VALUES (74, 1442457899492);
INSERT INTO acl VALUES (75, 1442457899581);
INSERT INTO acl VALUES (76, 1442457899681);
INSERT INTO acl VALUES (77, 1442457899833);
INSERT INTO acl VALUES (78, 1442457899933);
INSERT INTO acl VALUES (79, 1442457900340);
INSERT INTO acl VALUES (80, 1442457900458);
INSERT INTO acl VALUES (81, 1442457900581);
INSERT INTO acl VALUES (82, 1442457900681);
INSERT INTO acl VALUES (83, 1442457900780);
INSERT INTO acl VALUES (84, 1442457900894);
INSERT INTO acl VALUES (85, 1442457901001);
INSERT INTO acl VALUES (86, 1442457901102);
INSERT INTO acl VALUES (87, 1442457901232);
INSERT INTO acl VALUES (88, 1442457901504);
INSERT INTO acl VALUES (89, 1442457901612);
INSERT INTO acl VALUES (90, 1442457901711);
INSERT INTO acl VALUES (91, 1442457901835);
INSERT INTO acl VALUES (92, 1442457901945);
INSERT INTO acl VALUES (93, 1442457902056);
INSERT INTO acl VALUES (94, 1442457902167);
INSERT INTO acl VALUES (95, 1442457902266);
INSERT INTO acl VALUES (96, 1442457902377);
INSERT INTO acl VALUES (97, 1442457902481);
INSERT INTO acl VALUES (98, 1442457902811);
INSERT INTO acl VALUES (99, 1442457902947);
INSERT INTO acl VALUES (100, 1442457903054);
INSERT INTO acl VALUES (101, 1442457903164);
INSERT INTO acl VALUES (102, 1442457903284);
INSERT INTO acl VALUES (103, 1442457903398);
INSERT INTO acl VALUES (104, 1442457903503);
INSERT INTO acl VALUES (105, 1442457903608);
INSERT INTO acl VALUES (106, 1442457903720);
INSERT INTO acl VALUES (107, 1442457903843);
INSERT INTO acl VALUES (108, 1442457904210);
INSERT INTO acl VALUES (109, 1442457904329);
INSERT INTO acl VALUES (110, 1442457904486);
INSERT INTO acl VALUES (111, 1442457904608);
INSERT INTO acl VALUES (112, 1442457904720);
INSERT INTO acl VALUES (113, 1442457904842);
INSERT INTO acl VALUES (114, 1442457904959);
INSERT INTO acl VALUES (115, 1442457905086);
INSERT INTO acl VALUES (116, 1442457905212);
INSERT INTO acl VALUES (117, 1442457905505);
INSERT INTO acl VALUES (118, 1442457905617);
INSERT INTO acl VALUES (119, 1442457905746);
INSERT INTO acl VALUES (120, 1442457905863);
INSERT INTO acl VALUES (121, 1442457905985);
INSERT INTO acl VALUES (122, 1442457906071);
INSERT INTO acl VALUES (123, 1442457906181);
INSERT INTO acl VALUES (124, 1442457906284);
INSERT INTO acl VALUES (125, 1442457906432);
INSERT INTO acl VALUES (126, 1442457906558);
INSERT INTO acl VALUES (127, 1442457906699);
INSERT INTO acl VALUES (128, 1442457906853);
INSERT INTO acl VALUES (129, 1442457907034);
INSERT INTO acl VALUES (130, 1442457907259);
INSERT INTO acl VALUES (131, 1442457907364);
INSERT INTO acl VALUES (132, 1442457907493);
INSERT INTO acl VALUES (133, 1442457907593);
INSERT INTO acl VALUES (134, 1442457907703);
INSERT INTO acl VALUES (135, 1442457907824);
INSERT INTO acl VALUES (136, 1442457907937);
INSERT INTO acl VALUES (137, 1442457908212);
INSERT INTO acl VALUES (138, 1442457908347);
INSERT INTO acl VALUES (139, 1442457908492);
INSERT INTO acl VALUES (140, 1442457908602);
INSERT INTO acl VALUES (141, 1442457908743);
INSERT INTO acl VALUES (142, 1442457908868);
INSERT INTO acl VALUES (143, 1442457908994);
INSERT INTO acl VALUES (144, 1442457909092);
INSERT INTO acl VALUES (145, 1442457909179);
INSERT INTO acl VALUES (146, 1442457909305);
INSERT INTO acl VALUES (147, 1442457909595);
INSERT INTO acl VALUES (148, 1442457909725);
INSERT INTO acl VALUES (149, 1442457909882);
INSERT INTO acl VALUES (150, 1442458426752);
INSERT INTO acl VALUES (154, 1442458921796);
INSERT INTO acl VALUES (155, 1442458935973);
INSERT INTO acl VALUES (156, 1442458944213);
INSERT INTO acl VALUES (157, 1442458960621);
INSERT INTO acl VALUES (158, 1442459008370);


--
-- TOC entry 2421 (class 0 OID 22911)
-- Dependencies: 174
-- Data for Name: acl_aclentry; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2420 (class 0 OID 22903)
-- Dependencies: 173
-- Data for Name: aclentry; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2422 (class 0 OID 22916)
-- Dependencies: 175
-- Data for Name: artifacttrigger; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2423 (class 0 OID 22924)
-- Dependencies: 176
-- Data for Name: attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO attribute VALUES ('MultilineTextAttribute', 1, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 2, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 3, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2010-07-06 19:00:25', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 4, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 5, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 6, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2010-07-06 19:00:25', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 7, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 8, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 9, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2007-07-11 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 10, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 11, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 12, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2007-07-11 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 13, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 14, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'In Progress', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 15, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2011-11-29 14:40:36', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 16, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 17, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Complete', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 18, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2011-11-29 14:40:36', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 19, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 20, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Complete', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 21, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2011-11-29 14:40:36', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 22, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 23, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 24, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2010-07-06 19:00:25', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 25, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 26, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Complete', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 27, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2032-06-28 21:15:00', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 28, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 29, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 30, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2007-07-11 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 31, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 32, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 33, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2007-07-11 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 34, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 35, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 36, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2026-07-09 21:15:27', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 37, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 38, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Passed Review', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 39, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2011-07-03 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 40, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 41, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Complete', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 42, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2010-07-06 19:00:25', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 43, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 44, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Passed Review', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 45, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2011-07-03 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 46, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 47, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 48, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2011-07-03 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 49, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 50, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Passed Review', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 51, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2010-07-06 19:00:25', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 52, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 53, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 54, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2007-07-11 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 55, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 56, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 57, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2007-07-11 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 58, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 59, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'In Progress', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 60, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2007-07-11 18:00:00', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 61, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 62, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 63, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2010-07-06 19:00:25', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 64, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 65, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 66, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2010-07-06 19:00:25', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 67, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 68, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Passed Review', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 69, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2011-07-03 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 70, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 71, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 72, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2010-07-06 19:00:25', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 73, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 74, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Passed Review', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 75, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2010-07-06 19:00:25', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 76, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 77, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 78, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2011-07-03 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 79, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 80, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 81, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2010-07-06 19:00:25', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 82, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 83, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 84, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2011-11-29 14:40:36', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 85, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 86, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 87, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2011-11-29 14:40:36', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 88, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 89, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 90, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2011-11-29 14:40:36', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 91, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 92, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Complete', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 93, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2010-07-06 19:00:25', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 94, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 95, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Complete', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 96, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2010-07-06 19:00:25', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 97, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 98, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Complete', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 99, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2010-07-06 19:00:25', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 100, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 101, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Complete', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 102, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2010-07-06 19:00:25', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 103, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 104, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Complete', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 105, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2011-11-29 14:40:36', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 106, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 107, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('DateAttribute', 108, 'Review By', 'Specifies the date that this artifact should be reviewed by.', 2, false, NULL, NULL, NULL, '2010-07-06 19:00:25', NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultiSelectionListAttribute', 109, 'Primary Actor(s)', 'A primary actor is someone or something outside the system that acts on the system.', 3, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b47020000787000000006740008437573746f6d6572740012576562205365727669636520436c69656e7474001453797374656d2041646d696e6973747261746f7274000e54726164696e672053797374656d74000442616e6b74001a43726564697420566572696669636174696f6e2053797374656d', NULL, NULL);
INSERT INTO attribute VALUES ('MultiSelectionListAttribute', 110, 'Secondary Actor(s)', 'A secondary actor is someone or something outside that is acted on by the system.', 4, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b47020000787000000006740008437573746f6d6572740012576562205365727669636520436c69656e7474001453797374656d2041646d696e6973747261746f7274001745787465726e616c2054726164696e672053797374656d74002345787465726e616c2043726564697420566572696669636174696f6e2053797374656d74000442616e6b', NULL, NULL);
INSERT INTO attribute VALUES ('MultiSelectionListAttribute', 111, 'Primary Actor(s)', 'A primary actor is someone or something outside the system that acts on the system.', 3, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b47020000787000000006740008437573746f6d6572740012576562205365727669636520436c69656e7474001453797374656d2041646d696e6973747261746f7274000e54726164696e672053797374656d74000442616e6b74001a43726564697420566572696669636174696f6e2053797374656d', NULL, NULL);
INSERT INTO attribute VALUES ('MultiSelectionListAttribute', 112, 'Secondary Actor(s)', 'A secondary actor is someone or something outside that is acted on by the system.', 4, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b47020000787000000006740008437573746f6d6572740012576562205365727669636520436c69656e7474001453797374656d2041646d696e6973747261746f7274001745787465726e616c2054726164696e672053797374656d74002345787465726e616c2043726564697420566572696669636174696f6e2053797374656d74000442616e6b', NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 113, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('BooleanAttribute', 114, 'Abstract Actor', 'If checked then this actor represents a user role.  If not checked then this actor is a concrete actor. ', 5, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('BooleanAttribute', 115, 'Abstract Actor', 'If checked then this actor represents a user role.  If not checked then this actor is a concrete actor. ', 5, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 116, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 117, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('MultiSelectionListAttribute', 118, 'Primary Actor(s)', 'A primary actor is someone or something outside the system that acts on the system.', 3, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b47020000787000000006740008437573746f6d6572740012576562205365727669636520436c69656e7474001453797374656d2041646d696e6973747261746f7274000e54726164696e672053797374656d74000442616e6b74001a43726564697420566572696669636174696f6e2053797374656d', NULL, NULL);
INSERT INTO attribute VALUES ('MultiSelectionListAttribute', 119, 'Secondary Actor(s)', 'A secondary actor is someone or something outside that is acted on by the system.', 4, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b47020000787000000006740008437573746f6d6572740012576562205365727669636520436c69656e7474001453797374656d2041646d696e6973747261746f7274001745787465726e616c2054726164696e672053797374656d74002345787465726e616c2043726564697420566572696669636174696f6e2053797374656d74000442616e6b', NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 120, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('BooleanAttribute', 121, 'Abstract Actor', 'If checked then this actor represents a user role.  If not checked then this actor is a concrete actor. ', 5, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('BooleanAttribute', 122, 'Abstract Actor', 'If checked then this actor represents a user role.  If not checked then this actor is a concrete actor. ', 5, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('BooleanAttribute', 123, 'Abstract Actor', 'If checked then this actor represents a user role.  If not checked then this actor is a concrete actor. ', 5, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('BooleanAttribute', 124, 'Abstract Actor', 'If checked then this actor represents a user role.  If not checked then this actor is a concrete actor. ', 5, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('BooleanAttribute', 125, 'Abstract Actor', 'If checked then this actor represents a user role.  If not checked then this actor is a concrete actor. ', 5, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('BooleanAttribute', 126, 'Abstract Actor', 'If checked then this actor represents a user role.  If not checked then this actor is a concrete actor. ', 5, false, NULL, false, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('MultiSelectionListAttribute', 127, 'Primary Actor(s)', 'A primary actor is someone or something outside the system that acts on the system.', 3, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b47020000787000000006740008437573746f6d6572740012576562205365727669636520436c69656e7474001453797374656d2041646d696e6973747261746f7274000e54726164696e672053797374656d74000442616e6b74001a43726564697420566572696669636174696f6e2053797374656d', NULL, NULL);
INSERT INTO attribute VALUES ('MultiSelectionListAttribute', 128, 'Secondary Actor(s)', 'A secondary actor is someone or something outside that is acted on by the system.', 4, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b47020000787000000006740008437573746f6d6572740012576562205365727669636520436c69656e7474001453797374656d2041646d696e6973747261746f7274001745787465726e616c2054726164696e672053797374656d74002345787465726e616c2043726564697420566572696669636174696f6e2053797374656d74000442616e6b', NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 129, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('MultiSelectionListAttribute', 130, 'Primary Actor(s)', 'A primary actor is someone or something outside the system that acts on the system.', 3, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b47020000787000000006740008437573746f6d6572740012576562205365727669636520436c69656e7474001453797374656d2041646d696e6973747261746f7274000e54726164696e672053797374656d74000442616e6b74001a43726564697420566572696669636174696f6e2053797374656d', NULL, NULL);
INSERT INTO attribute VALUES ('MultiSelectionListAttribute', 131, 'Secondary Actor(s)', 'A secondary actor is someone or something outside that is acted on by the system.', 4, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b47020000787000000006740008437573746f6d6572740012576562205365727669636520436c69656e7474001453797374656d2041646d696e6973747261746f7274001745787465726e616c2054726164696e672053797374656d74002345787465726e616c2043726564697420566572696669636174696f6e2053797374656d74000442616e6b', NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 132, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('MultiSelectionListAttribute', 133, 'Primary Actor(s)', 'A primary actor is someone or something outside the system that acts on the system.', 3, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b47020000787000000006740008437573746f6d6572740012576562205365727669636520436c69656e7474001453797374656d2041646d696e6973747261746f7274000e54726164696e672053797374656d74000442616e6b74001a43726564697420566572696669636174696f6e2053797374656d', NULL, NULL);
INSERT INTO attribute VALUES ('MultiSelectionListAttribute', 134, 'Secondary Actor(s)', 'A secondary actor is someone or something outside that is acted on by the system.', 4, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b47020000787000000006740008437573746f6d6572740012576562205365727669636520436c69656e7474001453797374656d2041646d696e6973747261746f7274001745787465726e616c2054726164696e672053797374656d74002345787465726e616c2043726564697420566572696669636174696f6e2053797374656d74000442616e6b', NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 135, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Complete', NULL);
INSERT INTO attribute VALUES ('MultiSelectionListAttribute', 136, 'Primary Actor(s)', 'A primary actor is someone or something outside the system that acts on the system.', 3, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b47020000787000000006740008437573746f6d6572740012576562205365727669636520436c69656e7474001453797374656d2041646d696e6973747261746f7274000e54726164696e672053797374656d74000442616e6b74001a43726564697420566572696669636174696f6e2053797374656d', NULL, NULL);
INSERT INTO attribute VALUES ('MultiSelectionListAttribute', 137, 'Secondary Actor(s)', 'A secondary actor is someone or something outside that is acted on by the system.', 4, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b47020000787000000006740008437573746f6d6572740012576562205365727669636520436c69656e7474001453797374656d2041646d696e6973747261746f7274001745787465726e616c2054726164696e672053797374656d74002345787465726e616c2043726564697420566572696669636174696f6e2053797374656d74000442616e6b', NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 138, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('MultiSelectionListAttribute', 139, 'Primary Actor(s)', 'A primary actor is someone or something outside the system that acts on the system.', 3, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b47020000787000000006740008437573746f6d6572740012576562205365727669636520436c69656e7474001453797374656d2041646d696e6973747261746f7274000e54726164696e672053797374656d74000442616e6b74001a43726564697420566572696669636174696f6e2053797374656d', NULL, NULL);
INSERT INTO attribute VALUES ('MultiSelectionListAttribute', 140, 'Secondary Actor(s)', 'A secondary actor is someone or something outside that is acted on by the system.', 4, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b47020000787000000006740008437573746f6d6572740012576562205365727669636520436c69656e7474001453797374656d2041646d696e6973747261746f7274001745787465726e616c2054726164696e672053797374656d74002345787465726e616c2043726564697420566572696669636174696f6e2053797374656d74000442616e6b', NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 141, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 142, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 143, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 144, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 145, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'In Progress', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 146, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 147, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'In Progress', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 148, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 149, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'In Progress', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 150, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 151, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'In Progress', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 152, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 153, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'In Progress', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 154, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 155, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'In Progress', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 156, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 157, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'In Progress', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 158, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 159, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'In Progress', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 160, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 161, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'In Progress', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 162, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 163, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'In Progress', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 164, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 165, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'In Progress', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 166, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 167, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 168, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 169, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 170, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 171, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 172, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 173, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Complete', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 174, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 175, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Complete', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 176, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 177, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 178, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 179, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 180, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 181, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 182, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 183, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Submitted', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 184, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 185, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Passed Review', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 186, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 187, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Passed Review', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 188, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 189, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);
INSERT INTO attribute VALUES ('MultilineTextAttribute', 190, 'Notes', 'Miscellaneous notes that do not belong in the body of the requirement.', 0, false, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO attribute VALUES ('SingleSelectionListAttribute', 191, 'Status', 'The status of the artifact.', 1, false, NULL, NULL, NULL, NULL, NULL, '\xaced0005757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000057400095375626d697474656474000e50656e64696e672052657669657774000d5061737365642052657669657774000b496e2050726f6772657373740008436f6d706c657465', 'Pending Review', NULL);


--
-- TOC entry 2424 (class 0 OID 22932)
-- Dependencies: 177
-- Data for Name: attribute_dns; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2425 (class 0 OID 22937)
-- Dependencies: 178
-- Data for Name: attribute_listitems; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2426 (class 0 OID 22942)
-- Dependencies: 179
-- Data for Name: attribute_selecteddns; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2427 (class 0 OID 22947)
-- Dependencies: 180
-- Data for Name: attribute_selecteditems; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO attribute_selecteditems VALUES (111, 'Customer', 0);
INSERT INTO attribute_selecteditems VALUES (118, 'Customer', 0);
INSERT INTO attribute_selecteditems VALUES (119, 'System Administrator', 0);
INSERT INTO attribute_selecteditems VALUES (119, 'External Credit Verification System', 1);
INSERT INTO attribute_selecteditems VALUES (127, 'Customer', 0);
INSERT INTO attribute_selecteditems VALUES (127, 'System Administrator', 1);
INSERT INTO attribute_selecteditems VALUES (130, 'Customer', 0);
INSERT INTO attribute_selecteditems VALUES (131, 'External Trading System', 0);
INSERT INTO attribute_selecteditems VALUES (133, 'Customer', 0);
INSERT INTO attribute_selecteditems VALUES (134, 'Bank', 0);
INSERT INTO attribute_selecteditems VALUES (136, 'Customer', 0);
INSERT INTO attribute_selecteditems VALUES (137, 'Bank', 0);
INSERT INTO attribute_selecteditems VALUES (139, 'Customer', 0);
INSERT INTO attribute_selecteditems VALUES (139, 'Web Service Client', 1);


--
-- TOC entry 2428 (class 0 OID 22952)
-- Dependencies: 181
-- Data for Name: axiomlock; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2429 (class 0 OID 22957)
-- Dependencies: 182
-- Data for Name: childhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO childhistory VALUES (0);
INSERT INTO childhistory VALUES (2);
INSERT INTO childhistory VALUES (3);
INSERT INTO childhistory VALUES (4);
INSERT INTO childhistory VALUES (5);
INSERT INTO childhistory VALUES (6);
INSERT INTO childhistory VALUES (7);
INSERT INTO childhistory VALUES (8);
INSERT INTO childhistory VALUES (9);
INSERT INTO childhistory VALUES (10);
INSERT INTO childhistory VALUES (11);
INSERT INTO childhistory VALUES (12);
INSERT INTO childhistory VALUES (13);
INSERT INTO childhistory VALUES (14);
INSERT INTO childhistory VALUES (15);
INSERT INTO childhistory VALUES (16);
INSERT INTO childhistory VALUES (17);
INSERT INTO childhistory VALUES (18);
INSERT INTO childhistory VALUES (19);
INSERT INTO childhistory VALUES (20);
INSERT INTO childhistory VALUES (21);
INSERT INTO childhistory VALUES (22);
INSERT INTO childhistory VALUES (23);
INSERT INTO childhistory VALUES (24);
INSERT INTO childhistory VALUES (25);
INSERT INTO childhistory VALUES (26);
INSERT INTO childhistory VALUES (27);
INSERT INTO childhistory VALUES (28);
INSERT INTO childhistory VALUES (29);
INSERT INTO childhistory VALUES (30);
INSERT INTO childhistory VALUES (31);
INSERT INTO childhistory VALUES (32);
INSERT INTO childhistory VALUES (33);
INSERT INTO childhistory VALUES (34);
INSERT INTO childhistory VALUES (35);
INSERT INTO childhistory VALUES (36);
INSERT INTO childhistory VALUES (37);
INSERT INTO childhistory VALUES (38);
INSERT INTO childhistory VALUES (39);
INSERT INTO childhistory VALUES (40);
INSERT INTO childhistory VALUES (41);
INSERT INTO childhistory VALUES (42);
INSERT INTO childhistory VALUES (43);
INSERT INTO childhistory VALUES (44);
INSERT INTO childhistory VALUES (45);
INSERT INTO childhistory VALUES (46);
INSERT INTO childhistory VALUES (47);
INSERT INTO childhistory VALUES (48);
INSERT INTO childhistory VALUES (49);
INSERT INTO childhistory VALUES (50);
INSERT INTO childhistory VALUES (51);
INSERT INTO childhistory VALUES (52);
INSERT INTO childhistory VALUES (53);
INSERT INTO childhistory VALUES (54);
INSERT INTO childhistory VALUES (55);
INSERT INTO childhistory VALUES (56);
INSERT INTO childhistory VALUES (57);
INSERT INTO childhistory VALUES (58);
INSERT INTO childhistory VALUES (59);
INSERT INTO childhistory VALUES (60);
INSERT INTO childhistory VALUES (61);
INSERT INTO childhistory VALUES (62);
INSERT INTO childhistory VALUES (63);
INSERT INTO childhistory VALUES (64);
INSERT INTO childhistory VALUES (65);
INSERT INTO childhistory VALUES (66);
INSERT INTO childhistory VALUES (67);
INSERT INTO childhistory VALUES (68);
INSERT INTO childhistory VALUES (69);
INSERT INTO childhistory VALUES (70);
INSERT INTO childhistory VALUES (71);
INSERT INTO childhistory VALUES (72);
INSERT INTO childhistory VALUES (73);
INSERT INTO childhistory VALUES (74);
INSERT INTO childhistory VALUES (75);
INSERT INTO childhistory VALUES (76);
INSERT INTO childhistory VALUES (77);
INSERT INTO childhistory VALUES (78);
INSERT INTO childhistory VALUES (79);
INSERT INTO childhistory VALUES (80);
INSERT INTO childhistory VALUES (81);
INSERT INTO childhistory VALUES (82);
INSERT INTO childhistory VALUES (83);
INSERT INTO childhistory VALUES (84);
INSERT INTO childhistory VALUES (85);
INSERT INTO childhistory VALUES (86);
INSERT INTO childhistory VALUES (87);
INSERT INTO childhistory VALUES (88);
INSERT INTO childhistory VALUES (89);
INSERT INTO childhistory VALUES (90);
INSERT INTO childhistory VALUES (91);
INSERT INTO childhistory VALUES (92);
INSERT INTO childhistory VALUES (93);
INSERT INTO childhistory VALUES (94);
INSERT INTO childhistory VALUES (95);
INSERT INTO childhistory VALUES (96);
INSERT INTO childhistory VALUES (97);
INSERT INTO childhistory VALUES (98);
INSERT INTO childhistory VALUES (99);
INSERT INTO childhistory VALUES (100);
INSERT INTO childhistory VALUES (101);
INSERT INTO childhistory VALUES (102);
INSERT INTO childhistory VALUES (103);
INSERT INTO childhistory VALUES (104);
INSERT INTO childhistory VALUES (105);
INSERT INTO childhistory VALUES (106);
INSERT INTO childhistory VALUES (107);
INSERT INTO childhistory VALUES (108);
INSERT INTO childhistory VALUES (109);
INSERT INTO childhistory VALUES (110);
INSERT INTO childhistory VALUES (111);
INSERT INTO childhistory VALUES (112);
INSERT INTO childhistory VALUES (113);
INSERT INTO childhistory VALUES (114);
INSERT INTO childhistory VALUES (115);
INSERT INTO childhistory VALUES (116);
INSERT INTO childhistory VALUES (117);
INSERT INTO childhistory VALUES (118);
INSERT INTO childhistory VALUES (119);
INSERT INTO childhistory VALUES (120);
INSERT INTO childhistory VALUES (121);
INSERT INTO childhistory VALUES (122);
INSERT INTO childhistory VALUES (123);
INSERT INTO childhistory VALUES (124);
INSERT INTO childhistory VALUES (125);
INSERT INTO childhistory VALUES (126);
INSERT INTO childhistory VALUES (127);
INSERT INTO childhistory VALUES (128);
INSERT INTO childhistory VALUES (129);
INSERT INTO childhistory VALUES (130);
INSERT INTO childhistory VALUES (131);
INSERT INTO childhistory VALUES (132);
INSERT INTO childhistory VALUES (133);
INSERT INTO childhistory VALUES (134);
INSERT INTO childhistory VALUES (135);
INSERT INTO childhistory VALUES (136);
INSERT INTO childhistory VALUES (137);
INSERT INTO childhistory VALUES (138);
INSERT INTO childhistory VALUES (139);
INSERT INTO childhistory VALUES (140);
INSERT INTO childhistory VALUES (141);
INSERT INTO childhistory VALUES (142);
INSERT INTO childhistory VALUES (143);
INSERT INTO childhistory VALUES (144);
INSERT INTO childhistory VALUES (145);
INSERT INTO childhistory VALUES (146);
INSERT INTO childhistory VALUES (147);
INSERT INTO childhistory VALUES (148);
INSERT INTO childhistory VALUES (149);


--
-- TOC entry 2431 (class 0 OID 22967)
-- Dependencies: 184
-- Data for Name: childhistory_childhistoryentry; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO childhistory_childhistoryentry VALUES (0, 305);
INSERT INTO childhistory_childhistoryentry VALUES (2, 306);
INSERT INTO childhistory_childhistoryentry VALUES (3, 307);
INSERT INTO childhistory_childhistoryentry VALUES (4, 308);
INSERT INTO childhistory_childhistoryentry VALUES (5, 309);
INSERT INTO childhistory_childhistoryentry VALUES (6, 310);
INSERT INTO childhistory_childhistoryentry VALUES (7, 311);
INSERT INTO childhistory_childhistoryentry VALUES (8, 312);
INSERT INTO childhistory_childhistoryentry VALUES (9, 313);
INSERT INTO childhistory_childhistoryentry VALUES (10, 314);
INSERT INTO childhistory_childhistoryentry VALUES (11, 315);
INSERT INTO childhistory_childhistoryentry VALUES (12, 316);
INSERT INTO childhistory_childhistoryentry VALUES (13, 317);
INSERT INTO childhistory_childhistoryentry VALUES (14, 318);
INSERT INTO childhistory_childhistoryentry VALUES (15, 319);
INSERT INTO childhistory_childhistoryentry VALUES (16, 320);
INSERT INTO childhistory_childhistoryentry VALUES (17, 321);
INSERT INTO childhistory_childhistoryentry VALUES (18, 322);
INSERT INTO childhistory_childhistoryentry VALUES (19, 323);
INSERT INTO childhistory_childhistoryentry VALUES (20, 324);
INSERT INTO childhistory_childhistoryentry VALUES (21, 325);
INSERT INTO childhistory_childhistoryentry VALUES (22, 326);
INSERT INTO childhistory_childhistoryentry VALUES (23, 327);
INSERT INTO childhistory_childhistoryentry VALUES (24, 328);
INSERT INTO childhistory_childhistoryentry VALUES (25, 329);
INSERT INTO childhistory_childhistoryentry VALUES (26, 330);
INSERT INTO childhistory_childhistoryentry VALUES (27, 331);
INSERT INTO childhistory_childhistoryentry VALUES (28, 332);
INSERT INTO childhistory_childhistoryentry VALUES (29, 333);
INSERT INTO childhistory_childhistoryentry VALUES (30, 334);
INSERT INTO childhistory_childhistoryentry VALUES (31, 335);
INSERT INTO childhistory_childhistoryentry VALUES (32, 336);
INSERT INTO childhistory_childhistoryentry VALUES (33, 337);
INSERT INTO childhistory_childhistoryentry VALUES (34, 338);
INSERT INTO childhistory_childhistoryentry VALUES (35, 339);
INSERT INTO childhistory_childhistoryentry VALUES (36, 340);
INSERT INTO childhistory_childhistoryentry VALUES (37, 341);
INSERT INTO childhistory_childhistoryentry VALUES (38, 342);
INSERT INTO childhistory_childhistoryentry VALUES (39, 343);
INSERT INTO childhistory_childhistoryentry VALUES (40, 344);
INSERT INTO childhistory_childhistoryentry VALUES (41, 345);
INSERT INTO childhistory_childhistoryentry VALUES (42, 346);
INSERT INTO childhistory_childhistoryentry VALUES (43, 347);
INSERT INTO childhistory_childhistoryentry VALUES (44, 348);
INSERT INTO childhistory_childhistoryentry VALUES (45, 349);
INSERT INTO childhistory_childhistoryentry VALUES (46, 350);
INSERT INTO childhistory_childhistoryentry VALUES (47, 351);
INSERT INTO childhistory_childhistoryentry VALUES (48, 352);
INSERT INTO childhistory_childhistoryentry VALUES (49, 353);
INSERT INTO childhistory_childhistoryentry VALUES (50, 354);
INSERT INTO childhistory_childhistoryentry VALUES (51, 355);
INSERT INTO childhistory_childhistoryentry VALUES (52, 356);
INSERT INTO childhistory_childhistoryentry VALUES (53, 357);
INSERT INTO childhistory_childhistoryentry VALUES (54, 358);
INSERT INTO childhistory_childhistoryentry VALUES (55, 359);
INSERT INTO childhistory_childhistoryentry VALUES (56, 360);
INSERT INTO childhistory_childhistoryentry VALUES (57, 361);
INSERT INTO childhistory_childhistoryentry VALUES (58, 362);
INSERT INTO childhistory_childhistoryentry VALUES (59, 363);
INSERT INTO childhistory_childhistoryentry VALUES (60, 364);
INSERT INTO childhistory_childhistoryentry VALUES (61, 365);
INSERT INTO childhistory_childhistoryentry VALUES (62, 366);
INSERT INTO childhistory_childhistoryentry VALUES (63, 367);
INSERT INTO childhistory_childhistoryentry VALUES (64, 368);
INSERT INTO childhistory_childhistoryentry VALUES (65, 369);
INSERT INTO childhistory_childhistoryentry VALUES (66, 370);
INSERT INTO childhistory_childhistoryentry VALUES (67, 371);
INSERT INTO childhistory_childhistoryentry VALUES (68, 372);
INSERT INTO childhistory_childhistoryentry VALUES (69, 373);
INSERT INTO childhistory_childhistoryentry VALUES (70, 374);
INSERT INTO childhistory_childhistoryentry VALUES (71, 375);
INSERT INTO childhistory_childhistoryentry VALUES (72, 376);
INSERT INTO childhistory_childhistoryentry VALUES (73, 377);
INSERT INTO childhistory_childhistoryentry VALUES (74, 378);
INSERT INTO childhistory_childhistoryentry VALUES (75, 379);
INSERT INTO childhistory_childhistoryentry VALUES (76, 380);
INSERT INTO childhistory_childhistoryentry VALUES (77, 381);
INSERT INTO childhistory_childhistoryentry VALUES (78, 382);
INSERT INTO childhistory_childhistoryentry VALUES (79, 383);
INSERT INTO childhistory_childhistoryentry VALUES (80, 384);
INSERT INTO childhistory_childhistoryentry VALUES (81, 385);
INSERT INTO childhistory_childhistoryentry VALUES (82, 386);
INSERT INTO childhistory_childhistoryentry VALUES (83, 387);
INSERT INTO childhistory_childhistoryentry VALUES (84, 388);
INSERT INTO childhistory_childhistoryentry VALUES (85, 389);
INSERT INTO childhistory_childhistoryentry VALUES (86, 390);
INSERT INTO childhistory_childhistoryentry VALUES (87, 391);
INSERT INTO childhistory_childhistoryentry VALUES (88, 392);
INSERT INTO childhistory_childhistoryentry VALUES (89, 393);
INSERT INTO childhistory_childhistoryentry VALUES (90, 394);
INSERT INTO childhistory_childhistoryentry VALUES (91, 395);
INSERT INTO childhistory_childhistoryentry VALUES (92, 396);
INSERT INTO childhistory_childhistoryentry VALUES (93, 397);
INSERT INTO childhistory_childhistoryentry VALUES (94, 398);
INSERT INTO childhistory_childhistoryentry VALUES (95, 399);
INSERT INTO childhistory_childhistoryentry VALUES (96, 400);
INSERT INTO childhistory_childhistoryentry VALUES (97, 401);
INSERT INTO childhistory_childhistoryentry VALUES (98, 402);
INSERT INTO childhistory_childhistoryentry VALUES (99, 403);
INSERT INTO childhistory_childhistoryentry VALUES (100, 404);
INSERT INTO childhistory_childhistoryentry VALUES (101, 405);
INSERT INTO childhistory_childhistoryentry VALUES (102, 406);
INSERT INTO childhistory_childhistoryentry VALUES (103, 407);
INSERT INTO childhistory_childhistoryentry VALUES (104, 408);
INSERT INTO childhistory_childhistoryentry VALUES (105, 409);
INSERT INTO childhistory_childhistoryentry VALUES (106, 410);
INSERT INTO childhistory_childhistoryentry VALUES (107, 411);
INSERT INTO childhistory_childhistoryentry VALUES (108, 412);
INSERT INTO childhistory_childhistoryentry VALUES (109, 413);
INSERT INTO childhistory_childhistoryentry VALUES (110, 414);
INSERT INTO childhistory_childhistoryentry VALUES (111, 415);
INSERT INTO childhistory_childhistoryentry VALUES (112, 416);
INSERT INTO childhistory_childhistoryentry VALUES (113, 417);
INSERT INTO childhistory_childhistoryentry VALUES (114, 418);
INSERT INTO childhistory_childhistoryentry VALUES (115, 419);
INSERT INTO childhistory_childhistoryentry VALUES (116, 420);
INSERT INTO childhistory_childhistoryentry VALUES (117, 421);
INSERT INTO childhistory_childhistoryentry VALUES (118, 422);
INSERT INTO childhistory_childhistoryentry VALUES (119, 423);
INSERT INTO childhistory_childhistoryentry VALUES (120, 424);
INSERT INTO childhistory_childhistoryentry VALUES (121, 425);
INSERT INTO childhistory_childhistoryentry VALUES (122, 426);
INSERT INTO childhistory_childhistoryentry VALUES (123, 427);
INSERT INTO childhistory_childhistoryentry VALUES (124, 428);
INSERT INTO childhistory_childhistoryentry VALUES (125, 429);
INSERT INTO childhistory_childhistoryentry VALUES (126, 430);
INSERT INTO childhistory_childhistoryentry VALUES (127, 431);
INSERT INTO childhistory_childhistoryentry VALUES (128, 432);
INSERT INTO childhistory_childhistoryentry VALUES (129, 433);
INSERT INTO childhistory_childhistoryentry VALUES (130, 434);
INSERT INTO childhistory_childhistoryentry VALUES (131, 435);
INSERT INTO childhistory_childhistoryentry VALUES (132, 436);
INSERT INTO childhistory_childhistoryentry VALUES (133, 437);
INSERT INTO childhistory_childhistoryentry VALUES (134, 438);
INSERT INTO childhistory_childhistoryentry VALUES (135, 439);
INSERT INTO childhistory_childhistoryentry VALUES (136, 440);
INSERT INTO childhistory_childhistoryentry VALUES (137, 441);
INSERT INTO childhistory_childhistoryentry VALUES (138, 442);
INSERT INTO childhistory_childhistoryentry VALUES (139, 443);
INSERT INTO childhistory_childhistoryentry VALUES (140, 444);
INSERT INTO childhistory_childhistoryentry VALUES (141, 445);
INSERT INTO childhistory_childhistoryentry VALUES (142, 446);
INSERT INTO childhistory_childhistoryentry VALUES (143, 447);
INSERT INTO childhistory_childhistoryentry VALUES (144, 448);
INSERT INTO childhistory_childhistoryentry VALUES (145, 449);
INSERT INTO childhistory_childhistoryentry VALUES (146, 450);
INSERT INTO childhistory_childhistoryentry VALUES (147, 451);
INSERT INTO childhistory_childhistoryentry VALUES (148, 452);
INSERT INTO childhistory_childhistoryentry VALUES (149, 453);


--
-- TOC entry 2430 (class 0 OID 22962)
-- Dependencies: 183
-- Data for Name: childhistoryentry; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO childhistoryentry VALUES (305, 1442458210466, 9223372036854775807, 23809);
INSERT INTO childhistoryentry VALUES (306, 1442458210466, 9223372036854775807, 23810);
INSERT INTO childhistoryentry VALUES (307, 1442458210466, 9223372036854775807, 23811);
INSERT INTO childhistoryentry VALUES (308, 1442458210466, 9223372036854775807, 23812);
INSERT INTO childhistoryentry VALUES (309, 1442458210466, 9223372036854775807, 23813);
INSERT INTO childhistoryentry VALUES (310, 1442458210466, 9223372036854775807, 23814);
INSERT INTO childhistoryentry VALUES (311, 1442458210466, 9223372036854775807, 23815);
INSERT INTO childhistoryentry VALUES (312, 1442458210466, 9223372036854775807, 23816);
INSERT INTO childhistoryentry VALUES (313, 1442458210466, 9223372036854775807, 23817);
INSERT INTO childhistoryentry VALUES (314, 1442458210466, 9223372036854775807, 23818);
INSERT INTO childhistoryentry VALUES (315, 1442458210466, 9223372036854775807, 23819);
INSERT INTO childhistoryentry VALUES (316, 1442458210466, 9223372036854775807, 23820);
INSERT INTO childhistoryentry VALUES (317, 1442458210466, 9223372036854775807, 23821);
INSERT INTO childhistoryentry VALUES (318, 1442458210466, 9223372036854775807, 23822);
INSERT INTO childhistoryentry VALUES (319, 1442458210466, 9223372036854775807, 23823);
INSERT INTO childhistoryentry VALUES (320, 1442458210466, 9223372036854775807, 23824);
INSERT INTO childhistoryentry VALUES (321, 1442458210466, 9223372036854775807, 23825);
INSERT INTO childhistoryentry VALUES (322, 1442458210466, 9223372036854775807, 23826);
INSERT INTO childhistoryentry VALUES (323, 1442458210466, 9223372036854775807, 23827);
INSERT INTO childhistoryentry VALUES (324, 1442458210466, 9223372036854775807, 23828);
INSERT INTO childhistoryentry VALUES (325, 1442458210466, 9223372036854775807, 23829);
INSERT INTO childhistoryentry VALUES (326, 1442458210466, 9223372036854775807, 23830);
INSERT INTO childhistoryentry VALUES (327, 1442458210466, 9223372036854775807, 23831);
INSERT INTO childhistoryentry VALUES (328, 1442458210466, 9223372036854775807, 23832);
INSERT INTO childhistoryentry VALUES (329, 1442458210466, 9223372036854775807, 23833);
INSERT INTO childhistoryentry VALUES (330, 1442458210466, 9223372036854775807, 23834);
INSERT INTO childhistoryentry VALUES (331, 1442458210466, 9223372036854775807, 23835);
INSERT INTO childhistoryentry VALUES (332, 1442458210466, 9223372036854775807, 23836);
INSERT INTO childhistoryentry VALUES (333, 1442458210466, 9223372036854775807, 23837);
INSERT INTO childhistoryentry VALUES (334, 1442458210466, 9223372036854775807, 23838);
INSERT INTO childhistoryentry VALUES (335, 1442458210466, 9223372036854775807, 23839);
INSERT INTO childhistoryentry VALUES (336, 1442458210466, 9223372036854775807, 23840);
INSERT INTO childhistoryentry VALUES (337, 1442458210466, 9223372036854775807, 23841);
INSERT INTO childhistoryentry VALUES (338, 1442458210466, 9223372036854775807, 23842);
INSERT INTO childhistoryentry VALUES (339, 1442458210466, 9223372036854775807, 23843);
INSERT INTO childhistoryentry VALUES (340, 1442458210466, 9223372036854775807, 23844);
INSERT INTO childhistoryentry VALUES (341, 1442458210466, 9223372036854775807, 23845);
INSERT INTO childhistoryentry VALUES (342, 1442458210466, 9223372036854775807, 23846);
INSERT INTO childhistoryentry VALUES (343, 1442458210466, 9223372036854775807, 23847);
INSERT INTO childhistoryentry VALUES (344, 1442458210466, 9223372036854775807, 23848);
INSERT INTO childhistoryentry VALUES (345, 1442458210466, 9223372036854775807, 23849);
INSERT INTO childhistoryentry VALUES (346, 1442458210466, 9223372036854775807, 23850);
INSERT INTO childhistoryentry VALUES (347, 1442458210466, 9223372036854775807, 23851);
INSERT INTO childhistoryentry VALUES (348, 1442458210466, 9223372036854775807, 23852);
INSERT INTO childhistoryentry VALUES (349, 1442458210466, 9223372036854775807, 23853);
INSERT INTO childhistoryentry VALUES (350, 1442458210466, 9223372036854775807, 23854);
INSERT INTO childhistoryentry VALUES (351, 1442458210466, 9223372036854775807, 23855);
INSERT INTO childhistoryentry VALUES (352, 1442458210466, 9223372036854775807, 23856);
INSERT INTO childhistoryentry VALUES (353, 1442458210466, 9223372036854775807, 23857);
INSERT INTO childhistoryentry VALUES (354, 1442458210466, 9223372036854775807, 23858);
INSERT INTO childhistoryentry VALUES (355, 1442458210466, 9223372036854775807, 23859);
INSERT INTO childhistoryentry VALUES (356, 1442458210466, 9223372036854775807, 23860);
INSERT INTO childhistoryentry VALUES (357, 1442458210466, 9223372036854775807, 23861);
INSERT INTO childhistoryentry VALUES (358, 1442458210466, 9223372036854775807, 23862);
INSERT INTO childhistoryentry VALUES (359, 1442458210466, 9223372036854775807, 23863);
INSERT INTO childhistoryentry VALUES (360, 1442458210466, 9223372036854775807, 23864);
INSERT INTO childhistoryentry VALUES (361, 1442458210466, 9223372036854775807, 23865);
INSERT INTO childhistoryentry VALUES (362, 1442458210466, 9223372036854775807, 23866);
INSERT INTO childhistoryentry VALUES (363, 1442458210466, 9223372036854775807, 23867);
INSERT INTO childhistoryentry VALUES (364, 1442458210466, 9223372036854775807, 23868);
INSERT INTO childhistoryentry VALUES (365, 1442458210466, 9223372036854775807, 23869);
INSERT INTO childhistoryentry VALUES (366, 1442458210466, 9223372036854775807, 23870);
INSERT INTO childhistoryentry VALUES (367, 1442458210466, 9223372036854775807, 23871);
INSERT INTO childhistoryentry VALUES (368, 1442458210466, 9223372036854775807, 23872);
INSERT INTO childhistoryentry VALUES (369, 1442458210466, 9223372036854775807, 23873);
INSERT INTO childhistoryentry VALUES (370, 1442458210466, 9223372036854775807, 23874);
INSERT INTO childhistoryentry VALUES (371, 1442458210466, 9223372036854775807, 23875);
INSERT INTO childhistoryentry VALUES (372, 1442458210466, 9223372036854775807, 23876);
INSERT INTO childhistoryentry VALUES (373, 1442458210466, 9223372036854775807, 23877);
INSERT INTO childhistoryentry VALUES (374, 1442458210466, 9223372036854775807, 23878);
INSERT INTO childhistoryentry VALUES (375, 1442458210466, 9223372036854775807, 23879);
INSERT INTO childhistoryentry VALUES (376, 1442458210466, 9223372036854775807, 23880);
INSERT INTO childhistoryentry VALUES (377, 1442458210466, 9223372036854775807, 23881);
INSERT INTO childhistoryentry VALUES (378, 1442458210466, 9223372036854775807, 23882);
INSERT INTO childhistoryentry VALUES (379, 1442458210466, 9223372036854775807, 23883);
INSERT INTO childhistoryentry VALUES (380, 1442458210466, 9223372036854775807, 23884);
INSERT INTO childhistoryentry VALUES (381, 1442458210466, 9223372036854775807, 23885);
INSERT INTO childhistoryentry VALUES (382, 1442458210466, 9223372036854775807, 23886);
INSERT INTO childhistoryentry VALUES (383, 1442458210466, 9223372036854775807, 23887);
INSERT INTO childhistoryentry VALUES (384, 1442458210466, 9223372036854775807, 23888);
INSERT INTO childhistoryentry VALUES (385, 1442458210466, 9223372036854775807, 23889);
INSERT INTO childhistoryentry VALUES (386, 1442458210466, 9223372036854775807, 23890);
INSERT INTO childhistoryentry VALUES (387, 1442458210466, 9223372036854775807, 23891);
INSERT INTO childhistoryentry VALUES (388, 1442458210466, 9223372036854775807, 23892);
INSERT INTO childhistoryentry VALUES (389, 1442458210466, 9223372036854775807, 23893);
INSERT INTO childhistoryentry VALUES (390, 1442458210466, 9223372036854775807, 23894);
INSERT INTO childhistoryentry VALUES (391, 1442458210466, 9223372036854775807, 23895);
INSERT INTO childhistoryentry VALUES (392, 1442458210466, 9223372036854775807, 23896);
INSERT INTO childhistoryentry VALUES (393, 1442458210466, 9223372036854775807, 23897);
INSERT INTO childhistoryentry VALUES (394, 1442458210466, 9223372036854775807, 23898);
INSERT INTO childhistoryentry VALUES (395, 1442458210466, 9223372036854775807, 23899);
INSERT INTO childhistoryentry VALUES (396, 1442458210466, 9223372036854775807, 23900);
INSERT INTO childhistoryentry VALUES (397, 1442458210466, 9223372036854775807, 23901);
INSERT INTO childhistoryentry VALUES (398, 1442458210466, 9223372036854775807, 23902);
INSERT INTO childhistoryentry VALUES (399, 1442458210466, 9223372036854775807, 23903);
INSERT INTO childhistoryentry VALUES (400, 1442458210466, 9223372036854775807, 23904);
INSERT INTO childhistoryentry VALUES (401, 1442458210466, 9223372036854775807, 23905);
INSERT INTO childhistoryentry VALUES (402, 1442458210466, 9223372036854775807, 23906);
INSERT INTO childhistoryentry VALUES (403, 1442458210466, 9223372036854775807, 23907);
INSERT INTO childhistoryentry VALUES (404, 1442458210466, 9223372036854775807, 23908);
INSERT INTO childhistoryentry VALUES (405, 1442458210466, 9223372036854775807, 23909);
INSERT INTO childhistoryentry VALUES (406, 1442458210466, 9223372036854775807, 23910);
INSERT INTO childhistoryentry VALUES (407, 1442458210466, 9223372036854775807, 23911);
INSERT INTO childhistoryentry VALUES (408, 1442458210466, 9223372036854775807, 23912);
INSERT INTO childhistoryentry VALUES (409, 1442458210466, 9223372036854775807, 23913);
INSERT INTO childhistoryentry VALUES (410, 1442458210466, 9223372036854775807, 23914);
INSERT INTO childhistoryentry VALUES (411, 1442458210466, 9223372036854775807, 23915);
INSERT INTO childhistoryentry VALUES (412, 1442458210466, 9223372036854775807, 23916);
INSERT INTO childhistoryentry VALUES (413, 1442458210466, 9223372036854775807, 23917);
INSERT INTO childhistoryentry VALUES (414, 1442458210466, 9223372036854775807, 23918);
INSERT INTO childhistoryentry VALUES (415, 1442458210466, 9223372036854775807, 23919);
INSERT INTO childhistoryentry VALUES (416, 1442458210466, 9223372036854775807, 23920);
INSERT INTO childhistoryentry VALUES (417, 1442458210466, 9223372036854775807, 23921);
INSERT INTO childhistoryentry VALUES (418, 1442458210466, 9223372036854775807, 23922);
INSERT INTO childhistoryentry VALUES (419, 1442458210466, 9223372036854775807, 23923);
INSERT INTO childhistoryentry VALUES (420, 1442458210466, 9223372036854775807, 23924);
INSERT INTO childhistoryentry VALUES (421, 1442458210466, 9223372036854775807, 23925);
INSERT INTO childhistoryentry VALUES (422, 1442458210466, 9223372036854775807, 23926);
INSERT INTO childhistoryentry VALUES (423, 1442458210466, 9223372036854775807, 23927);
INSERT INTO childhistoryentry VALUES (424, 1442458210466, 9223372036854775807, 23928);
INSERT INTO childhistoryentry VALUES (425, 1442458210466, 9223372036854775807, 23929);
INSERT INTO childhistoryentry VALUES (426, 1442458210466, 9223372036854775807, 23930);
INSERT INTO childhistoryentry VALUES (427, 1442458210466, 9223372036854775807, 23931);
INSERT INTO childhistoryentry VALUES (428, 1442458210466, 9223372036854775807, 23932);
INSERT INTO childhistoryentry VALUES (429, 1442458210466, 9223372036854775807, 23933);
INSERT INTO childhistoryentry VALUES (430, 1442458210466, 9223372036854775807, 23934);
INSERT INTO childhistoryentry VALUES (431, 1442458210466, 9223372036854775807, 23935);
INSERT INTO childhistoryentry VALUES (432, 1442458210466, 9223372036854775807, 23936);
INSERT INTO childhistoryentry VALUES (433, 1442458210466, 9223372036854775807, 23937);
INSERT INTO childhistoryentry VALUES (434, 1442458210466, 9223372036854775807, 23938);
INSERT INTO childhistoryentry VALUES (435, 1442458210466, 9223372036854775807, 23939);
INSERT INTO childhistoryentry VALUES (436, 1442458210466, 9223372036854775807, 23940);
INSERT INTO childhistoryentry VALUES (437, 1442458210466, 9223372036854775807, 23941);
INSERT INTO childhistoryentry VALUES (438, 1442458210466, 9223372036854775807, 23942);
INSERT INTO childhistoryentry VALUES (439, 1442458210466, 9223372036854775807, 23943);
INSERT INTO childhistoryentry VALUES (440, 1442458210466, 9223372036854775807, 23944);
INSERT INTO childhistoryentry VALUES (441, 1442458210466, 9223372036854775807, 23945);
INSERT INTO childhistoryentry VALUES (442, 1442458210466, 9223372036854775807, 23946);
INSERT INTO childhistoryentry VALUES (443, 1442458210466, 9223372036854775807, 23947);
INSERT INTO childhistoryentry VALUES (444, 1442458210466, 9223372036854775807, 23948);
INSERT INTO childhistoryentry VALUES (445, 1442458210466, 9223372036854775807, 23949);
INSERT INTO childhistoryentry VALUES (446, 1442458210466, 9223372036854775807, 23950);
INSERT INTO childhistoryentry VALUES (447, 1442458210466, 9223372036854775807, 23951);
INSERT INTO childhistoryentry VALUES (448, 1442458210466, 9223372036854775807, 23952);
INSERT INTO childhistoryentry VALUES (449, 1442458210466, 9223372036854775807, 23953);
INSERT INTO childhistoryentry VALUES (450, 1442458210466, 9223372036854775807, 23954);
INSERT INTO childhistoryentry VALUES (451, 1442458210466, 9223372036854775807, 23955);
INSERT INTO childhistoryentry VALUES (452, 1442458210466, 9223372036854775807, 23956);
INSERT INTO childhistoryentry VALUES (453, 1442458210466, 9223372036854775807, 23957);


--
-- TOC entry 2472 (class 0 OID 23223)
-- Dependencies: 225
-- Data for Name: cndition; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cndition VALUES (11, true, NULL, false, NULL, NULL, 21);


--
-- TOC entry 2473 (class 0 OID 23231)
-- Dependencies: 226
-- Data for Name: cndition_sortdescriptors; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2432 (class 0 OID 22972)
-- Dependencies: 185
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2433 (class 0 OID 22980)
-- Dependencies: 186
-- Data for Name: consequence; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2474 (class 0 OID 23239)
-- Dependencies: 227
-- Data for Name: decision_cell; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2475 (class 0 OID 23247)
-- Dependencies: 228
-- Data for Name: decision_row; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2476 (class 0 OID 23252)
-- Dependencies: 229
-- Data for Name: decision_row_decision_cell; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2434 (class 0 OID 22988)
-- Dependencies: 187
-- Data for Name: decisionmatrix; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2435 (class 0 OID 22993)
-- Dependencies: 188
-- Data for Name: decisionmatrix_decision_row; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2436 (class 0 OID 23000)
-- Dependencies: 189
-- Data for Name: expression; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO expression VALUES ('AndExpression', 21, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 2437 (class 0 OID 23008)
-- Dependencies: 190
-- Data for Name: expression_expression; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2438 (class 0 OID 23013)
-- Dependencies: 191
-- Data for Name: expression_linktype; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2439 (class 0 OID 23020)
-- Dependencies: 192
-- Data for Name: fileartifact; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 231
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 471, true);


--
-- TOC entry 2440 (class 0 OID 23025)
-- Dependencies: 193
-- Data for Name: id; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO id VALUES (1, 11);
INSERT INTO id VALUES (0, 165);


--
-- TOC entry 2441 (class 0 OID 23030)
-- Dependencies: 194
-- Data for Name: latestversion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO latestversion VALUES (0, 0);
INSERT INTO latestversion VALUES (1, 0);
INSERT INTO latestversion VALUES (2, 0);
INSERT INTO latestversion VALUES (4, 0);
INSERT INTO latestversion VALUES (5, 0);
INSERT INTO latestversion VALUES (6, 0);
INSERT INTO latestversion VALUES (7, 0);
INSERT INTO latestversion VALUES (8, 0);
INSERT INTO latestversion VALUES (9, 0);
INSERT INTO latestversion VALUES (10, 0);
INSERT INTO latestversion VALUES (13, 0);
INSERT INTO latestversion VALUES (14, 0);
INSERT INTO latestversion VALUES (15, 0);
INSERT INTO latestversion VALUES (16, 0);
INSERT INTO latestversion VALUES (17, 0);
INSERT INTO latestversion VALUES (18, 0);
INSERT INTO latestversion VALUES (19, 0);
INSERT INTO latestversion VALUES (20, 0);
INSERT INTO latestversion VALUES (21, 0);
INSERT INTO latestversion VALUES (22, 0);
INSERT INTO latestversion VALUES (23, 0);
INSERT INTO latestversion VALUES (24, 0);
INSERT INTO latestversion VALUES (25, 0);
INSERT INTO latestversion VALUES (26, 0);
INSERT INTO latestversion VALUES (27, 0);
INSERT INTO latestversion VALUES (28, 0);
INSERT INTO latestversion VALUES (29, 0);
INSERT INTO latestversion VALUES (30, 0);
INSERT INTO latestversion VALUES (31, 0);
INSERT INTO latestversion VALUES (32, 0);
INSERT INTO latestversion VALUES (33, 0);
INSERT INTO latestversion VALUES (34, 0);
INSERT INTO latestversion VALUES (35, 0);
INSERT INTO latestversion VALUES (36, 0);
INSERT INTO latestversion VALUES (37, 0);
INSERT INTO latestversion VALUES (38, 0);
INSERT INTO latestversion VALUES (39, 0);
INSERT INTO latestversion VALUES (40, 0);
INSERT INTO latestversion VALUES (41, 0);
INSERT INTO latestversion VALUES (42, 0);
INSERT INTO latestversion VALUES (43, 0);
INSERT INTO latestversion VALUES (44, 0);
INSERT INTO latestversion VALUES (45, 0);
INSERT INTO latestversion VALUES (46, 0);
INSERT INTO latestversion VALUES (47, 0);
INSERT INTO latestversion VALUES (48, 0);
INSERT INTO latestversion VALUES (49, 0);
INSERT INTO latestversion VALUES (50, 0);
INSERT INTO latestversion VALUES (51, 0);
INSERT INTO latestversion VALUES (52, 0);
INSERT INTO latestversion VALUES (53, 0);
INSERT INTO latestversion VALUES (54, 0);
INSERT INTO latestversion VALUES (55, 0);
INSERT INTO latestversion VALUES (56, 0);
INSERT INTO latestversion VALUES (57, 0);
INSERT INTO latestversion VALUES (58, 0);
INSERT INTO latestversion VALUES (59, 0);
INSERT INTO latestversion VALUES (60, 0);
INSERT INTO latestversion VALUES (61, 0);
INSERT INTO latestversion VALUES (62, 0);
INSERT INTO latestversion VALUES (63, 0);
INSERT INTO latestversion VALUES (64, 0);
INSERT INTO latestversion VALUES (65, 0);
INSERT INTO latestversion VALUES (66, 0);
INSERT INTO latestversion VALUES (67, 0);
INSERT INTO latestversion VALUES (68, 0);
INSERT INTO latestversion VALUES (69, 0);
INSERT INTO latestversion VALUES (70, 0);
INSERT INTO latestversion VALUES (71, 0);
INSERT INTO latestversion VALUES (72, 0);
INSERT INTO latestversion VALUES (73, 0);
INSERT INTO latestversion VALUES (74, 0);
INSERT INTO latestversion VALUES (75, 0);
INSERT INTO latestversion VALUES (76, 0);
INSERT INTO latestversion VALUES (77, 0);
INSERT INTO latestversion VALUES (78, 0);
INSERT INTO latestversion VALUES (79, 0);
INSERT INTO latestversion VALUES (80, 0);
INSERT INTO latestversion VALUES (81, 0);
INSERT INTO latestversion VALUES (82, 0);
INSERT INTO latestversion VALUES (83, 0);
INSERT INTO latestversion VALUES (84, 0);
INSERT INTO latestversion VALUES (85, 0);
INSERT INTO latestversion VALUES (86, 0);
INSERT INTO latestversion VALUES (87, 0);
INSERT INTO latestversion VALUES (88, 0);
INSERT INTO latestversion VALUES (89, 0);
INSERT INTO latestversion VALUES (90, 0);
INSERT INTO latestversion VALUES (91, 0);
INSERT INTO latestversion VALUES (92, 0);
INSERT INTO latestversion VALUES (93, 0);
INSERT INTO latestversion VALUES (94, 0);
INSERT INTO latestversion VALUES (95, 0);
INSERT INTO latestversion VALUES (96, 0);
INSERT INTO latestversion VALUES (97, 0);
INSERT INTO latestversion VALUES (98, 0);
INSERT INTO latestversion VALUES (99, 0);
INSERT INTO latestversion VALUES (100, 0);
INSERT INTO latestversion VALUES (101, 0);
INSERT INTO latestversion VALUES (102, 0);
INSERT INTO latestversion VALUES (103, 0);
INSERT INTO latestversion VALUES (104, 0);
INSERT INTO latestversion VALUES (105, 0);
INSERT INTO latestversion VALUES (106, 0);
INSERT INTO latestversion VALUES (107, 0);
INSERT INTO latestversion VALUES (108, 0);
INSERT INTO latestversion VALUES (109, 0);
INSERT INTO latestversion VALUES (110, 0);
INSERT INTO latestversion VALUES (111, 0);
INSERT INTO latestversion VALUES (112, 0);
INSERT INTO latestversion VALUES (113, 0);
INSERT INTO latestversion VALUES (114, 0);
INSERT INTO latestversion VALUES (115, 0);
INSERT INTO latestversion VALUES (116, 0);
INSERT INTO latestversion VALUES (117, 0);
INSERT INTO latestversion VALUES (118, 0);
INSERT INTO latestversion VALUES (119, 0);
INSERT INTO latestversion VALUES (120, 0);
INSERT INTO latestversion VALUES (121, 0);
INSERT INTO latestversion VALUES (122, 0);
INSERT INTO latestversion VALUES (123, 0);
INSERT INTO latestversion VALUES (124, 0);
INSERT INTO latestversion VALUES (125, 0);
INSERT INTO latestversion VALUES (126, 0);
INSERT INTO latestversion VALUES (127, 0);
INSERT INTO latestversion VALUES (128, 0);
INSERT INTO latestversion VALUES (129, 0);
INSERT INTO latestversion VALUES (130, 0);
INSERT INTO latestversion VALUES (131, 0);
INSERT INTO latestversion VALUES (132, 0);
INSERT INTO latestversion VALUES (133, 0);
INSERT INTO latestversion VALUES (134, 0);
INSERT INTO latestversion VALUES (135, 0);
INSERT INTO latestversion VALUES (136, 0);
INSERT INTO latestversion VALUES (137, 0);
INSERT INTO latestversion VALUES (138, 0);
INSERT INTO latestversion VALUES (139, 0);
INSERT INTO latestversion VALUES (140, 0);
INSERT INTO latestversion VALUES (141, 0);
INSERT INTO latestversion VALUES (142, 0);
INSERT INTO latestversion VALUES (143, 0);
INSERT INTO latestversion VALUES (144, 0);
INSERT INTO latestversion VALUES (145, 0);
INSERT INTO latestversion VALUES (146, 0);
INSERT INTO latestversion VALUES (147, 0);
INSERT INTO latestversion VALUES (148, 0);
INSERT INTO latestversion VALUES (149, 0);
INSERT INTO latestversion VALUES (3, 1);
INSERT INTO latestversion VALUES (11, 1);
INSERT INTO latestversion VALUES (12, 1);
INSERT INTO latestversion VALUES (154, 0);
INSERT INTO latestversion VALUES (155, 0);
INSERT INTO latestversion VALUES (156, 0);
INSERT INTO latestversion VALUES (157, 0);
INSERT INTO latestversion VALUES (158, 0);


--
-- TOC entry 2442 (class 0 OID 23035)
-- Dependencies: 195
-- Data for Name: licensekey; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2443 (class 0 OID 23043)
-- Dependencies: 196
-- Data for Name: lightweightnode; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO lightweightnode VALUES ('Node', 2, 0, 1, 2, 0, 1, 'Deleted Artifacts', 0, 1, 2, 0);
INSERT INTO lightweightnode VALUES ('Node', 465, 0, 155, 156, 154, 1, 'Requisitos Funcionais', 0, 302, 303, 4);
INSERT INTO lightweightnode VALUES ('Node', 463, 0, 154, 155, 0, 5, 'CrowDe', 0, 301, 310, 7);
INSERT INTO lightweightnode VALUES ('Node', 469, 0, 157, 158, 154, 3, 'Requisitos Nao Funcionais', 0, 308, 309, 4);
INSERT INTO lightweightnode VALUES ('Node', 467, 0, 156, 157, 154, 2, 'Template', 0, 304, 307, 4);
INSERT INTO lightweightnode VALUES ('Node', 471, 0, 158, 159, 156, 1, 'Requisito Funcional', 0, 305, 306, 158);
INSERT INTO lightweightnode VALUES ('Node', 1, 0, 0, 1, -1, -1, 'axiom', 0, 0, 311, 0);
INSERT INTO lightweightnode VALUES ('Node', 52, 0, 25, 26, 24, 1, 'High Availability', 0, 48, 49, 57);
INSERT INTO lightweightnode VALUES ('Node', 36, 0, 17, 18, 14, 3, 'Logout', 0, 31, 32, 57);
INSERT INTO lightweightnode VALUES ('Node', 74, 0, 36, 37, 12, 5, 'Markup', 0, 71, 76, 57);
INSERT INTO lightweightnode VALUES ('Node', 78, 0, 38, 39, 36, 2, 'CSS', 0, 74, 75, 57);
INSERT INTO lightweightnode VALUES ('Node', 110, 0, 54, 55, 11, 3, 'Templates', 0, 108, 123, 4);
INSERT INTO lightweightnode VALUES ('Node', 146, 0, 72, 73, 67, 5, 'at least', 0, 142, 143, 60);
INSERT INTO lightweightnode VALUES ('Node', 148, 0, 73, 74, 67, 6, 'not more than', 0, 144, 145, 60);
INSERT INTO lightweightnode VALUES ('Node', 150, 0, 74, 75, 67, 7, 'not to exceed', 0, 146, 147, 60);
INSERT INTO lightweightnode VALUES ('Node', 9, 0, 4, 5, 3, 1, 'Folder', 0, 8, 9, 4);
INSERT INTO lightweightnode VALUES ('Node', 30, 0, 14, 15, 13, 1, 'Security Audit', 0, 26, 35, 57);
INSERT INTO lightweightnode VALUES ('Node', 38, 0, 18, 19, 14, 4, 'Audit Report', 0, 33, 34, 57);
INSERT INTO lightweightnode VALUES ('Node', 11, 0, 5, 6, 3, 2, 'Diagram', 0, 10, 11, 5);
INSERT INTO lightweightnode VALUES ('Node', 54, 0, 26, 27, 24, 2, 'Outage Notification', 0, 50, 51, 57);
INSERT INTO lightweightnode VALUES ('Node', 13, 0, 6, 7, 3, 3, 'Tree View', 0, 12, 13, 6);
INSERT INTO lightweightnode VALUES ('Node', 88, 0, 43, 44, 39, 4, 'Text Resizing', 0, 84, 85, 57);
INSERT INTO lightweightnode VALUES ('Node', 15, 0, 7, 8, 3, 4, 'Project', 0, 14, 15, 7);
INSERT INTO lightweightnode VALUES ('Node', 68, 0, 33, 34, 31, 2, 'Firefox 3.5', 0, 64, 65, 57);
INSERT INTO lightweightnode VALUES ('Node', 40, 0, 19, 20, 13, 2, 'Encryption', 0, 36, 37, 57);
INSERT INTO lightweightnode VALUES ('Node', 17, 0, 8, 9, 3, 5, 'Text Document', 0, 16, 17, 8);
INSERT INTO lightweightnode VALUES ('Node', 19, 0, 9, 10, 3, 6, 'Report', 0, 18, 19, 9);
INSERT INTO lightweightnode VALUES ('Node', 50, 0, 24, 25, 12, 2, 'Availability', 0, 47, 54, 57);
INSERT INTO lightweightnode VALUES ('Node', 24, 0, 11, 152, 0, 4, 'Agiveo Financial', 0, 23, 300, 7);
INSERT INTO lightweightnode VALUES ('Node', 22, 0, 10, 11, 3, 7, 'Condition', 0, 20, 21, 10);
INSERT INTO lightweightnode VALUES ('Node', 56, 0, 27, 28, 24, 3, 'Failure Notification', 0, 52, 53, 57);
INSERT INTO lightweightnode VALUES ('Node', 42, 0, 20, 21, 13, 3, 'Authentication', 0, 38, 39, 57);
INSERT INTO lightweightnode VALUES ('Node', 116, 0, 57, 58, 54, 3, 'Glossary Term', 0, 113, 114, 57);
INSERT INTO lightweightnode VALUES ('Node', 44, 0, 21, 22, 13, 4, 'Non Repudiation ', 0, 40, 41, 57);
INSERT INTO lightweightnode VALUES ('Node', 70, 0, 34, 35, 31, 3, 'Opera 9.5', 0, 66, 67, 57);
INSERT INTO lightweightnode VALUES ('Node', 98, 0, 48, 49, 47, 1, 'Increase Customer Base', 0, 95, 96, 56);
INSERT INTO lightweightnode VALUES ('Node', 46, 0, 22, 23, 13, 5, 'Privacy and Confidentiality', 0, 42, 43, 57);
INSERT INTO lightweightnode VALUES ('Node', 60, 0, 29, 30, 28, 1, 'Concurrent Users', 0, 56, 57, 57);
INSERT INTO lightweightnode VALUES ('Node', 32, 0, 15, 16, 14, 1, 'Authentication Failure', 0, 27, 28, 57);
INSERT INTO lightweightnode VALUES ('Node', 64, 0, 31, 32, 12, 4, 'Browser Support', 0, 61, 70, 57);
INSERT INTO lightweightnode VALUES ('Node', 72, 0, 35, 36, 31, 4, 'Google Chrome 1.0', 0, 68, 69, 57);
INSERT INTO lightweightnode VALUES ('Node', 58, 0, 28, 29, 12, 3, 'Performance', 0, 55, 60, 57);
INSERT INTO lightweightnode VALUES ('Node', 34, 0, 16, 17, 14, 2, 'Login', 0, 29, 30, 57);
INSERT INTO lightweightnode VALUES ('Node', 62, 0, 30, 31, 28, 2, 'Response Time', 0, 58, 59, 57);
INSERT INTO lightweightnode VALUES ('Node', 90, 0, 44, 45, 39, 5, 'Keyboard', 0, 86, 87, 57);
INSERT INTO lightweightnode VALUES ('Node', 82, 0, 40, 41, 39, 1, 'Text Alternatives', 0, 78, 79, 57);
INSERT INTO lightweightnode VALUES ('Node', 28, 0, 13, 14, 12, 1, 'Security', 0, 25, 46, 57);
INSERT INTO lightweightnode VALUES ('Node', 48, 0, 23, 24, 13, 6, 'Data Integrity', 0, 44, 45, 57);
INSERT INTO lightweightnode VALUES ('Node', 106, 0, 52, 53, 47, 5, 'Reduce Customer Support Cost', 0, 103, 104, 56);
INSERT INTO lightweightnode VALUES ('Node', 124, 0, 61, 62, 54, 7, 'Test Case', 0, 121, 122, 61);
INSERT INTO lightweightnode VALUES ('Node', 92, 0, 45, 46, 39, 6, 'Sufficient Time', 0, 88, 89, 57);
INSERT INTO lightweightnode VALUES ('Node', 7, 0, 3, 151, 0, 3, 'Templates', 0, 7, 22, 4);
INSERT INTO lightweightnode VALUES ('Node', 84, 0, 41, 42, 39, 2, 'Captions', 0, 80, 81, 57);
INSERT INTO lightweightnode VALUES ('Node', 100, 0, 49, 50, 47, 2, 'Increase Profits', 0, 97, 98, 56);
INSERT INTO lightweightnode VALUES ('Node', 112, 0, 55, 56, 54, 1, 'Business Goal', 0, 109, 110, 55);
INSERT INTO lightweightnode VALUES ('Node', 66, 0, 32, 33, 31, 1, 'InternetExplorer 8.0', 0, 62, 63, 57);
INSERT INTO lightweightnode VALUES ('Node', 76, 0, 37, 38, 36, 1, 'XHTML', 0, 72, 73, 57);
INSERT INTO lightweightnode VALUES ('Node', 80, 0, 39, 40, 12, 6, 'Accessibility', 0, 77, 92, 57);
INSERT INTO lightweightnode VALUES ('Node', 86, 0, 42, 43, 39, 3, 'Distinguishable', 0, 82, 83, 57);
INSERT INTO lightweightnode VALUES ('Node', 120, 0, 59, 60, 54, 5, 'Ambiguous Term', 0, 117, 118, 59);
INSERT INTO lightweightnode VALUES ('Node', 102, 0, 50, 51, 47, 3, 'Increase Traffic', 0, 99, 100, 56);
INSERT INTO lightweightnode VALUES ('Node', 94, 0, 46, 47, 39, 7, 'Seizures', 0, 90, 91, 57);
INSERT INTO lightweightnode VALUES ('Node', 96, 0, 47, 48, 11, 2, 'Business Goals', 0, 94, 107, 4);
INSERT INTO lightweightnode VALUES ('Node', 108, 0, 53, 54, 47, 6, 'Turn Visitors Into Customer', 0, 105, 106, 56);
INSERT INTO lightweightnode VALUES ('Node', 132, 0, 65, 66, 62, 3, 'Person', 0, 129, 130, 58);
INSERT INTO lightweightnode VALUES ('Node', 104, 0, 51, 52, 47, 4, 'Obtain Customer Information', 0, 101, 102, 56);
INSERT INTO lightweightnode VALUES ('Node', 118, 0, 58, 59, 54, 4, 'Use Case', 0, 115, 116, 58);
INSERT INTO lightweightnode VALUES ('Node', 130, 0, 64, 65, 62, 2, 'The System', 0, 127, 128, 58);
INSERT INTO lightweightnode VALUES ('Node', 114, 0, 56, 57, 54, 2, 'Non-Functional Requirement', 0, 111, 112, 56);
INSERT INTO lightweightnode VALUES ('Node', 26, 0, 12, 153, 11, 1, 'Non-Functional Requirements', 0, 24, 93, 4);
INSERT INTO lightweightnode VALUES ('Node', 122, 0, 60, 61, 54, 6, 'Actor Specification', 0, 119, 120, 60);
INSERT INTO lightweightnode VALUES ('Node', 128, 0, 63, 64, 62, 1, 'Audit Record', 0, 125, 126, 58);
INSERT INTO lightweightnode VALUES ('Node', 134, 0, 66, 67, 62, 4, 'Account', 0, 131, 132, 58);
INSERT INTO lightweightnode VALUES ('Node', 126, 0, 62, 63, 11, 4, 'Project Glossary', 0, 124, 215, 4);
INSERT INTO lightweightnode VALUES ('Node', 138, 0, 68, 69, 67, 1, 'user', 0, 134, 135, 60);
INSERT INTO lightweightnode VALUES ('Node', 140, 0, 69, 70, 67, 2, 'users', 0, 136, 137, 60);
INSERT INTO lightweightnode VALUES ('Node', 142, 0, 70, 71, 67, 3, 'acceptable', 0, 138, 139, 60);
INSERT INTO lightweightnode VALUES ('Node', 136, 0, 67, 68, 62, 5, 'Invalid Terms', 0, 133, 198, 4);
INSERT INTO lightweightnode VALUES ('Node', 144, 0, 71, 72, 67, 4, 'adequate', 0, 140, 141, 60);
INSERT INTO lightweightnode VALUES ('Node', 152, 0, 75, 76, 67, 8, 'between', 0, 148, 149, 60);
INSERT INTO lightweightnode VALUES ('Node', 154, 0, 76, 77, 67, 9, 'depends on', 0, 150, 151, 60);
INSERT INTO lightweightnode VALUES ('Node', 156, 0, 77, 78, 67, 10, 'efficient', 0, 152, 153, 60);
INSERT INTO lightweightnode VALUES ('Node', 158, 0, 78, 79, 67, 11, 'flexible', 0, 154, 155, 60);
INSERT INTO lightweightnode VALUES ('Node', 160, 0, 79, 80, 67, 12, 'improved', 0, 156, 157, 60);
INSERT INTO lightweightnode VALUES ('Node', 162, 0, 80, 81, 67, 13, 'better', 0, 158, 159, 60);
INSERT INTO lightweightnode VALUES ('Node', 164, 0, 81, 82, 67, 14, 'faster', 0, 160, 161, 60);
INSERT INTO lightweightnode VALUES ('Node', 166, 0, 82, 83, 67, 15, 'superior', 0, 162, 163, 60);
INSERT INTO lightweightnode VALUES ('Node', 168, 0, 83, 84, 67, 16, 'including', 0, 164, 165, 60);
INSERT INTO lightweightnode VALUES ('Node', 170, 0, 84, 85, 67, 17, 'maximize', 0, 166, 167, 60);
INSERT INTO lightweightnode VALUES ('Node', 172, 0, 85, 86, 67, 18, 'minimize', 0, 168, 169, 60);
INSERT INTO lightweightnode VALUES ('Node', 296, 0, 147, 148, 139, 8, 'InternetExplorer 8.0', 0, 292, 293, 62);
INSERT INTO lightweightnode VALUES ('Node', 300, 0, 149, 150, 139, 10, 'Accessibility', 0, 296, 297, 62);
INSERT INTO lightweightnode VALUES ('Node', 174, 0, 86, 87, 67, 19, 'optimize', 0, 170, 171, 60);
INSERT INTO lightweightnode VALUES ('Node', 176, 0, 87, 88, 67, 20, 'normally', 0, 172, 173, 60);
INSERT INTO lightweightnode VALUES ('Node', 178, 0, 88, 89, 67, 21, 'ideally', 0, 174, 175, 60);
INSERT INTO lightweightnode VALUES ('Node', 180, 0, 89, 90, 67, 22, 'optionally', 0, 176, 177, 60);
INSERT INTO lightweightnode VALUES ('Node', 182, 0, 90, 91, 67, 23, 'resonable', 0, 178, 179, 60);
INSERT INTO lightweightnode VALUES ('Node', 184, 0, 91, 92, 67, 24, 'robust', 0, 180, 181, 60);
INSERT INTO lightweightnode VALUES ('Node', 186, 0, 92, 93, 67, 25, 'seamless', 0, 182, 183, 60);
INSERT INTO lightweightnode VALUES ('Node', 188, 0, 93, 94, 67, 26, 'several', 0, 184, 185, 60);
INSERT INTO lightweightnode VALUES ('Node', 190, 0, 94, 95, 67, 27, 'sufficient', 0, 186, 187, 60);
INSERT INTO lightweightnode VALUES ('Node', 192, 0, 95, 96, 67, 28, 'support', 0, 188, 189, 60);
INSERT INTO lightweightnode VALUES ('Node', 194, 0, 96, 97, 67, 29, 'user-friendly', 0, 190, 191, 60);
INSERT INTO lightweightnode VALUES ('Node', 196, 0, 97, 98, 67, 30, 'simple', 0, 192, 193, 60);
INSERT INTO lightweightnode VALUES ('Node', 198, 0, 98, 99, 67, 31, 'easy', 0, 194, 195, 60);
INSERT INTO lightweightnode VALUES ('Node', 200, 0, 99, 100, 67, 32, 'quickly', 0, 196, 197, 60);
INSERT INTO lightweightnode VALUES ('Node', 202, 0, 100, 101, 62, 6, 'Firefox', 0, 199, 200, 58);
INSERT INTO lightweightnode VALUES ('Node', 204, 0, 101, 102, 62, 7, 'Chrome', 0, 201, 202, 58);
INSERT INTO lightweightnode VALUES ('Node', 206, 0, 102, 103, 62, 8, 'InternetExplorer', 0, 203, 204, 58);
INSERT INTO lightweightnode VALUES ('Node', 208, 0, 103, 104, 62, 9, 'XHTML', 0, 205, 206, 58);
INSERT INTO lightweightnode VALUES ('Node', 210, 0, 104, 105, 62, 10, 'CSS', 0, 207, 208, 58);
INSERT INTO lightweightnode VALUES ('Node', 212, 0, 105, 106, 62, 11, 'CSV', 0, 209, 210, 58);
INSERT INTO lightweightnode VALUES ('Node', 214, 0, 106, 107, 62, 12, 'PDF', 0, 211, 212, 58);
INSERT INTO lightweightnode VALUES ('Node', 216, 0, 107, 108, 62, 13, 'Routing Number', 0, 213, 214, 58);
INSERT INTO lightweightnode VALUES ('Node', 276, 0, 137, 138, 123, 14, 'Purchase Stock (Alt 1)', 0, 272, 273, 62);
INSERT INTO lightweightnode VALUES ('Node', 220, 0, 109, 110, 108, 1, 'Create Account', 0, 217, 218, 59);
INSERT INTO lightweightnode VALUES ('Node', 240, 0, 119, 120, 108, 5, 'Add Funds', 0, 237, 238, 59);
INSERT INTO lightweightnode VALUES ('Node', 254, 0, 126, 127, 123, 3, 'Close Account', 0, 250, 251, 62);
INSERT INTO lightweightnode VALUES ('Node', 242, 0, 120, 121, 108, 6, 'Add Bank Account', 0, 239, 240, 59);
INSERT INTO lightweightnode VALUES ('Node', 224, 0, 111, 112, 110, 1, 'Customer', 0, 220, 221, 61);
INSERT INTO lightweightnode VALUES ('Node', 218, 0, 108, 109, 11, 5, 'Use Cases', 0, 216, 243, 4);
INSERT INTO lightweightnode VALUES ('Node', 226, 0, 112, 113, 110, 2, 'Web Service Client', 0, 222, 223, 61);
INSERT INTO lightweightnode VALUES ('Node', 244, 0, 121, 122, 108, 7, 'Generate Report', 0, 241, 242, 59);
INSERT INTO lightweightnode VALUES ('Node', 228, 0, 113, 114, 110, 3, 'System Administrator', 0, 224, 225, 61);
INSERT INTO lightweightnode VALUES ('Node', 262, 0, 130, 131, 123, 7, 'Add Bank Account (Alt 1)', 0, 258, 259, 62);
INSERT INTO lightweightnode VALUES ('Node', 230, 0, 114, 115, 110, 4, 'Trading System', 0, 226, 227, 61);
INSERT INTO lightweightnode VALUES ('Node', 268, 0, 133, 134, 123, 10, 'Add Funds (Alt 2)', 0, 264, 265, 62);
INSERT INTO lightweightnode VALUES ('Node', 232, 0, 115, 116, 110, 5, 'Credit Verification System', 0, 228, 229, 61);
INSERT INTO lightweightnode VALUES ('Node', 256, 0, 127, 128, 123, 4, 'Create Account', 0, 252, 253, 62);
INSERT INTO lightweightnode VALUES ('Node', 222, 0, 110, 111, 108, 2, 'Actors', 0, 219, 232, 4);
INSERT INTO lightweightnode VALUES ('Node', 234, 0, 116, 117, 110, 6, 'Bank', 0, 230, 231, 61);
INSERT INTO lightweightnode VALUES ('Node', 236, 0, 117, 118, 108, 3, 'Close Account', 0, 233, 234, 59);
INSERT INTO lightweightnode VALUES ('Node', 238, 0, 118, 119, 108, 4, 'Purchase Stock', 0, 235, 236, 59);
INSERT INTO lightweightnode VALUES ('Node', 246, 0, 122, 123, 11, 6, 'Test Cases', 0, 244, 299, 4);
INSERT INTO lightweightnode VALUES ('Node', 250, 0, 124, 125, 123, 1, 'Add Funds', 0, 246, 247, 62);
INSERT INTO lightweightnode VALUES ('Node', 264, 0, 131, 132, 123, 8, 'Add Bank Account (Alt 2)', 0, 260, 261, 62);
INSERT INTO lightweightnode VALUES ('Node', 272, 0, 135, 136, 123, 12, 'Create Account (Alt 1)', 0, 268, 269, 62);
INSERT INTO lightweightnode VALUES ('Node', 252, 0, 125, 126, 123, 2, 'Add Bank Account', 0, 248, 249, 62);
INSERT INTO lightweightnode VALUES ('Node', 258, 0, 128, 129, 123, 5, 'Generate Report', 0, 254, 255, 62);
INSERT INTO lightweightnode VALUES ('Node', 260, 0, 129, 130, 123, 6, 'Purchase Stock', 0, 256, 257, 62);
INSERT INTO lightweightnode VALUES ('Node', 270, 0, 134, 135, 123, 11, 'Close Account (Alt 1)', 0, 266, 267, 62);
INSERT INTO lightweightnode VALUES ('Node', 248, 0, 123, 124, 122, 1, 'Use Case Tests', 0, 245, 276, 4);
INSERT INTO lightweightnode VALUES ('Node', 266, 0, 132, 133, 123, 9, 'Add Funds (Alt 1)', 0, 262, 263, 62);
INSERT INTO lightweightnode VALUES ('Node', 278, 0, 138, 139, 123, 15, 'Purchase Stock (Alt 2)', 0, 274, 275, 62);
INSERT INTO lightweightnode VALUES ('Node', 274, 0, 136, 137, 123, 13, 'Create Account (Alt 2)', 0, 270, 271, 62);
INSERT INTO lightweightnode VALUES ('Node', 282, 0, 140, 141, 139, 1, 'Security Audit', 0, 278, 279, 62);
INSERT INTO lightweightnode VALUES ('Node', 284, 0, 141, 142, 139, 2, 'Authentication', 0, 280, 281, 62);
INSERT INTO lightweightnode VALUES ('Node', 286, 0, 142, 143, 139, 3, 'Data Integrity', 0, 282, 283, 62);
INSERT INTO lightweightnode VALUES ('Node', 288, 0, 143, 144, 139, 4, 'Encryption', 0, 284, 285, 62);
INSERT INTO lightweightnode VALUES ('Node', 290, 0, 144, 145, 139, 5, 'Firefox 3.5', 0, 286, 287, 62);
INSERT INTO lightweightnode VALUES ('Node', 292, 0, 145, 146, 139, 6, 'Google Chrome 1.0', 0, 288, 289, 62);
INSERT INTO lightweightnode VALUES ('Node', 294, 0, 146, 147, 139, 7, 'Opera 9.5', 0, 290, 291, 62);
INSERT INTO lightweightnode VALUES ('Node', 280, 0, 139, 140, 122, 2, 'Non-Functional Requirement Tests', 0, 277, 298, 4);
INSERT INTO lightweightnode VALUES ('Node', 298, 0, 148, 149, 139, 9, 'Failure and Outage Notifications', 0, 294, 295, 62);
INSERT INTO lightweightnode VALUES ('Node', 3, 0, 2, 3, 0, 2, 'User Artifacts', 0, 3, 6, 0);
INSERT INTO lightweightnode VALUES ('Node', 456, 0, 150, 154, 2, 1, 'admin', 0, 4, 5, 0);


--
-- TOC entry 2444 (class 0 OID 23048)
-- Dependencies: 197
-- Data for Name: link; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2445 (class 0 OID 23056)
-- Dependencies: 198
-- Data for Name: linktype; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2447 (class 0 OID 23066)
-- Dependencies: 200
-- Data for Name: managedobject; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO managedobject VALUES (1, 'axiom', 0, 'html', NULL, '', NULL, 9223372036854775807, false, false, 0, 0, -1, NULL, NULL, 1442457887028, 23497, NULL, NULL);
INSERT INTO managedobject VALUES (2, 'Deleted Artifacts', 0, NULL, NULL, '', '3473f3b6-4c6f-41ef-b0af-836ec2da1236', 9223372036854775807, false, false, 1, 0, -1, NULL, NULL, 1442457887212, 23499, NULL, NULL);
INSERT INTO managedobject VALUES (3, 'User Artifacts', 0, NULL, NULL, '', 'b59ba879-a5c2-41ce-908e-2b49c81c5466', 9223372036854775807, false, false, 2, 0, -1, NULL, NULL, 1442457887453, 23501, NULL, NULL);
INSERT INTO managedobject VALUES (12, 'Agiveo Financial', 0, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', '66bd2793-dc8c-490f-bc3e-d6c085a67784', 1442457910098, false, false, 11, 0, -1, NULL, NULL, 1442457889990, 23801, NULL, 23);
INSERT INTO managedobject VALUES (5, 'Folder', 0, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', 'e246a1ce-5b71-4e08-a96f-da09d29ddada', 9223372036854775807, false, true, 4, 0, -1, NULL, NULL, 1442457888841, 23505, NULL, 8);
INSERT INTO managedobject VALUES (6, 'Diagram', 0, 'diagram', NULL, '', '2b43904c-2815-4cb4-b5e7-0735d4bb60f2', 9223372036854775807, false, true, 5, 0, -1, NULL, NULL, 1442457889171, 23507, NULL, 10);
INSERT INTO managedobject VALUES (7, 'Tree View', 0, 'treeView', NULL, '', '5c9f34d5-2e44-41aa-9e4e-0ec9e98946da', 9223372036854775807, false, true, 6, 0, -1, NULL, NULL, 1442457889289, 23509, NULL, 12);
INSERT INTO managedobject VALUES (8, 'Project', 0, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', 'd851be76-9b2b-457c-ad90-c1174e32417f', 9223372036854775807, false, true, 7, 0, -1, NULL, NULL, 1442457889411, 23511, NULL, 14);
INSERT INTO managedobject VALUES (9, 'Text Document', 0, 'html', NULL, '', 'bbdb7b80-6fd8-4269-bf93-d3d82733106e', 9223372036854775807, false, true, 8, 0, -1, NULL, NULL, 1442457889522, 23513, NULL, 16);
INSERT INTO managedobject VALUES (10, 'Report', 0, 'report', NULL, '', '8a253081-be26-4880-b8df-fa045dcbb60a', 9223372036854775807, false, true, 9, 0, -1, NULL, NULL, 1442457889660, 23515, NULL, 18);
INSERT INTO managedobject VALUES (11, 'Condition', 0, 'condition', NULL, '', 'cc952008-df40-4409-b84e-640ef1fcb287', 9223372036854775807, false, true, 10, 0, -1, NULL, NULL, 1442457889832, 23517, NULL, 20);
INSERT INTO managedobject VALUES (13, 'Non-Functional Requirements', 0, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', '963df7a6-82c5-41a4-a708-289c6ea74d50', 1442457910221, false, false, 12, 0, -1, NULL, NULL, 1442457890112, 23803, NULL, 25);
INSERT INTO managedobject VALUES (14, 'Security', 0, 'html', NULL, '', 'b1fde2b3-da98-4bc2-95fb-81ba127dbbce', 9223372036854775807, false, false, 13, 0, -1, NULL, NULL, 1442457890256, 23523, NULL, 27);
INSERT INTO managedobject VALUES (15, 'Security Audit', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>The system shall recognize and record information related to
security related activities. &nbsp;<br>


<br><img src="data:image/jpg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCADQAgcDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD3+iue8aale6X4cefTp0guWmiiWV0DhdzgE4PXg1xzX/jiO1S5k8RW6xPja39npg5/GrjCUtjOdWMNz1KivH5fEni6Lj/hI4G+lgn+NQN4t8XL/wAzBB/4AJWn1ep2I+s0u57PRXiUnjXxbEpZ/ENsFHUmxQVr/D3xvreveLZNOvr+O7thbPICtssXzAr0xz3NTKhOK5mtCo1oSdkz1aiiisjUKKKKACiiigAooooAKKy9U1u306aO1BV7uUZSPPCj+83oP51OiKYVe5lMpbnrhfwArT2cklJ7MnmV7F2iuV1S2t3kAgiVJM4UplT+YrCn1nxF4Tm8yZzqeng5kik/1sY/2X7/AENdMME6i9x69noZOuk9Uej0VR0fWLLXdNiv7CXzIJPwKnupHYir1ccouLcZKzRunfVBRRRSAKKKKACiiigArE/4S3RckG8A+qmts8jFfLevjUbLxFqFnBdRrHHcukKyN820MQM/lUymo7lwg57H0WPFWiH/AJf4h9aD4r0Uf8vyH6A18wfbNWfCxXVqzck5Y9BUn2zVVjDG6thjG45OM1PtoF+wqdj6msNYsdTZ1tJvMKDLcEVeryv4Liee11W6uZhK29EjZTxt5z+Oa9Uq001dGUouLswooopiCiiigAooooAKKKKACiua17WbrTb9Ei3Osm1FRWVfmOe5B9Kz7nxVdWUhjureVJAAShmTPP8AwCrjCUtkZyqwh8TO1orz8/EAL1tbn/v8n/xFQyfEyGFC72s4UdS06D/2Sr9hU7C9vT7no1Fcp4R8Vr4pha8hWWKBZXh2yspyVAORgDjmuq3L6j86yaadmaJpq6FooopDCiiigAooooAKKKKACiio5po7eF5ZWCooySaAJKazogy7Ko9zisz7c053OWjTtGpw34n+gp63FuOkSfUjJoAvrNE5wsiMfZgafWcbmA9Yoz9VFMNwqcwuYz/dPKn8O34UAalFVbO9S7DLjbKn30znHuPUVaoAKKKKACiiigDkviQ23wi7ZAxcwnJ/3xXCXK3kOi2t5cXZktbggJHvbAwOMA8Dv0rtfimdvgS6PpLGf/HhXmOraXc2Xw80bVJ9XuZUuGHk2LjCRKQxyOfYfnXdhbWV+5wYuDle3b9RlzeQKP4h9DWPcantJCMx/Ssxp2YdTUYb1r0rI86EGt2Jd3kkp/eSOfQEcCu0+DDb/HMpzn/Q5P5pXA3TjacV3HwQOfG8/wD16P8AzWufFv8AdNHfhl7yZ9DUUVnazrVroVmtzdiQozhAIxk5IJ/pXkJOTsj0G0ldmjRXI/8ACx9E/uXf/fsf40f8LH0T+5d/9+x/jWv1er/KZ+2p9zpb7ULTTYBPeXCQxlgoZz1J7VLDPFcQrNBIkkbDKuhyCPrXn3iHxZoOuWH2Z0uuG3KTGBg+o5rlNN1680K6LadcsYScmOQfK31H9RWsMJKUezM5YhRfdHuFVtRv4NL0+e+uW2wwruY1heHvGljrbLbyKbe8P/LM8q3+6f6GqnxOkdfBUyJ0kmjR/puz/QVNHDuVeNKWl2jV1FyOcTl/D1w+uanc3d2sjX1yDPiNt21c4RMdgBiulTWbmILDcZjki42sMEVn+BrWyiVbxYgJ1QgyA8kY6fpXN3fiR9Uu2l2uFDEKpbJ5PrXuyoe2rShGPuxt8vQ811eSCk3qzubCZb+7AEsiOh3h8fKMf/WzV7VLOyureQLJG8j/AHjuGWrH8Fo1xdTksPLSMB1z94k9/bg100+jaaGecWkKzHB37eQR0I9K8zESjSrct3odFJOdLmPOPB88vh/xx/Z6sRZ35ZGQnhXAJUj34x+NetV5Dq3nQeL9IKoC/wBujG9T94bhzivXq0zZJyhV6yWvyLwcm4uPZhRXOap410rSdQksrhbgyx4yUQEcjPr71U/4WPon9y7/AO/Y/wAa81UKjV0jd1YJ2bOuqk2raeuo/wBnteQi7wP3RbB56fj7Vzv/AAsfRP7l3/37H+NcX4k1HSNXvXvLYzxztjJZBhsdM81pTw0m7TTRE68UrxaZ7HRXk2g+PL/TNsF7m8thx8x/eKPY9/ofzFel6Vq9nrNoLmyl3pnDAjBU+hFRVoTpb7FU60am25erw3WbGC41zUbt9GmmliuWCupcB/nbngV7lXiWs3NvP4mvJhqdxF9kn2yRLGSMhz0+b2rzMa7RWv5fqevlqTnK66ef6HPTafDYrHND4cuGeTejAtKcDA9vc1M2mW0ljGX0OdfNQOy7pBggkY6VJHLDp7i4l1m7kSRXQARt1x/ve9LcvHNYDZq1wvm7ZFYxtkAZH96vNc3ZfnoexyK+3/pX9aHovwwghtLbU7WC1e3jjlXAckls555rvq88+FEi/YNTthcvcPBMqtI6kc/NwMk16HXs0P4aPncX/GkFFQ3VzHZ2k1zLny4kLtjrgDNcv/wsfRP7l3/37H+NdMKc5/CrnJKcY/EzrqbLKkMTyyuqRopZmY4AA6k1yf8AwsfRP7l3/wB+x/jVe98faHd2ctu0d0VkUqwMYwQfxq1h6n8rJ9tT7nWWOpWWpxGWyuY50BwSh6fUdqtV4V9sXTr4XOj3U8TA8ZGCB6e49jXdaD8RIZylvq6CGQ8CdB8p+o7fy+la1MJJLmhqvxM4YmLdpbnd0UisGUMpBB5BFLXIdJwXxFkW2toZ3kMS/aoUMg/hzuGa4PWL6ystSntYrxb6OLaFm37t3APXPbOK7P4tSRx+H4XlQvGmo2zSKoyWQbtwH1Ga8l8Qanbatrs97p2n/YLNwqx26oBtAGM4XgZ616WCjeN/X9DzcbBSe/b9SW61UMcRrj8axb26lfmQsfT5uBTgkhOfLf8A75NVbtZSp/dOfoprvtY5YRSdj1z4ROsnhv5gGH2uc/MAeyV2+lSrPLrSyJGwivWjTKD5V8pTgfiTXnvwmcp4aAOQftU5x07LXYaLKfP135jzqDf+ikrwq38SXqezT+FHb23/AB6xf7g/lUtRW3/HrD/uD+VS1mWFFZGt+I7HQPJ+2CU+dnb5ag9MZzz71kf8LH0T+5d/9+x/jWkaNSSukRKrCLs2ddVS+1Sx00xfbbqKDzThN7YzXOf8LH0T+5d/9+x/jXPeJvEeh6/DGuLpXjzsYxgEZ69/YVpDDz5veTsRKtG3utXPTlZXUMrBlIyCDkEUteK6N4o1DQZdltN51rnmGUfKfp/dP0/WvTdA8VWGvrsiLRXKjLQv1+oPQiirhp09d0KnXjPTZm7XN+KrtoXs4ukbPuPuQCR/KukrkvGhUJH5mRGQo3qMmNsna358Y7g1zm5SS9J71KLsnvWHA+HWOUhJD0Gflf3U9/5jvWgkR75piL32s+tMa8x3qAwnFVLlkgwJGwW+6o5ZvoOpoA1NOvW/t2zCNgvuRvdeD/P+ddpXnGgyBtci3DMrFeAciJNw4z6k4z9Metej0hhRRRQAUUUUAcj8SrWW88E3UUCo0nmRna0gTIDDPJ4rwlNI1GQrG1u7Kowu6/iKqPbJ4Feu/FFbXULNdP1aHVU0/crpJYwlw7js2AcAfSvL4vDfgzAUSa+B6NaP/wDG61p1p01aLM50oz+JFf8AsC972yfhfw0f2HdY4s0/8D4a0U8LeDmPzS65j2tZQf8A0VTz4T8G4ysutg+9tKf/AGjWn1ut3I+rU+xh3Hh2625NmP8AgN/Ca7T4RaLcad4veeREjRraRcG5jdt2V4wv0NYTeGPBsfWTWz9LSX/41Wx4K0rw9p3i60vdGj12S/jyqrJbMqMCMHcSoGME8k9cVE69SatJlRpRi7pHvFZ2r6TDq1uIZ0VlB3AMM81o0VinbVGtrnJf8INY/wDPKP8A75FJ/wAINY/88o/++RXXUVftJ9yeSPY848RaHYaBp32lrVJSzhFUKAATnk+3Fc3YaBe6vMH8kQxn0XHHsP8AGvYryzjvI9kgyKLayhtVAjQCtYYmUI2W/czlQjJ3exh+HfDMWkDzFGHI5bufxq/4m0f+3fDt3pwYK8qjYx7MCCP5VrUVnGrOM1UT1Wppyrl5eh4NYa3NDa/YRepZSI5S5EkZJwOCuMdzwa6TSvA51K0M9ncWluqttVkkM2/B65zxwenXirXxB8EedJLr2mBRNjNzD0D/AO0Pf19aw/CfiG70SPyCge3d92wnBU9yDX1jq+3w/tsI7S6r+vwv0PFqqNGpy1VobZ0HXfCiy6lFfQ4UhCFyfMBPGQRWl4b8Qahetc2185lJXzEkIA29iMD61o6nd/2lpZhRgRIR2zkdawJrJtJVbsuIQD1bvnsB3rzlNV6bVZLnfWxEpOnUSot8vYS1006h8QbKXJaO2Blfj7pAOP1xXpNZmi2EVraiZV/fTgM7Ec+wrTry8ZiPbSSW0VY9bC0nTh7271Od1LwpaajePcyRIXbqSvJqp/wg1j/zyj/75FdbRXNzyXU35Y9jkT4Gsu0Uf/fIrjPEFtDZam+mWVirSqBufYDnIzwP617DVCTSbeW5851y1aU6zi7vX5kTpKSstDzbRfBc90yyXQwv90f1Nel6bYJp9qsEYAVRgADAFW0jSNcKoAp1TUqzqO8mVCnGCtEK8a1YTr4iuvs1rp7WzTnzmYR7id5zuyc17LXh+rxWFv4ivonjune5uCzsJFAB3noMV5uOdoI9XLVecvT+uxTVr5pALyy0wQhX2llh+9j6/SiR7gWzA2tgAAPLAEeMc5xzWa8mlX7LbtBeKEDuCJV9P932qG4m06G0A8q52xAIMyDJzk+lebvbX8f+Ae0o63cfw/4J6p8LSDbamWjhSYyJ5gi29fm64716BXmfwd8iSy1e4gEgE06Mwcg4Pze1emV7dD+Gj5vF/wAaRDd263VrJA4BV1KkHuDXMHwPYknEMf8A3yK62itlJrZnM4p7o5L/AIQax/55R/8AfIqte+ELCys5rloUZYkLlVQEnAzgV21MmiE0ZRuhqlUl3FyR7HiKWk+sz4tLNIYs8ED+veu38PeDFtJEuJvmlHIZh0+npXWWul21qcqgzV4DHStamIlJcq0RnChGLu9WIq7VA9KWiiuc2M+6sGmujKRbuhUDbMhbBGeevvWbezadY5+0Npse37xMJIX646fjVrXrgwwADYQQOHUMuSygHB9s1zEmqTNGYHa1eEHOwxIVz6gYp3aFZM8/X4xXD6yto3hnSxbG48ozic8Luxux9Oa9ZtorG/wbaXT23cqViOGHtnr+FYQlBPFpYkf9esf+FTLqdxFGLf8A0dY1OfKESBQfpjFHMwsi1e6YbG9SRniIZGOI1K9wPWs7Ty0V3qvykiW+ZgRjAHlqOfypdV1lbeG3MltdSI0eENpatIu7dzwowPu596yYtYt7WW6kNpqzC4uDKMafIcDaB2HHSj1A9Ut/+PWL/cH8qlqK2/49YuCPkHUY7VLSGZGs6Fb6x5fnorFM7dwzjNZP/CDWP/PKP/vkV1tFUpyWiZLjF7o5E+BrH/nlH/3yK57xPpdloEUISzSWWckL8vyjGOv59K9PqpeafDelfMGcVcKrUrvX5kyppqy0PJNL8L3upyh5E8pCc4C4P5dq9K0DQItHhxGApPXHf61rQWsVugWNAMVNTq151N9hU6UYbBXKeMNyrvEYlURfvYj/ABR5+b8sg+1dXWRr2lS6hbrLaybLuEloz2PqD9axNTy97e587fpVwt0m0F7aTBZl7ZXo2P7w/StGDU7WOHEsF9ayjqkbMV/D7wqveabazagqFpNMvlOVBH7st3x/d+nT3rZVddit9klpDd4+7KrA5/MH+dMRUGr2bK259RbjhQSM/ko/nWNeLd3WZNqafYZ+dpDgyexPJP0yc+ldEja2M40mMN2JwAPyWsDUrIC8juNYvWlnz+7trc5Ofr2+p/KgDb8MFF1FEgy0Syp5szjBd88L7ADJx7V6XXHeGdFldorueH7PbRcwQDue7H/E12NIYUUUUAFFFFABRRWP4o1abRdAmu7VI3umeOCASAlPMkdUUtgg4BYE89BQBsUVymo2Gr6T4d1a5l8SXl8V06Y4mhhjKSBMh42iVCvfg7u2CMHMdhr32S6jbUNTlFrDoMV7NG8IKrgndIZM7yxAxtxjjOcmi6vb+uv+QW/r7v8AM6+iubi8ZW/lzNeaVqVgUs3vYluVjzcRIAWKbHbBGV+Vtp+YcdcQN42WS2laDRtSWZ7J7yyWZIlF0i7clf3mVxvUkPtODwDSbt/Xr/k/uGlfb+v6udXRWN4V1e613w3Y6jeWElnNPCjsjlMPlQdy7XbCnPAJB9RWzVNWdmSndXQUUUUhhRRRQAUUUUAIyq6lWAKkYIPeuYufA2nPcm4tZJLZ2OSqHKn8DXUUVpTrTp/A7ETpxmrSVzFh0KSKERi8Ix/EqAGpYdAtElWWbfcSKchpTuwa1aKHVm+pMaNOOyADAwKKKKzNQooooAKKKKACiiigArlr3wPY3l3LcfbNQiMjlykdwQoJOTgdq3tUunsdIvbuIKZIIHlUN0JVSRn24rmE1fxFb+E49cvNS0TE8NvIifYJo1j8xkyGIlctwxAwo5wTxmlZS0f9X/4YpScdnv8A1+oH4daYx5u9R/8AAk1DJ8MdJcf8feo/+BJNdH/wkelnW30ZJpZL+MgSRR28jiLK7gXYKVUEdCSAeR1BqG18XaJeXf2aC6lZiHMchtZRFNs+8I5CuyQjB4Qk8H0NTyx3K9pPuL4c8NWfhuCaK1eZ/OYMzTSFjx0H6mtqsy38Q6VdSaakF2HbUoTPaYRv3iAAk9OOD0OD19DVKfxtoNvaC6a6nkgIkYvBZzShFRirO+xDsTKthmwDgkEgVdraENuWp0FFcfrOvXsGq6qlndr9ni0Br6DaqsPM3Phwcc8AcdK6TSZ5LnRrG4mbdLLbxu7YxklQSeKFqr/1u1+gno7f1sn+pcooooAKKKKACiiqGuXF7aaDf3OmpE97DA8kKSqWVmAJAIBB5xjg0m0ldjSu7InurGC8AEwfj+5Iyf8AoJGaz28NWBP37sfS6k/xrDvfHRTVPDCWcMUthqkazXUrHDQpJtWEjn+J2x36GrkfjCGHU9TjvsrbxXYtLNLe3lmmnZY1aUhEDMQpbGQuBjk81Vv1/DQm9/67l3/hF7H/AJ7Xv/gU/wDjSjwvYg/669P/AG9P/jWTqfjG2t9W8OzwXrNpd+lxvSO3aSSVlC7VCBTJuB3ZUDIwcjiuk07VbPV7AXlhKZoiWXlCjKynBVlYAqwIwQQCKVxj7OwgsFYQeZ8wAJklZzx/vE46mrNch4T8TXmuW0upXl/pCWsaObmzjVkn09gfuTMzkEgBs5VOmRxWnaeL9EvIriSO4mRYLc3TefaTQ7oR1dA6jzF91z1HqKHpuBuUVi2nizRr57RYLmUi8kMVs720qJOwUv8AIzKFYbQSCDg44JouPFmjWxdWuZZJFuGtvKgtpZpGkVQzBURSzBQRkqCB0JBo2A2qKw5vGGhQWtlcNeO63wY2yRW8skkpXG5QiqW3DPK4yMHI4ONtGDorDOGGRkEH8j0oAWiiigAooooAKKKKAKl7pllqKhbu3SXHQkcj6GqX/CPxImyG4lRPQ4bFcxb+KPE0fhYeKbg6Xc6dG0j3FnDbSRSpCrspZZDIwZgF3Y2DPIyK6a+8V6Np12tvc3MqklFaVbaV4oy5AUPIqlEJyOGI6g9xQtQGjw91DXsuD1wozU1n4c0yzm89bcST/wDPWX5m/D0qhb+MrOXxPqeiy29zALGNJGuZLeVYiCGLFmKBVUBeGLYbt0pt34tsrvRdZOmTzxX9nYvcqlzaSQOBtba4WVBuXKnkAjik5WVxpXdjpqK5rQfGOlalZWySXxFybMXDyTQPFHIqqN7o7KEdQTyUJAzVq18W6LdrdkXMsH2SD7RMLu1ltysXPzgSKpK/KeRkcVTVnYlO6ubdFYg8V6T/AGab92vIYPMWJRPYTxySu3RY42QO5P8Asg9/Sr2l6tZ6xatcWUjsqOY3WSJ4njYdVZHAZT0OCBwQehFIZdooooAKztc0a31/R59NuWkRJcESREB42UhlZScjIIBH0rRooA5w6Jrt7p93Z6rr1rPHPaSWy/ZtP8nLOuN75kfcR2C7Byc54xHJ4NguTKl1dM8E2jjSpERNpKgnLg5ODz0x+ddPRSt/X3/5sL/193+SOJ03wAthaXttt8PxfaLKS0FxY6ILaf5hjcziQhvUgBcn0rVl8LLNc6TI92dthYzWRUR4MgkVF3Zz8uNnTB6+1dDRTeu/9b/5sFpa39f1YyfDel3mi6Da6ZeXsN4bWNYY5Yrcw5RVAG4F2y3HJGB7Ctaiim227sSVtEFFFFIYUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAFTVLV77SL20iKiSeB4lLdAWUgZ9ua5VvANpb+DF0zTNP0uz1J4bdJ7iGERiUxsjMSyruOdpPI6mu1ooWn9dv8Ahwetv6/rYxdP0ee213Xb2V4zDqDQmMITuULHtOeMdfrXN+G/BN3ot1psF1bR3Vvp7Hybttcu2IwrKrC1ZTEpwcEBsDJx6V31FC0DpY8/PgrWba2vDY3NitzbTq2jlywEUe+RmD/LxlZWTgHhV/BdW8E6tLa2+m2F3u06PThZojajcWvkyYIaUrEP3+7j5XYDg/3jXf0UraW/raw763OPm8KX0n2jEtt+80AaYMs3+t+bnp93nr19q6bTbZ7PSrO1kKl4YEjYr0JCgHH5Vaoqr7+f+bf6sm239dEv0QUUUUhhRRRQAUUUUAee2HgC/t9E1+xmurVpJwItKddxEEUbtJCHyOCrvzjIwBiiTwJqK2WjXAljn1K1FwbyOPULizSV52EkjLNEC4AccAggjrggV6FRQBxCeGNWsX0S70uz0+Gaxa6ee1n1GeZZWmIyROyF8nliSp54wc5G34c0i80rTrw3csJv726lu5fLy0Ubv0Vc4LAAAZOCeTxnAu6lrOn6R5f2+5WHzM7MgnOOvQe4q8CGAIOQabTWvcV09Oxwmp+DtU8TXpn1WHS9Ok+wz2b3VhI8styJE2gMGRNqKcsFy/OORySyz8G6h9ku4rqzgW5bTprSG7bXby7wzqAf3cq4RTgE4JIwBzXf0VLV1b+uv+ZSdmn2/r9DnNU0C6uvCllZW0kK6lYCCW2kdiI/Oix1IBO04KnjOGPFYdx4DvEtNEmt5FmvrKOYXSLqE9kJ3mIeRxNEC4+cZwQQQe2BXf0VTd22JKySOS0zwvPZ32h3K29vaJZG7a4hF7LdFnmIO4SSKGckgk7sde9dbRRSAKKKKACiiigAooooA4Kz8MeI38L/APCLXi6ZBp0hkSe8gupJZXid2YqsZjUKxDbd24464NJ4h8H65q+o3YjukazkaE2xbUbiJbdU2kxm3QeXJkgnexz83Q7QK76ihaf1/X9fMDlbzRNcXxBrN3ps9pDFqVjHCtwzsJbaVBIFYJsKuMuvVlxg8Gsmw8F6ug1SS5eJJLvSnsVWTVLm9O85+cvKAQDn7qjjHfPHoFFJpP8Ar1/zHf8Ar7v8jhv+Ea8TXYsRcXen2Mul2UsFncWrtIZJnjEYkZWQBAAM7QX5PXjlukeEdUtLq9u763tbkT6d9k+yXOrXN4srbs5aSZDtVs4IVOPfPHd0U3q7v+t/8yUrKy/rb/I87fwPrFxpccckyRG0vkubOxXVrl1RBGY2T7VgSrncSMAhcAYIJrp/C+jyaTa3Rnsktri4m8yQrqc98ZMKqhjJMqtnAAx0wBW7RTv/AF/XoMKKKKQBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAHnPxNJ83Tx2/ef+y131kSbOInrtFcB8Tf9dYf8D/9lrvrD/jyh/3BXRU/gw+ZhD+LP5Fmiiiuc3CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACuc8bWk174elihLbgQ+B/Fjsf89cV0dRzRLNEyMMgiqjJxkpLoKUVJWZ4lqWsSanpdhBOxaa13oWPVl4x+PGPwrdsr668Q+LrSSJ3W2sypQA4wB/8AFH9PpWb4r0Z9M1ZiiHypjlcDv3Fd14L0Iadp6yyL++k+Zv8ACvRq1IRpKUd3e3z3OGnCbqOMun6bHVj7ozS0UV5h3hRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRTXkSPG91XPTJxTftEP/PaP/voUAU9Q0m31B42lQMUYMMjoRV6OMRxhFGAKb9oh/57R/8AfQo+0Q/89o/++hQBJRUf2iEnAmjz/vCpKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAM7UpPJlt5QATGJGAPshqz9oiz/AKxP0qnrP3E/3Jf/AEA1Z3uDgtGPrQA572ziIElxChPIDOBmnLc20iBkmiZT0KsCK838d6m1p4jSEsPnslcenDsK6PwBO9x4YWUEczydfrXPCtKVRwtojmhXlKq4W0RtXzI9rIFZWwV4H+8K0qpajv8AsMm7b1Xp/vCrtdB0hRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAGXrXCJ/uS/8AoBryjxprEcPifVreQIXiMZBcDIUxjj8816trf+rT/cl/9ANeD/EOGST4kauMEo0MX5hR/jXdgE3OVt7fqjCvblV+4nju+lS+8LlGz52jEnPf5ya9E+HetW2m+AbJ70uWlmmI2Lno3P8AMV574ztjI3hJ9udulhe/q1W72d7DwJ4d25G68uUIHocV49Wqo1Zpbpv8zXLY08RilRfn+Vz2KHXLDW9OuWsWZhC6K+4YwSQa368n+F3mHQNbMn3jdRH+VesV0Qd43OjEU1TqOKQUUUVRiFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBk66QIUJ6bJf/AEA15P4z09Z/F93dAph0UZDDB+UV7HfW80zQvD5e6MniTOCCMdqrfZb7/nlZH6lv8K6MNiPYTcrX0sZ1aftFY8m8TaeZbfQSAD5VkqnBHHJ96TVNM87wZo0Z2gxXMz/eHfGO9et/Z7//AJ5WX/fTf4UvkX+MeTY4/wB5v8K8ueE5q06vN8XQMvg8Hjfrad/L5W3OH8A24t9G1YDb888RGCDnpXpVZj2t9KnlsloiEjcULZwCD6e1addNOHJFROvFV/b1pVbWuFFFFWYBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAV7m+tLN4EurqCB7iQRQrLIFMjnoq56n2FWK818WNea9rupw6fpF7qB0u2WK2mt2hCQXpKzbmEkiHKhYeVB4ZhWzpHittS1qCV7hIdOm0NL8xybVCPvIcknn5RwecClfS/9bN/p+QPT+vT/AD/M7HoKoabremavFDJYXsU3nQi4RM7XMZJAfYcMASCMkdq4Pw/r+s+IbWx+0eIP7P8AK0WPUJJlhhxcOzOCz7lwI1CDITafn+8OKzvCpluPD9taxziDd4VR/tEMMfm58x+AzKx2+xyOSRzzRJ8t/wCtub/IpK+np+Nv8z1yore5gvIFntp454WztkicMpwcHBHuCKwPAMEkHgXRfMvprsSWcLq0oQbFMa4Vdir8o7ZyfUmsnw9qM+kfCOTUraETT2sF3NHGejMskhAPtxVTXI2uxEHz28zuqK861XXNZ8NQQXEevDWPtWmXN15dxDEFRo4t6yJ5SqfLLELhic7lwc9dDwfPrV5q0s91qes3OnLaR/LqWnx2h+0EkuAPKRyAAuD05PLdi2tv66/5BfS/9dP8ztaKKKQwooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAihtoLbzPIgji81zJJsQLvc9WOOp4HNUZfDmhzrbrNo2nSC2kaWAPaofKdjuZlyPlJPJI6nmtOigDNm8PaJcR2kc2j6fIlkc2qvbIRB0+4CPl6DpjoKswadY2rq9vZ28LLH5SmOJVITOdowOmSTjpVmigCpp+l6fpNu1vptha2ULMXMdtCsalj1OFAGeBzVW08MaBp999ustD0y2vOf9IhtI0k56/MBnnvWrRQBgXHhDSF0fUbHSbO20eS+hMb3FhAsL98ElQCcZPfuelUfDfgpdB1h9R3aXCxtzAINJ037FE4LA7pBvfewwApyMAt1zXW0ULR3B67hRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAH/2Q=="><br>

</body></html>', '137829f8-23ba-49e7-8e07-ff3d53f5545e', 9223372036854775807, false, false, 14, 0, -1, NULL, NULL, 1442457890682, 23526, NULL, 29);
INSERT INTO managedobject VALUES (16, 'Authentication Failure', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>An audit record will be recorded when the user fails to authenticate through the login screen.
</body></html>', '1f571a60-cedd-4ee1-b6f7-1d4ed56572c5', 9223372036854775807, false, false, 15, 0, -1, NULL, NULL, 1442457890916, 23529, NULL, 31);
INSERT INTO managedobject VALUES (17, 'Login', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>An audit record will be recorded when the user logs in.

</body></html>', 'e98cca5c-04c3-4ee4-8be3-0a250650f83a', 9223372036854775807, false, false, 16, 0, -1, NULL, NULL, 1442457891020, 23531, NULL, 33);
INSERT INTO managedobject VALUES (18, 'Logout', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>An audit record will be recorded when a user logs out of the system.
</body></html>', '3eeae810-8f6c-4151-b982-dd32a0d89ed6', 9223372036854775807, false, false, 17, 0, -1, NULL, NULL, 1442457891130, 23533, NULL, 35);
INSERT INTO managedobject VALUES (19, 'Audit Report', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>The system will provide an audit report that can be filtered by date and&nbsp;
</body></html>', '51750fb8-39b1-4105-94e0-4f511a0b3ce2', 9223372036854775807, false, false, 18, 0, -1, NULL, NULL, 1442457891244, 23535, NULL, 37);
INSERT INTO managedobject VALUES (46, 'Sufficient Time', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>The web site will give users enough time to read and react to content.
</body></html>', '895b31e5-54ee-4bff-baa1-ded37a01f00d', 9223372036854775807, false, false, 45, 0, -1, NULL, NULL, 1442457895242, 23589, NULL, 91);
INSERT INTO managedobject VALUES (47, 'Seizures', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>The site will not contain any content that flashes and may cause a seizure.
</body></html>', 'e839f53a-6103-4d30-be2b-10c79c254e89', 9223372036854775807, false, false, 46, 0, -1, NULL, NULL, 1442457895353, 23591, NULL, 93);
INSERT INTO managedobject VALUES (48, 'Business Goals', 0, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', '2fb19d5a-9f41-4537-b2c8-0df17c4a05e0', 9223372036854775807, false, false, 47, 0, -1, NULL, NULL, 1442457895463, 23593, NULL, 95);
INSERT INTO managedobject VALUES (49, 'Increase Customer Base', 0, 'html', NULL, ' By redesigning &nbsp;the Agiveo Financial website, we hope to increase the&nbsp;investor base of Agiveo Financial. ', '14930e5d-3175-4dd9-aa37-1dfe6f5c003c', 9223372036854775807, false, false, 48, 0, -1, NULL, NULL, 1442457895563, 23595, NULL, 97);
INSERT INTO managedobject VALUES (50, 'Increase Profits', 0, 'html', NULL, ' By redesigning the Agiveo Financial web site, we will reduce the cost of servicing our existing customers and obtaining new customers. ', 'fb0055a1-9bda-4d53-8864-0abc3cfba893', 9223372036854775807, false, false, 49, 0, -1, NULL, NULL, 1442457895663, 23597, NULL, 99);
INSERT INTO managedobject VALUES (51, 'Increase Traffic', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>Increase web site traffic (and potential customers) by having an more inviting user interface.
</body></html>', '92839162-80ad-4bb5-8639-a06798105810', 9223372036854775807, false, false, 50, 0, -1, NULL, NULL, 1442457896009, 23599, NULL, 101);
INSERT INTO managedobject VALUES (52, 'Obtain Customer Information', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>The current web site does not obtain the proper level of user
information such as geographic location and user preferences.
&nbsp;This makes it impossible to engage with the customer on a
personal level.
</body></html>', '5bf11dc8-2cb6-415f-92aa-aa7725334b0d', 9223372036854775807, false, false, 51, 0, -1, NULL, NULL, 1442457896121, 23601, NULL, 103);
INSERT INTO managedobject VALUES (53, 'Reduce Customer Support Cost', 0, 'html', NULL, ' Currently, all customer support problems must be handled by a customer support representative; however, with a better web site we can help our customers &nbsp;on line &nbsp;thus &nbsp;reducing the need for &quot;live&quot; customer support. ', 'c64211d1-b6c9-495c-918f-87571b1e3823', 9223372036854775807, false, false, 52, 0, -1, NULL, NULL, 1442457896229, 23603, NULL, 105);
INSERT INTO managedobject VALUES (54, 'Turn Visitors Into Customer', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>Turn casual visitors into customers by providing a helpful, easy to use, website.
</body></html>', '697ce87a-ad53-4b86-a43f-85e9d022ef77', 9223372036854775807, false, false, 53, 0, -1, NULL, NULL, 1442457896330, 23605, NULL, 107);
INSERT INTO managedobject VALUES (55, 'Templates', 0, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', '6ff50c8d-a8f7-4ec6-8c98-326809ee578d', 9223372036854775807, false, false, 54, 0, -1, NULL, NULL, 1442457896429, 23607, NULL, 109);
INSERT INTO managedobject VALUES (56, 'Business Goal', 0, 'html', NULL, '', '50a35e56-3033-4dee-b155-38b93e5e34d5', 9223372036854775807, false, true, 55, 0, -1, NULL, NULL, 1442457896541, 23609, NULL, 111);
INSERT INTO managedobject VALUES (57, 'Non-Functional Requirement', 0, 'html', NULL, '', 'ac329dd5-9c79-4bfd-bd9e-b93a35dc5f73', 9223372036854775807, false, true, 56, 0, -1, NULL, NULL, 1442457896738, 23611, NULL, 113);
INSERT INTO managedobject VALUES (58, 'Glossary Term', 0, 'html', NULL, '', '740a8ce8-051d-4f8d-89ec-e067a8b6b423', 9223372036854775807, false, true, 57, 0, -1, NULL, NULL, 1442457896832, 23613, NULL, 115);
INSERT INTO managedobject VALUES (4, 'Templates', 0, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', '7fd9615b-aeba-479d-bd88-3367fdf1f062', 1442457909982, false, false, 3, 0, -1, NULL, NULL, 1442457888691, 23799, NULL, 6);
INSERT INTO managedobject VALUES (20, 'Encryption', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>All user&nbsp;information will be sent over a secure connection using HTTP over SSL.<br><br>Encryption
has long been used by militaries and governments to facilitate secret
communication. Encryption is now commonly used in protecting
information within many kinds of civilian systems. For example, in 2007
the U.S. government reported that 71% of companies surveyed utilized
encryption for some of their data in transit.[1] Encryption can be used
to protect data "at rest", such as files on computers and storage
devices (e.g. USB flash drives). In recent years there have been
numerous reports of confidential data such as customers'' personal
records being exposed through loss or theft of laptops or backup
drives. Encrypting such files at rest helps protect them should
physical security measures fail. Digital rights management systems
which prevent unauthorized use or reproduction of copyrighted material
and protect software against reverse engineering (see also copy
protection) are another somewhat different example of using encryption
on data at rest.

</body></html>', '1d1e6d35-bad0-4a0d-b6e6-8d09fa7eb5e2', 9223372036854775807, false, false, 19, 0, -1, NULL, NULL, 1442457891352, 23537, NULL, 39);
INSERT INTO managedobject VALUES (21, 'Authentication', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>Access to account information is is granted only to those whose have authenticated with the system.

</body></html>', '6b6ce91f-2214-48cb-8e9e-846f31f5ab4e', 9223372036854775807, false, false, 20, 0, -1, NULL, NULL, 1442457891495, 23539, NULL, 41);
INSERT INTO managedobject VALUES (22, 'Non Repudiation ', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>All events can be traced back to the authenticated user.<br><p>According to traditional legal practice, a signature
on a paper contract or memorandum may always be repudiated by the
signatory. Such repudiation may take one of two forms: The signatory
may claim fraud or forgery, such
as "I did not sign that." Alternately, he/she may accept the signature
as authentic but dispute its validity due to coercion as in the scenario of blackmail.</p>
<p>The legal burden of proof differs depending upon the repudiation
reason. In the former scenario the burden of proof typically rests on
the party claiming validity, while in the latter it shifts to the
signatory claiming lack thereof.</p>



</body></html>', '17a50373-f929-4187-9f60-c22cfd85ed5f', 9223372036854775807, false, false, 21, 0, -1, NULL, NULL, 1442457891633, 23541, NULL, 43);
INSERT INTO managedobject VALUES (23, 'Privacy and Confidentiality', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body> Personal information submitted to &nbsp;the Agiveo website is
not &nbsp;to be disclosed or visible beyond those who are authorized to
receive it.
<br><br>The ability to control what information one reveals about
oneself over the Internet, and who can access that information, has
become a growing concern. These concerns include whether email can be
stored or read by third parties without consent, or whether third
parties can track the web sites someone has visited. Another concern is
whether web sites which are visited collect, store, and possibly share
personally identifiable information about users.<br><br>The advent of
various search engines and the use of data mining created a capability
for data about individuals to be collected and combined from a wide
variety of sources very easily.The FTC has provided a set of guidelines
that represent widely-accepted concepts concerning fair information
practices in an electronic marketplace called the Fair Information
Practice Principles.<br>

</body></html>', '6779cf95-a1ba-43f6-9b36-43563ba471cb', 9223372036854775807, false, false, 22, 0, -1, NULL, NULL, 1442457892035, 23543, NULL, 45);
INSERT INTO managedobject VALUES (89, 'ideally', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>You should also describe how the system will behave under conditions that are not ideal.
</body></html>', '888fd9c4-3e49-4d4f-8adf-1eb3499f86ab', 9223372036854775807, false, false, 88, 0, -1, NULL, NULL, 1442457901500, 23675, NULL, 177);
INSERT INTO managedobject VALUES (90, 'optionally', 0, 'html', NULL, '', 'a1894c2a-c689-4673-b36a-66637b147b0e', 9223372036854775807, false, false, 89, 0, -1, NULL, NULL, 1442457901610, 23677, NULL, 179);
INSERT INTO managedobject VALUES (91, 'resonable', 0, 'html', NULL, '', '9aa7b5b6-260f-46ce-b329-0b6b7506b4ed', 9223372036854775807, false, false, 90, 0, -1, NULL, NULL, 1442457901710, 23679, NULL, 181);
INSERT INTO managedobject VALUES (92, 'robust', 0, 'html', NULL, '', 'b4b929bb-26d5-4835-8573-9ba003693d0a', 9223372036854775807, false, false, 91, 0, -1, NULL, NULL, 1442457901834, 23681, NULL, 183);
INSERT INTO managedobject VALUES (93, 'seamless', 0, 'html', NULL, '', '5a2d04ea-0c2f-4f6e-9fab-1c68df3fbe42', 9223372036854775807, false, false, 92, 0, -1, NULL, NULL, 1442457901943, 23683, NULL, 185);
INSERT INTO managedobject VALUES (94, 'several', 0, 'html', NULL, '', 'ef0befbe-63df-4e04-b8c4-602aca8f2e4a', 9223372036854775807, false, false, 93, 0, -1, NULL, NULL, 1442457902055, 23685, NULL, 187);
INSERT INTO managedobject VALUES (95, 'sufficient', 0, 'html', NULL, '', '5e967938-3df1-4fa7-8a23-322b86e79556', 9223372036854775807, false, false, 94, 0, -1, NULL, NULL, 1442457902165, 23687, NULL, 189);
INSERT INTO managedobject VALUES (96, 'support', 0, 'html', NULL, '', '3b4ab2de-8805-4462-9e39-bf19ae97df13', 9223372036854775807, false, false, 95, 0, -1, NULL, NULL, 1442457902265, 23689, NULL, 191);
INSERT INTO managedobject VALUES (97, 'user-friendly', 0, 'html', NULL, '', 'f26b2871-c390-4291-ba36-1801b76b3784', 9223372036854775807, false, false, 96, 0, -1, NULL, NULL, 1442457902376, 23691, NULL, 193);
INSERT INTO managedobject VALUES (98, 'simple', 0, 'html', NULL, '', '16e64b20-7151-43b3-a1a5-a06def3adee9', 9223372036854775807, false, false, 97, 0, -1, NULL, NULL, 1442457902480, 23693, NULL, 195);
INSERT INTO managedobject VALUES (99, 'easy', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>Define what constitutes usable software.
</body></html>', 'c6c62ac9-4094-42e0-af94-c9b6ceaaaff8', 9223372036854775807, false, false, 98, 0, -1, NULL, NULL, 1442457902809, 23695, NULL, 197);
INSERT INTO managedobject VALUES (100, 'quickly', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>Define, in measurable terms, how much fast the system will respond.
</body></html>', '0826e335-8b9c-4e64-b474-c17698301e80', 9223372036854775807, false, false, 99, 0, -1, NULL, NULL, 1442457902942, 23697, NULL, 199);
INSERT INTO managedobject VALUES (101, 'Firefox', 0, 'html', NULL, '', '5ae83c25-9a71-4b52-97a9-1ba3785e598e', 9223372036854775807, false, false, 100, 0, -1, NULL, NULL, 1442457903053, 23699, NULL, 201);
INSERT INTO managedobject VALUES (102, 'Chrome', 0, 'html', NULL, '', 'a8ac237a-cf61-4542-a661-d52fe4eac3d2', 9223372036854775807, false, false, 101, 0, -1, NULL, NULL, 1442457903163, 23701, NULL, 203);
INSERT INTO managedobject VALUES (103, 'InternetExplorer', 0, 'html', NULL, '', 'a2ab676a-8969-4a9c-a670-443de64fd8f7', 9223372036854775807, false, false, 102, 0, -1, NULL, NULL, 1442457903281, 23703, NULL, 205);
INSERT INTO managedobject VALUES (104, 'XHTML', 0, 'html', NULL, '', '727ed1e9-77c4-4954-bd6a-364d9cc7071f', 9223372036854775807, false, false, 103, 0, -1, NULL, NULL, 1442457903396, 23705, NULL, 207);
INSERT INTO managedobject VALUES (105, 'CSS', 0, 'html', NULL, '', 'd10e3c50-a0bd-4fc6-9a9a-a055280ff44e', 9223372036854775807, false, false, 104, 0, -1, NULL, NULL, 1442457903501, 23707, NULL, 209);
INSERT INTO managedobject VALUES (106, 'CSV', 0, 'html', NULL, '', '43345132-6c60-4ae0-b876-1c7f77f30716', 9223372036854775807, false, false, 105, 0, -1, NULL, NULL, 1442457903607, 23709, NULL, 211);
INSERT INTO managedobject VALUES (107, 'PDF', 0, 'html', NULL, '', '1e15f11c-d1c1-480a-b917-6949e6254889', 9223372036854775807, false, false, 106, 0, -1, NULL, NULL, 1442457903719, 23711, NULL, 213);
INSERT INTO managedobject VALUES (108, 'Routing Number', 0, 'html', NULL, '', '85b47837-c21d-49a3-bdef-18a29e119d1f', 9223372036854775807, false, false, 107, 0, -1, NULL, NULL, 1442457903841, 23713, NULL, 215);
INSERT INTO managedobject VALUES (109, 'Use Cases', 0, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', '3786c8b6-4147-40c9-90fa-ef02f550ecd1', 9223372036854775807, false, false, 108, 0, -1, NULL, NULL, 1442457904208, 23715, NULL, 217);
INSERT INTO managedobject VALUES (24, 'Data Integrity', 0, 'html', NULL, '  Information entered by users is not&nbsp;altered or otherwise subverted by the Agiveo Website.<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<br /><br />Modification in context!<br /><br />Data integrity is normally enforced in a database system by a series of integrity constraints or rules. Three types of integrity constraints are an inherent part of the relational data model: entity integrity, referential integrity and domain integrity.<br /><br />Entity integrity concerns the concept of a primary key. Entity integrity is an integrity rule which states that every table must have a primary key and that the column or columns chosen to be the primary key should be unique and not null.<br /><br />Referential integrity concerns the concept of a foreign key. The referential integrity rule states that any foreign key value can only be in one of two states. The usual state of affairs is that the foreign key value refers to a primary key value of some table in the database. Occasionally, and this will depend on the rules of the business, a foreign key value can be null. In this case we are explicitly saying that either there is no relationship between the objects represented in the database or that this relationship is unknown.<br /><br />Domain integrity specifies that all columns in relational database must be declared upon a defined domain. The primary unit of data in the relational data model is the data item. Such data items are said to be non-decomposable or atomic. A domain is a set of values of the same type. Domains are therefore pools of values from which actual values appearing in the columns of a table are drawn.  ', '67cdb8fd-44bf-42ea-bd1a-9d7a6d377ec5', 9223372036854775807, false, false, 23, 0, -1, NULL, NULL, 1442457892147, 23545, NULL, 47);
INSERT INTO managedobject VALUES (25, 'Availability', 0, 'html', NULL, '', 'be61cd92-517a-41b0-9d45-28536c52659e', 9223372036854775807, false, false, 24, 0, -1, NULL, NULL, 1442457892269, 23547, NULL, 49);
INSERT INTO managedobject VALUES (26, 'High Availability', 0, 'html', NULL, ' The Agiveo Website shall be available 7 days a week for at least 20 hours a day. ', 'c9aec28a-97fa-4e97-a9dd-eb0a86a2e324', 9223372036854775807, false, false, 25, 0, -1, NULL, NULL, 1442457892427, 23549, NULL, 51);
INSERT INTO managedobject VALUES (27, 'Outage Notification', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>Scheduled outages should be communicated to the end user via email.
</body></html>', '0871df97-ef49-4a32-8618-556d194d771a', 9223372036854775807, false, false, 26, 0, -1, NULL, NULL, 1442457892546, 23551, NULL, 53);
INSERT INTO managedobject VALUES (28, 'Failure Notification', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>In the event of a system failure, the user will be notified by a message on the web site.
</body></html>', 'd0113347-9a07-4326-91e3-30b06c71c220', 9223372036854775807, false, false, 27, 0, -1, NULL, NULL, 1442457892680, 23553, NULL, 55);
INSERT INTO managedobject VALUES (29, 'Performance', 0, 'html', NULL, '', '0f5303c0-4cc8-484e-b7c0-0dd36a376a3c', 9223372036854775807, false, false, 28, 0, -1, NULL, NULL, 1442457892835, 23555, NULL, 57);
INSERT INTO managedobject VALUES (30, 'Concurrent Users', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>The system shall support 1,000 concurrent users.

</body></html>', 'd843b3e6-5ba3-40fe-b372-7baf8a78e41b', 9223372036854775807, false, false, 29, 0, -1, NULL, NULL, 1442457892945, 23557, NULL, 59);
INSERT INTO managedobject VALUES (31, 'Response Time', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>The web site will respond to any user action within 3 seconds.
</body></html>', '8355186f-0ce2-44c4-b70c-667930b032be', 9223372036854775807, false, false, 30, 0, -1, NULL, NULL, 1442457893197, 23559, NULL, 61);
INSERT INTO managedobject VALUES (32, 'Browser Support', 0, 'html', NULL, '', 'c1797bcf-cd8d-4bc8-ac21-514884aecf8e', 9223372036854775807, false, false, 31, 0, -1, NULL, NULL, 1442457893327, 23561, NULL, 63);
INSERT INTO managedobject VALUES (33, 'InternetExplorer 8.0', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>The web site should be accessible with IE 8.0 &nbsp;and above.

</body></html>', 'ab995d61-9992-4bf2-8b35-b6cf45a23938', 9223372036854775807, false, false, 32, 0, -1, NULL, NULL, 1442457893475, 23563, NULL, 65);
INSERT INTO managedobject VALUES (34, 'Firefox 3.5', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>The web site should be accessible with Firefox 3.5 &nbsp;and above.

</body></html>', '9dd4ac6e-4dfd-454d-ba5b-06e7e94de0cb', 9223372036854775807, false, false, 33, 0, -1, NULL, NULL, 1442457893646, 23565, NULL, 67);
INSERT INTO managedobject VALUES (35, 'Opera 9.5', 0, 'html', NULL, ' The web site should be accessible with Opera 9.5 &nbsp;and above. ', '343e23df-5ce0-4efe-b685-5f262bcfe230', 9223372036854775807, false, false, 34, 0, -1, NULL, NULL, 1442457893759, 23567, NULL, 69);
INSERT INTO managedobject VALUES (36, 'Google Chrome 1.0', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>The web site should be accessible with Google Chrome 1.0 &nbsp;and above.

</body></html>', '51220118-ca26-4b8b-9e1e-e168d91b5c03', 9223372036854775807, false, false, 35, 0, -1, NULL, NULL, 1442457893892, 23569, NULL, 71);
INSERT INTO managedobject VALUES (37, 'Markup', 0, 'html', NULL, '', 'd3cdf983-21ff-48e2-be27-be93dfa30626', 9223372036854775807, false, false, 36, 0, -1, NULL, NULL, 1442457894060, 23571, NULL, 73);
INSERT INTO managedobject VALUES (38, 'XHTML', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>All pages will validate against XHTML 1.0 .
</body></html>', '2fe3512e-4a23-4563-9456-0a2245529032', 9223372036854775807, false, false, 37, 0, -1, NULL, NULL, 1442457894200, 23573, NULL, 75);
INSERT INTO managedobject VALUES (39, 'CSS', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>All web page styling will be done using CSS 2.0.<br>
</body></html>', 'df9ac76b-d6d5-4557-9e84-fd5a2dd94988', 9223372036854775807, false, false, 38, 0, -1, NULL, NULL, 1442457894333, 23575, NULL, 77);
INSERT INTO managedobject VALUES (40, 'Accessibility', 0, 'html', NULL, '', 'd87e5af4-da9f-46bf-9837-db8340ea2f24', 9223372036854775807, false, false, 39, 0, -1, NULL, NULL, 1442457894543, 23577, NULL, 79);
INSERT INTO managedobject VALUES (41, 'Text Alternatives', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>Provide text alternatives to images so this text can be translated into other forms such as braille or speech.
</body></html>', '45812eb4-8ff7-48f1-9103-eb7eabbef988', 9223372036854775807, false, false, 40, 0, -1, NULL, NULL, 1442457894655, 23579, NULL, 81);
INSERT INTO managedobject VALUES (42, 'Captions', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>Provide captions for any content with audio.
</body></html>', '3013cb4d-19e1-45c1-a276-25df84ad8b5c', 9223372036854775807, false, false, 41, 0, -1, NULL, NULL, 1442457894766, 23581, NULL, 83);
INSERT INTO managedobject VALUES (43, 'Distinguishable', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>The foreground of content shall be easily distinguishable from the background.</body></html>', 'c48f60d5-e378-46d6-af84-45743bbe846e', 9223372036854775807, false, false, 42, 0, -1, NULL, NULL, 1442457894889, 23583, NULL, 85);
INSERT INTO managedobject VALUES (44, 'Text Resizing', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>The web site shall allow for text to be resized up to 200% of its default size.
</body></html>', 'b8fa93f2-99f4-4306-b594-02db1c5abd81', 9223372036854775807, false, false, 43, 0, -1, NULL, NULL, 1442457895021, 23585, NULL, 87);
INSERT INTO managedobject VALUES (45, 'Keyboard', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>All actions on the web site can be performed by using the keyboard.
</body></html>', 'fc11a557-192f-49d9-a5c6-88ea60f545fe', 9223372036854775807, false, false, 44, 0, -1, NULL, NULL, 1442457895132, 23587, NULL, 89);
INSERT INTO managedobject VALUES (59, 'Use Case', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Goal</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Summary</span></h4><h4 style="color: rgb(0, 64, 128);">Preconditions</h4><h4 style="color: rgb(0, 64, 128);">Basic Flow</h4><h4 style="color: rgb(0, 64, 128);">Alternate Flow</h4><h4 style="color: rgb(0, 64, 128);">Postconditions</h4>
</body></html>', 'b53404e6-276e-4ec1-91ae-c3fadc477108', 9223372036854775807, false, true, 58, 0, -1, NULL, NULL, 1442457896946, 23615, NULL, 117);
INSERT INTO managedobject VALUES (60, 'Ambiguous Term', 0, 'html', NULL, '', 'f4f44e17-c28e-4c7b-9395-4597798c577e', 9223372036854775807, false, true, 59, 0, -1, NULL, NULL, 1442457897093, 23617, NULL, 119);
INSERT INTO managedobject VALUES (61, 'Actor Specification', 0, 'html', NULL, '', '5f50af53-0a99-47dd-856b-81f3336a40e8', 9223372036854775807, false, true, 60, 0, -1, NULL, NULL, 1442457897270, 23619, NULL, 121);
INSERT INTO managedobject VALUES (62, 'Test Case', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', 'ce42af21-8479-4af5-b7aa-94ba12e8d938', 9223372036854775807, false, true, 61, 0, -1, NULL, NULL, 1442457897487, 23621, NULL, 123);
INSERT INTO managedobject VALUES (63, 'Project Glossary', 0, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', '10821f8d-0a30-4c66-9ac0-ecf281226700', 9223372036854775807, false, false, 62, 0, -1, NULL, NULL, 1442457897747, 23623, NULL, 125);
INSERT INTO managedobject VALUES (64, 'Audit Record', 0, 'html', NULL, ' The system will record audit records that can be examined to determine when secured actions occurred and by whom. ', '24073add-9354-4eea-bf25-339ab1340354', 9223372036854775807, false, false, 63, 0, -1, NULL, NULL, 1442457897860, 23625, NULL, 127);
INSERT INTO managedobject VALUES (65, 'The System', 0, 'html', NULL, '', 'e6aebae3-acbb-42f0-978c-0fb3d2bd7c84', 9223372036854775807, false, false, 64, 0, -1, NULL, NULL, 1442457897978, 23627, NULL, 129);
INSERT INTO managedobject VALUES (66, 'Person', 0, 'html', NULL, ' A person with an account on the Agiveo Financial Website.  ', '7a0eb66c-02e0-477d-8c5d-fbb6bd6309fe', 9223372036854775807, false, false, 65, 0, -1, NULL, NULL, 1442457898093, 23629, NULL, 131);
INSERT INTO managedobject VALUES (67, 'Account', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>The user''s investment portfolio.
</body></html>', '9885aa26-c3f7-4fe8-ad6a-554352fa6152', 9223372036854775807, false, false, 66, 0, -1, NULL, NULL, 1442457898216, 23631, NULL, 133);
INSERT INTO managedobject VALUES (68, 'Invalid Terms', 0, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', '98a42c30-359d-4a1c-bc4a-6984d4a7cedb', 9223372036854775807, false, false, 67, 0, -1, NULL, NULL, 1442457898341, 23633, NULL, 135);
INSERT INTO managedobject VALUES (69, 'user', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>Instead of using "user" you should use a more specific actor name such as "customer" or "web service client".


</body></html>', 'e282aff8-93f4-4ef4-a884-4fccc3c709c0', 9223372036854775807, false, false, 68, 0, -1, NULL, NULL, 1442457898551, 23635, NULL, 137);
INSERT INTO managedobject VALUES (70, 'users', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>Instead of using "users" we should use a more specific actor name such as "customers" or "web service clients".
</body></html>', '58cc0d7e-f9d0-43cc-8b0c-4c4df93de3e9', 9223372036854775807, false, false, 69, 0, -1, NULL, NULL, 1442457898690, 23637, NULL, 139);
INSERT INTO managedobject VALUES (71, 'acceptable', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>You should explicitly define what is acceptable so that the requirement can be tested.
</body></html>', 'ad40d8e8-493b-4765-bfaa-69c38a0b1baa', 9223372036854775807, false, false, 70, 0, -1, NULL, NULL, 1442457899070, 23639, NULL, 141);
INSERT INTO managedobject VALUES (72, 'adequate', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>You should explicitly define what is adequate so that the requirement can be tested.
</body></html>', '74262a2d-3df3-4f41-ac85-8c08eb53255f', 9223372036854775807, false, false, 71, 0, -1, NULL, NULL, 1442457899170, 23641, NULL, 143);
INSERT INTO managedobject VALUES (73, 'at least', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>You should define the minimum acceptable limit(s).
</body></html>', 'e0660f10-33d3-4dbd-9854-b36a4db08e5d', 9223372036854775807, false, false, 72, 0, -1, NULL, NULL, 1442457899270, 23643, NULL, 145);
INSERT INTO managedobject VALUES (74, 'not more than', 0, 'html', NULL, '', 'ed96f9e4-9e86-43ad-89af-0ca95cb6fcd6', 9223372036854775807, false, false, 73, 0, -1, NULL, NULL, 1442457899394, 23645, NULL, 147);
INSERT INTO managedobject VALUES (75, 'not to exceed', 0, 'html', NULL, '', '0c05278a-6182-45de-95c3-acc58b75d8d9', 9223372036854775807, false, false, 74, 0, -1, NULL, NULL, 1442457899491, 23647, NULL, 149);
INSERT INTO managedobject VALUES (76, 'between', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>Define the maximum and minimum ranges.
</body></html>', 'e61d3e28-1fbb-4b66-93b4-25e6e498a00f', 9223372036854775807, false, false, 75, 0, -1, NULL, NULL, 1442457899580, 23649, NULL, 151);
INSERT INTO managedobject VALUES (77, 'depends on', 0, 'html', NULL, '', '29f55b2d-6404-487f-8f7d-1f4c67f966c3', 9223372036854775807, false, false, 76, 0, -1, NULL, NULL, 1442457899680, 23651, NULL, 153);
INSERT INTO managedobject VALUES (78, 'efficient', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>If possible, define how long specific user operations will take.
</body></html>', '8df3a819-b659-4a99-81e5-c42abde6d064', 9223372036854775807, false, false, 77, 0, -1, NULL, NULL, 1442457899828, 23653, NULL, 155);
INSERT INTO managedobject VALUES (79, 'flexible', 0, 'html', NULL, '', '9ac25290-153f-495e-9da7-1a4dd1b70865', 9223372036854775807, false, false, 78, 0, -1, NULL, NULL, 1442457899930, 23655, NULL, 157);
INSERT INTO managedobject VALUES (80, 'improved', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>Describe, in measurable terms, what the improvement is needed.
&nbsp;For example, if performance needs to be improved, describe how
much faster specific user operations should be.
</body></html>', '3aadbb01-fa0c-41c5-a64c-d05cb2190100', 9223372036854775807, false, false, 79, 0, -1, NULL, NULL, 1442457900338, 23657, NULL, 159);
INSERT INTO managedobject VALUES (81, 'better', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>Define what better means in a way that can be tested.
</body></html>', '2a6ec0e9-5200-463e-a26c-517631dd1bf7', 9223372036854775807, false, false, 80, 0, -1, NULL, NULL, 1442457900457, 23659, NULL, 161);
INSERT INTO managedobject VALUES (82, 'faster', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>Define, in measurable terms, how much faster specific operations will be.
</body></html>', '8e7382a5-b935-4c77-8a1b-2dfd86839bee', 9223372036854775807, false, false, 81, 0, -1, NULL, NULL, 1442457900579, 23661, NULL, 163);
INSERT INTO managedobject VALUES (83, 'superior', 0, 'html', NULL, '', 'c02676bb-3a5a-4719-a4f9-ab78402f00da', 9223372036854775807, false, false, 82, 0, -1, NULL, NULL, 1442457900679, 23663, NULL, 165);
INSERT INTO managedobject VALUES (84, 'including', 0, 'html', NULL, '', 'be6ce49f-098d-4054-bf75-3675afa0d85b', 9223372036854775807, false, false, 83, 0, -1, NULL, NULL, 1442457900779, 23665, NULL, 167);
INSERT INTO managedobject VALUES (85, 'maximize', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>If possible, you should state the maximum parameters.
</body></html>', '8aed4526-99cf-4e2c-a491-596a8bd73325', 9223372036854775807, false, false, 84, 0, -1, NULL, NULL, 1442457900892, 23667, NULL, 169);
INSERT INTO managedobject VALUES (86, 'minimize', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>If possible, you should state the minimum parameters.
</body></html>', '469982db-3111-44bd-a654-5c8d33d5d3b3', 9223372036854775807, false, false, 85, 0, -1, NULL, NULL, 1442457901000, 23669, NULL, 171);
INSERT INTO managedobject VALUES (87, 'optimize', 0, 'html', NULL, '', 'e1967a14-cc02-4d93-906f-589d590e7308', 9223372036854775807, false, false, 86, 0, -1, NULL, NULL, 1442457901101, 23671, NULL, 173);
INSERT INTO managedobject VALUES (88, 'normally', 0, 'html', NULL, '', 'c77f5fd6-c8d2-4631-bcd4-4355766a81e9', 9223372036854775807, false, false, 87, 0, -1, NULL, NULL, 1442457901231, 23673, NULL, 175);
INSERT INTO managedobject VALUES (110, 'Create Account', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body> 
<h4 style="color: rgb(0, 64, 128);">Goal</h4>Give&nbsp;customers the ability to create a new account on the Agiveo Website.<br><h4 style="color: rgb(0, 64, 128);"><span style="font-weight: bold;">Summary</span></h4>A
customers connects to the Agiveo Website and completes the new account
process. &nbsp;After the user''s information is validated and stored in
the database the user is free to use Agiveo trading services.<br><h4 style="color: rgb(0, 64, 128);">Preconditions</h4>None.<h4 style="color: rgb(0, 64, 128);">Basic Flow</h4><ol><li>Customer connects to the Agiveo Financial Website.</li><li>Customer signifies that he would like to create a new account.</li><li>Customer submits: &nbsp;</li><ol><li>name</li><li>password</li><li>address</li><li>phone number</li><li>date of birth</li></ol><li>The system requests a credit score for the customer from the External Credit Verification System.</li><li>If the user''s credit score is over 600 then a new account is created in the system.</li><li>Customer is quickly notified of account creation.</li></ol><h4 style="color: rgb(0, 64, 128);">Alternate Flows</h4><ol><li>Customer''s password is not strong enough</li><ol><li>The system prompts the customer for a new, stronger password.</li><li>The customer enters a new password.</li><li>The system checks the strength of the new password.</li></ol><li>The customers credit score is below 600.</li><ol><li>The system informs the customer that their credit score is not high enough.</li><li>The system thanks them for their interest in Agiveo.</li></ol></ol><h4 style="color: rgb(0, 64, 128);">Postconditions</h4><ol><li>The customer has a valid account in the system.</li></ol>

</body></html>', '3680f963-dd2a-4898-9fa0-9e8d244a85dc', 9223372036854775807, false, false, 109, 0, -1, NULL, NULL, 1442457904328, 23717, NULL, 219);
INSERT INTO managedobject VALUES (111, 'Actors', 0, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', '5cdb0d66-0481-4900-848a-2bd4677c3a37', 9223372036854775807, false, false, 110, 0, -1, NULL, NULL, 1442457904481, 23719, NULL, 221);
INSERT INTO managedobject VALUES (112, 'Customer', 0, 'html', NULL, ' An individual that has an account with Agiveo. ', '09e553b8-6ef6-4e2f-b803-8767f1d381db', 9223372036854775807, false, false, 111, 0, -1, NULL, NULL, 1442457904607, 23721, NULL, 223);
INSERT INTO managedobject VALUES (113, 'Web Service Client', 0, 'html', NULL, ' Software that communicates with the Agiveo&nbsp;system through web service interfaces.', 'a4faedfb-8b12-4c67-a4b4-64e6bf475e01', 9223372036854775807, false, false, 112, 0, -1, NULL, NULL, 1442457904717, 23723, NULL, 225);
INSERT INTO managedobject VALUES (114, 'System Administrator', 0, 'html', NULL, ' The administrator of the Agiveo Financial website. ', '92caf0d8-072b-4839-86a0-24bd04c3ef25', 9223372036854775807, false, false, 113, 0, -1, NULL, NULL, 1442457904841, 23725, NULL, 227);
INSERT INTO managedobject VALUES (115, 'Trading System', 0, 'html', NULL, ' A external system that performs stock trades on behalf on an Agiveo <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<a href="axiom://id=87">customer</a>. ', 'e75b0689-fc77-489a-8c63-0cf2dc3c24c9', 9223372036854775807, false, false, 114, 0, -1, NULL, NULL, 1442457904956, 23727, NULL, 229);
INSERT INTO managedobject VALUES (116, 'Credit Verification System', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>An external system that provides a credit score for a specified user.
</body></html>', '902eca0e-ccb2-4f73-a02d-d5dd6ed5a101', 9223372036854775807, false, false, 115, 0, -1, NULL, NULL, 1442457905083, 23729, NULL, 231);
INSERT INTO managedobject VALUES (117, 'Bank', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body>A bank that has one ore more accounts held by a&nbsp;<a href="axiom://id=87">customer</a>.
</body></html>', '9b9b4255-3039-4b4c-afad-d115ecfd50e1', 9223372036854775807, false, false, 116, 0, -1, NULL, NULL, 1442457905210, 23731, NULL, 233);
INSERT INTO managedobject VALUES (126, 'Add Bank Account', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', 'e2f9532e-5411-413c-8395-2f0e454e889e', 9223372036854775807, false, false, 125, 0, -1, NULL, NULL, 1442457906431, 23749, NULL, 251);
INSERT INTO managedobject VALUES (127, 'Close Account', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', 'a7427493-234b-4b49-a999-adbdf246b9c2', 9223372036854775807, false, false, 126, 0, -1, NULL, NULL, 1442457906556, 23751, NULL, 253);
INSERT INTO managedobject VALUES (128, 'Create Account', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', '16dde407-7495-4db4-9932-7da193a56723', 9223372036854775807, false, false, 127, 0, -1, NULL, NULL, 1442457906695, 23753, NULL, 255);
INSERT INTO managedobject VALUES (129, 'Generate Report', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', 'c36a13e5-d563-4659-9a04-2c640860ad9c', 9223372036854775807, false, false, 128, 0, -1, NULL, NULL, 1442457906851, 23755, NULL, 257);
INSERT INTO managedobject VALUES (130, 'Purchase Stock', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', '13077c9e-22b0-4569-ac91-5b63bccf9008', 9223372036854775807, false, false, 129, 0, -1, NULL, NULL, 1442457907033, 23757, NULL, 259);
INSERT INTO managedobject VALUES (131, 'Add Bank Account (Alt 1)', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', 'a98d2c5f-f27f-4308-b86b-a4015000c999', 9223372036854775807, false, false, 130, 0, -1, NULL, NULL, 1442457907257, 23759, NULL, 261);
INSERT INTO managedobject VALUES (132, 'Add Bank Account (Alt 2)', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', 'ed043dee-4f1e-4a09-8648-86b0dfc898e7', 9223372036854775807, false, false, 131, 0, -1, NULL, NULL, 1442457907363, 23761, NULL, 263);
INSERT INTO managedobject VALUES (118, 'Close Account', 0, 'html', NULL, '  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<h4 style="color: rgb(0, 64, 128);">Goal</h4>Give&nbsp;customers the ability to remove their account from the system.<br /><h4 style="color: rgb(0, 64, 128);"><span style="font-weight: bold;">Summary</span></h4>A customers logs into the Agiveo website and signifies that they want to close his account. &nbsp; Once the transaction is complete the customers account is removed from the system.<br /><h4 style="color: rgb(0, 64, 128);">Preconditions</h4><ol><li>The customer must have an Agiveo account.</li><li>The customer must authenticate with the system.</li></ol><h4 style="color: rgb(0, 64, 128);">Basic Flow</h4><ol><li>Customer signifies that he would like to close his Agiveo account.</li><li>The system displays a &quot;are you sure&quot; confirmation dialog.</li><li>Upon confirming that the account is to be deleted the account is closed.</li><li>The system quickly sends an email to the customer confirming the account was closed.</li></ol><h4 style="color: rgb(0, 64, 128);">Alternate Flows</h4><ol><li>The customer cancels the &quot;are you sure&quot; confirmation dialog.</li><li>The customer is returned to the front page.</li></ol><h4 style="color: rgb(0, 64, 128);">Postconditions</h4><ol><li>The customers account is removed from the system.</li></ol>  ', 'a6181cac-0c9b-4f97-94a6-7aecf47ca105', 9223372036854775807, false, false, 117, 0, -1, NULL, NULL, 1442457905503, 23733, NULL, 235);
INSERT INTO managedobject VALUES (119, 'Purchase Stock', 0, 'html', NULL, ' <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<h4 style="color: rgb(0, 64, 128);">Goal</h4>Allow customers to purchase stock.<h4 style="color: rgb(0, 64, 128);"><span style="font-weight: bold;" />Summary</h4>A customers logs into his Agiveo account and selects &quot;Purchase Stock&quot; link. &nbsp; After selecting a stock symbol the user enters the amount of stock to purchase. &nbsp;Once the stock is purchased the stock is added to the user''s Agiveo account.<br /><h4 style="color: rgb(0, 64, 128);">Preconditions</h4><ol><li>The user must authenticate with the system.</li><li>The user must have funds in his account.</li></ol><h4 style="color: rgb(0, 64, 128);">Basic Flow</h4><ol><li>Customer clicks the &quot;Purchase Stock&quot; link.</li><li>The system prompts the user to enter a stock symbol and quantity.</li><li>The customer enters a stock symbol.</li><li>The user enters the amount of stock to purchase.</li><li>The system validates that the customer has enough funds in his Agiveo account.<br /></li><li>The system contacts the remote Trading System &nbsp;and purchases the stock.<br /></li><li>The customer is notified of the stock purchase.</li></ol><h4 style="color: rgb(0, 64, 128);">Alternate Flows</h4><ol><li>The user does not have sufficient funds.</li><ol><li>The user is notified that he does not have sufficient funds.</li><li>The user is forwarded to the &quot;Add Funds&quot; screen (see <a href="axiom://id=94">Add Funds</a>).</li></ol><li>The stock market is closed.</li><ol><li>The user is notified that his stock will be purchased as soon as the market opens.</li></ol></ol><h4 style="color: rgb(0, 64, 128);">Postconditions</h4><ol><li>The requested stock is added to the users account.</li></ol>     ', '7e66e675-a8be-4a89-b0ee-241572f249ff', 9223372036854775807, false, false, 118, 0, -1, NULL, NULL, 1442457905615, 23735, NULL, 237);
INSERT INTO managedobject VALUES (133, 'Add Funds (Alt 1)', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', '97a687c7-5b30-461f-8a66-611608fd90fb', 9223372036854775807, false, false, 132, 0, -1, NULL, NULL, 1442457907490, 23763, NULL, 265);
INSERT INTO managedobject VALUES (134, 'Add Funds (Alt 2)', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', '9482aac6-a373-42e3-82d4-f9c63d55f2ea', 9223372036854775807, false, false, 133, 0, -1, NULL, NULL, 1442457907591, 23765, NULL, 267);
INSERT INTO managedobject VALUES (135, 'Close Account (Alt 1)', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', '4f67d036-4465-4651-932a-801b6ac3a6da', 9223372036854775807, false, false, 134, 0, -1, NULL, NULL, 1442457907700, 23767, NULL, 269);
INSERT INTO managedobject VALUES (136, 'Create Account (Alt 1)', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', 'd7ba1be8-ee00-4b16-8f87-8c5ab5cd6918', 9223372036854775807, false, false, 135, 0, -1, NULL, NULL, 1442457907822, 23769, NULL, 271);
INSERT INTO managedobject VALUES (137, 'Create Account (Alt 2)', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', '3272b9ce-ae9e-45fe-801a-5448ee53038a', 9223372036854775807, false, false, 136, 0, -1, NULL, NULL, 1442457907934, 23771, NULL, 273);
INSERT INTO managedobject VALUES (138, 'Purchase Stock (Alt 1)', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', '7df0e0e9-4b85-48db-92d0-c6cbd17265e6', 9223372036854775807, false, false, 137, 0, -1, NULL, NULL, 1442457908211, 23773, NULL, 275);
INSERT INTO managedobject VALUES (139, 'Purchase Stock (Alt 2)', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', '27e6697e-36fd-42b7-8427-b1390c56de33', 9223372036854775807, false, false, 138, 0, -1, NULL, NULL, 1442457908345, 23775, NULL, 277);
INSERT INTO managedobject VALUES (140, 'Non-Functional Requirement Tests', 0, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', 'd2ed6f7b-1ec4-42f8-93de-75788592349d', 9223372036854775807, false, false, 139, 0, -1, NULL, NULL, 1442457908491, 23777, NULL, 279);
INSERT INTO managedobject VALUES (120, 'Add Funds', 0, 'html', NULL, ' <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<h4 style="color: rgb(0, 64, 128);">Goal</h4>Allow customers to add funds to their Agiveo account.<br /><h4 style="color: rgb(0, 64, 128);"><span style="font-weight: bold;" />Summary</h4>A customer logs into the Agiveo Website and after entering a bank account number adds funds to his Agiveo account. &nbsp;The customer is then free to use these funds to purchase stock.<br /><h4 style="color: rgb(0, 64, 128);">Preconditions</h4><ol><li>The customer must have an Agiveo account.</li><li>The customer must authenticate with the system.</li></ol><h4 style="color: rgb(0, 64, 128);">Basic Flow</h4><ol><li>Customer signifies that he would like to add funds to his account.</li><li>The user selects the bank account that will be the source of these funds.</li><li>The user enters the amount to transfer.</li><li>The system transfers the funds to the Agiveo account.</li><li>Customer is sent notification that funds were transfered.</li></ol><h4 style="color: rgb(0, 64, 128);">Alternate Flows</h4><ol><li>The user does not have enough funds in bank account.</li><ol><li>The system displays a warning that there are insufficient funds in the bank account.</li><li>The system prompts the user for a new amount.</li></ol><li>The user has not setup a bank account with Agiveo.</li><ol><li>The customer adds a bank account to their Agiveo account. &nbsp;See <a href="axiom://id=95">Add Bank Account</a>.</li></ol></ol><h4 style="color: rgb(0, 64, 128);">Postconditions</h4><ol><li>Funds are added to the customer''s account which can then be used to purchase stock.</li></ol>    ', '75ffab6b-1092-4b1d-bbbd-426ba7f621b3', 9223372036854775807, false, false, 119, 0, -1, NULL, NULL, 1442457905744, 23737, NULL, 239);
INSERT INTO managedobject VALUES (121, 'Add Bank Account', 0, 'html', NULL, ' <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<h4 style="color: rgb(0, 64, 128);">Goal</h4>Give&nbsp;customers the ability to specify a bank account that will be the source of funds for their Agiveo accounts.<br /><h4 style="color: rgb(0, 64, 128);"><span style="font-weight: bold;" />Summary</h4>A customers must specify one or more&nbsp;back accounts to be the&nbsp;source of Agiveo funds. &nbsp;In this use case, a customer will login to the Agiveo Financial website and enter account information his bank account information. &nbsp;When this information is submitted, the system will validate the information with the specified bank.<br /><h4 style="color: rgb(0, 64, 128);">Preconditions</h4><ol><li>The customer must have an Agiveo account.</li><li>The customer must be authenticated with the system.</li></ol><h4 style="color: rgb(0, 64, 128);">Basic Flow</h4><ol><li>Customer clicks the&nbsp;Add Bank Account&quot; link.</li><li>The system displays the &quot;New Bank Account&quot; form.</li><li>The customer enters:</li><ol><li>Bank Name</li><li>Account Number</li><li>Bank Routing Number</li></ol><li>The customer clicks the &quot;Submit&quot; link</li><li>The system connects to the <a href="axiom://id=97">bank</a> and makes three small random deposits.</li><li>The system requests that the customer check his bank statement to obtain the amounts of the deposits.</li><li>After checking his bank statement, the customer enters the amounts of the three small random deposits. </li></ol><h4 style="color: rgb(0, 64, 128);">Alternate Flows</h4><ol><li>The bank''s name, account number or routing number are invalid.</li><ol><li>The system prompts the user for the correct information.</li><li>The customer enters the correct information.</li></ol><li>After step 5, the user is unable to verify the 3 small amounts.</li><ol><li>The system makes 3 more deposits.</li></ol></ol><h4 style="color: rgb(0, 64, 128);">Postconditions</h4><ol><li>The user can now use the bank account to add and withdraw funds from his Agiveo account.</li></ol>    ', '261d830d-d6f2-4f8a-83d3-9f6eaecb8ca2', 9223372036854775807, false, false, 120, 0, -1, NULL, NULL, 1442457905862, 23739, NULL, 241);
INSERT INTO managedobject VALUES (122, 'Generate Report', 0, 'html', NULL, ' <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<h4 style="color: rgb(0, 64, 128);">Goal</h4>Allow customers to create a report that showing account activity.<br /><h4 style="color: rgb(0, 64, 128);"><span style="font-weight: bold;" />Summary</h4>A customer logs into the Agiveo Website and generates a report containing account activity for a specified period of time.<br /><h4 style="color: rgb(0, 64, 128);">Preconditions</h4><ol><li>The customer must have an Agiveo account.</li><li>The customer must authenticate with the system.</li></ol><h4 style="color: rgb(0, 64, 128);">Basic Flow</h4><ol><li>The customer clicks the &quot;Statement&quot; link.</li><li>The customer enters the start and end dates for the statement.</li><li>The customer selects one of the following formats for the statement:</li><ol><li>HTML</li><li>PDF</li><li>CSV</li></ol><li>The system generates the statement.<br /></li></ol><h4 style="color: rgb(0, 64, 128);">Alternate Flows</h4>None<br /><h4 style="color: rgb(0, 64, 128);">Postcondition</h4>None ', '740c22c7-fec6-4702-a7c0-6c06084845f3', 9223372036854775807, false, false, 121, 0, -1, NULL, NULL, 1442457905981, 23741, NULL, 243);
INSERT INTO managedobject VALUES (123, 'Test Cases', 0, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', '3c5f19be-a8ca-459b-908f-696180f22d55', 9223372036854775807, false, false, 122, 0, -1, NULL, NULL, 1442457906070, 23743, NULL, 245);
INSERT INTO managedobject VALUES (124, 'Use Case Tests', 0, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', 'f3162c87-d755-4b6b-9386-b0ee1341dcee', 9223372036854775807, false, false, 123, 0, -1, NULL, NULL, 1442457906180, 23745, NULL, 247);
INSERT INTO managedobject VALUES (125, 'Add Funds', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4>To test the&nbsp;<a href="axiom://id=94">Add Funds</a> use case.<br><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><ol><li>Create a user account.</li><li>The customer must authenticate with the system.</li></ol><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4>

</body></html>', 'a4c40ab7-4c2f-4a53-96e3-04c1620cf44c', 9223372036854775807, false, false, 124, 0, -1, NULL, NULL, 1442457906282, 23747, NULL, 249);
INSERT INTO managedobject VALUES (141, 'Security Audit', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', 'a736b979-655d-458e-8fc6-a5f56bec94dc', 9223372036854775807, false, false, 140, 0, -1, NULL, NULL, 1442457908599, 23779, NULL, 281);
INSERT INTO managedobject VALUES (142, 'Authentication', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', '0fa4f12f-10f3-4b55-a7ac-ca4c6be01b37', 9223372036854775807, false, false, 141, 0, -1, NULL, NULL, 1442457908739, 23781, NULL, 283);
INSERT INTO managedobject VALUES (143, 'Data Integrity', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', '9b8af344-b1e2-446d-93d6-839ceccdd4cb', 9223372036854775807, false, false, 142, 0, -1, NULL, NULL, 1442457908866, 23783, NULL, 285);
INSERT INTO managedobject VALUES (144, 'Encryption', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', 'a3fb9aaa-5000-46a0-8486-6bf4bee4178f', 9223372036854775807, false, false, 143, 0, -1, NULL, NULL, 1442457908990, 23785, NULL, 287);
INSERT INTO managedobject VALUES (145, 'Firefox 3.5', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', 'db89eb8d-7a18-4662-8bfd-d67002ebf81c', 9223372036854775807, false, false, 144, 0, -1, NULL, NULL, 1442457909090, 23787, NULL, 289);
INSERT INTO managedobject VALUES (146, 'Google Chrome 1.0', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', 'de7f9d9f-125a-4555-9047-e9c397e1e560', 9223372036854775807, false, false, 145, 0, -1, NULL, NULL, 1442457909177, 23789, NULL, 291);
INSERT INTO managedobject VALUES (147, 'Opera 9.5', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', 'c3673ec9-cd2c-4d70-bf77-4f0391e56930', 9223372036854775807, false, false, 146, 0, -1, NULL, NULL, 1442457909302, 23791, NULL, 293);
INSERT INTO managedobject VALUES (148, 'InternetExplorer 8.0', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', '4dd04436-1510-4c00-8319-f76cdfc091a3', 9223372036854775807, false, false, 147, 0, -1, NULL, NULL, 1442457909593, 23793, NULL, 295);
INSERT INTO managedobject VALUES (149, 'Failure and Outage Notifications', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', '7b036fbf-cad6-49e1-b751-f86183a96235', 9223372036854775807, false, false, 148, 0, -1, NULL, NULL, 1442457909723, 23795, NULL, 297);
INSERT INTO managedobject VALUES (150, 'Accessibility', 0, 'html', NULL, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head></head>

<body><h4 style="color: rgb(0, 64, 128);">Purpose</h4><h4><span style="font-weight: bold;"></span><span style="color: rgb(0, 64, 128);">Prerequisites</span></h4><h4 style="color: rgb(0, 64, 128);">Test Data</h4><h4 style="color: rgb(0, 64, 128);">Steps</h4></body></html>', '45e43c21-1051-4d5d-99db-0e1de89ed8c6', 9223372036854775807, false, false, 149, 0, -1, NULL, NULL, 1442457909880, 23797, NULL, 299);
INSERT INTO managedobject VALUES (151, 'Templates', 1, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', '7fd9615b-aeba-479d-bd88-3367fdf1f062', 9223372036854775807, false, false, 3, 0, -1, NULL, NULL, 1442457909983, 23798, NULL, 301);
INSERT INTO managedobject VALUES (152, 'Agiveo Financial', 1, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', '66bd2793-dc8c-490f-bc3e-d6c085a67784', 9223372036854775807, false, false, 11, 0, -1, NULL, NULL, 1442457910099, 23800, NULL, 302);
INSERT INTO managedobject VALUES (153, 'Non-Functional Requirements', 1, 'com.ryba.client.object.workbench.folder.folderContentType', NULL, '', '963df7a6-82c5-41a4-a708-289c6ea74d50', 9223372036854775807, false, false, 12, 0, -1, NULL, NULL, 1442457910222, 23802, NULL, 303);
INSERT INTO managedobject VALUES (154, 'admin', 0, NULL, NULL, '', '0da122e7-e353-41c0-8004-b7b4d135621b', 9223372036854775807, false, false, 150, 0, -1, NULL, NULL, 0, 23960, NULL, NULL);
INSERT INTO managedobject VALUES (155, 'CrowDe', 0, 'com.ryba.client.object.workbench.folder.folderContentType', 'admin', '', 'd851be76-9b2b-457c-ad90-c1174e32417f', 9223372036854775807, false, false, 154, 0, -1, NULL, NULL, 1442458921782, 23971, NULL, 462);
INSERT INTO managedobject VALUES (156, 'Requisitos Funcionais', 0, 'com.ryba.client.object.workbench.folder.folderContentType', 'admin', '', 'e246a1ce-5b71-4e08-a96f-da09d29ddada', 9223372036854775807, false, false, 155, 0, -1, NULL, NULL, 1442458935972, 23973, NULL, 464);
INSERT INTO managedobject VALUES (157, 'Template', 0, 'com.ryba.client.object.workbench.folder.folderContentType', 'admin', '', 'e246a1ce-5b71-4e08-a96f-da09d29ddada', 9223372036854775807, false, false, 156, 0, -1, NULL, NULL, 1442458944212, 23975, NULL, 466);
INSERT INTO managedobject VALUES (158, 'Requisitos Nao Funcionais', 0, 'com.ryba.client.object.workbench.folder.folderContentType', 'admin', '', 'e246a1ce-5b71-4e08-a96f-da09d29ddada', 9223372036854775807, false, false, 157, 0, -1, NULL, NULL, 1442458960620, 23977, NULL, 468);
INSERT INTO managedobject VALUES (159, 'Requisito Funcional', 0, 'html', 'admin', '', '59000c29-5b90-4477-84fa-f481b91a3ecd', 9223372036854775807, false, true, 158, 0, -1, NULL, NULL, 1442459008367, 23979, NULL, 470);


--
-- TOC entry 2448 (class 0 OID 23074)
-- Dependencies: 201
-- Data for Name: managedobject_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO managedobject_attribute VALUES (14, 4, 0);
INSERT INTO managedobject_attribute VALUES (14, 5, 1);
INSERT INTO managedobject_attribute VALUES (14, 6, 2);
INSERT INTO managedobject_attribute VALUES (15, 7, 0);
INSERT INTO managedobject_attribute VALUES (15, 8, 1);
INSERT INTO managedobject_attribute VALUES (15, 9, 2);
INSERT INTO managedobject_attribute VALUES (16, 10, 0);
INSERT INTO managedobject_attribute VALUES (16, 11, 1);
INSERT INTO managedobject_attribute VALUES (16, 12, 2);
INSERT INTO managedobject_attribute VALUES (17, 13, 0);
INSERT INTO managedobject_attribute VALUES (17, 14, 1);
INSERT INTO managedobject_attribute VALUES (17, 15, 2);
INSERT INTO managedobject_attribute VALUES (18, 16, 0);
INSERT INTO managedobject_attribute VALUES (18, 17, 1);
INSERT INTO managedobject_attribute VALUES (18, 18, 2);
INSERT INTO managedobject_attribute VALUES (19, 19, 0);
INSERT INTO managedobject_attribute VALUES (19, 20, 1);
INSERT INTO managedobject_attribute VALUES (19, 21, 2);
INSERT INTO managedobject_attribute VALUES (20, 22, 0);
INSERT INTO managedobject_attribute VALUES (20, 23, 1);
INSERT INTO managedobject_attribute VALUES (20, 24, 2);
INSERT INTO managedobject_attribute VALUES (21, 25, 0);
INSERT INTO managedobject_attribute VALUES (21, 26, 1);
INSERT INTO managedobject_attribute VALUES (21, 27, 2);
INSERT INTO managedobject_attribute VALUES (22, 28, 0);
INSERT INTO managedobject_attribute VALUES (22, 29, 1);
INSERT INTO managedobject_attribute VALUES (22, 30, 2);
INSERT INTO managedobject_attribute VALUES (23, 31, 0);
INSERT INTO managedobject_attribute VALUES (23, 32, 1);
INSERT INTO managedobject_attribute VALUES (23, 33, 2);
INSERT INTO managedobject_attribute VALUES (24, 34, 0);
INSERT INTO managedobject_attribute VALUES (24, 35, 1);
INSERT INTO managedobject_attribute VALUES (24, 36, 2);
INSERT INTO managedobject_attribute VALUES (25, 37, 0);
INSERT INTO managedobject_attribute VALUES (25, 38, 1);
INSERT INTO managedobject_attribute VALUES (25, 39, 2);
INSERT INTO managedobject_attribute VALUES (26, 40, 0);
INSERT INTO managedobject_attribute VALUES (26, 41, 1);
INSERT INTO managedobject_attribute VALUES (26, 42, 2);
INSERT INTO managedobject_attribute VALUES (27, 43, 0);
INSERT INTO managedobject_attribute VALUES (27, 44, 1);
INSERT INTO managedobject_attribute VALUES (27, 45, 2);
INSERT INTO managedobject_attribute VALUES (28, 46, 0);
INSERT INTO managedobject_attribute VALUES (28, 47, 1);
INSERT INTO managedobject_attribute VALUES (28, 48, 2);
INSERT INTO managedobject_attribute VALUES (29, 49, 0);
INSERT INTO managedobject_attribute VALUES (29, 50, 1);
INSERT INTO managedobject_attribute VALUES (29, 51, 2);
INSERT INTO managedobject_attribute VALUES (30, 52, 0);
INSERT INTO managedobject_attribute VALUES (30, 53, 1);
INSERT INTO managedobject_attribute VALUES (30, 54, 2);
INSERT INTO managedobject_attribute VALUES (31, 55, 0);
INSERT INTO managedobject_attribute VALUES (31, 56, 1);
INSERT INTO managedobject_attribute VALUES (31, 57, 2);
INSERT INTO managedobject_attribute VALUES (32, 58, 0);
INSERT INTO managedobject_attribute VALUES (32, 59, 1);
INSERT INTO managedobject_attribute VALUES (32, 60, 2);
INSERT INTO managedobject_attribute VALUES (33, 61, 0);
INSERT INTO managedobject_attribute VALUES (33, 62, 1);
INSERT INTO managedobject_attribute VALUES (33, 63, 2);
INSERT INTO managedobject_attribute VALUES (34, 64, 0);
INSERT INTO managedobject_attribute VALUES (34, 65, 1);
INSERT INTO managedobject_attribute VALUES (34, 66, 2);
INSERT INTO managedobject_attribute VALUES (35, 67, 0);
INSERT INTO managedobject_attribute VALUES (35, 68, 1);
INSERT INTO managedobject_attribute VALUES (35, 69, 2);
INSERT INTO managedobject_attribute VALUES (36, 70, 0);
INSERT INTO managedobject_attribute VALUES (36, 71, 1);
INSERT INTO managedobject_attribute VALUES (36, 72, 2);
INSERT INTO managedobject_attribute VALUES (37, 73, 0);
INSERT INTO managedobject_attribute VALUES (37, 74, 1);
INSERT INTO managedobject_attribute VALUES (37, 75, 2);
INSERT INTO managedobject_attribute VALUES (38, 76, 0);
INSERT INTO managedobject_attribute VALUES (38, 77, 1);
INSERT INTO managedobject_attribute VALUES (38, 78, 2);
INSERT INTO managedobject_attribute VALUES (39, 79, 0);
INSERT INTO managedobject_attribute VALUES (39, 80, 1);
INSERT INTO managedobject_attribute VALUES (39, 81, 2);
INSERT INTO managedobject_attribute VALUES (40, 82, 0);
INSERT INTO managedobject_attribute VALUES (40, 83, 1);
INSERT INTO managedobject_attribute VALUES (40, 84, 2);
INSERT INTO managedobject_attribute VALUES (41, 85, 0);
INSERT INTO managedobject_attribute VALUES (41, 86, 1);
INSERT INTO managedobject_attribute VALUES (41, 87, 2);
INSERT INTO managedobject_attribute VALUES (42, 88, 0);
INSERT INTO managedobject_attribute VALUES (42, 89, 1);
INSERT INTO managedobject_attribute VALUES (42, 90, 2);
INSERT INTO managedobject_attribute VALUES (43, 91, 0);
INSERT INTO managedobject_attribute VALUES (43, 92, 1);
INSERT INTO managedobject_attribute VALUES (43, 93, 2);
INSERT INTO managedobject_attribute VALUES (44, 94, 0);
INSERT INTO managedobject_attribute VALUES (44, 95, 1);
INSERT INTO managedobject_attribute VALUES (44, 96, 2);
INSERT INTO managedobject_attribute VALUES (45, 97, 0);
INSERT INTO managedobject_attribute VALUES (45, 98, 1);
INSERT INTO managedobject_attribute VALUES (45, 99, 2);
INSERT INTO managedobject_attribute VALUES (46, 100, 0);
INSERT INTO managedobject_attribute VALUES (46, 101, 1);
INSERT INTO managedobject_attribute VALUES (46, 102, 2);
INSERT INTO managedobject_attribute VALUES (47, 103, 0);
INSERT INTO managedobject_attribute VALUES (47, 104, 1);
INSERT INTO managedobject_attribute VALUES (47, 105, 2);
INSERT INTO managedobject_attribute VALUES (57, 106, 0);
INSERT INTO managedobject_attribute VALUES (57, 107, 1);
INSERT INTO managedobject_attribute VALUES (57, 108, 2);
INSERT INTO managedobject_attribute VALUES (59, 111, 0);
INSERT INTO managedobject_attribute VALUES (59, 112, 1);
INSERT INTO managedobject_attribute VALUES (59, 113, 2);
INSERT INTO managedobject_attribute VALUES (61, 115, 0);
INSERT INTO managedobject_attribute VALUES (62, 116, 0);
INSERT INTO managedobject_attribute VALUES (62, 117, 1);
INSERT INTO managedobject_attribute VALUES (110, 118, 0);
INSERT INTO managedobject_attribute VALUES (110, 119, 1);
INSERT INTO managedobject_attribute VALUES (110, 120, 2);
INSERT INTO managedobject_attribute VALUES (112, 121, 0);
INSERT INTO managedobject_attribute VALUES (113, 122, 0);
INSERT INTO managedobject_attribute VALUES (114, 123, 0);
INSERT INTO managedobject_attribute VALUES (115, 124, 0);
INSERT INTO managedobject_attribute VALUES (116, 125, 0);
INSERT INTO managedobject_attribute VALUES (117, 126, 0);
INSERT INTO managedobject_attribute VALUES (118, 127, 0);
INSERT INTO managedobject_attribute VALUES (118, 128, 1);
INSERT INTO managedobject_attribute VALUES (118, 129, 2);
INSERT INTO managedobject_attribute VALUES (119, 130, 0);
INSERT INTO managedobject_attribute VALUES (119, 131, 1);
INSERT INTO managedobject_attribute VALUES (119, 132, 2);
INSERT INTO managedobject_attribute VALUES (120, 133, 0);
INSERT INTO managedobject_attribute VALUES (120, 134, 1);
INSERT INTO managedobject_attribute VALUES (120, 135, 2);
INSERT INTO managedobject_attribute VALUES (121, 136, 0);
INSERT INTO managedobject_attribute VALUES (121, 137, 1);
INSERT INTO managedobject_attribute VALUES (121, 138, 2);
INSERT INTO managedobject_attribute VALUES (122, 139, 0);
INSERT INTO managedobject_attribute VALUES (122, 140, 1);
INSERT INTO managedobject_attribute VALUES (122, 141, 2);
INSERT INTO managedobject_attribute VALUES (125, 142, 0);
INSERT INTO managedobject_attribute VALUES (125, 143, 1);
INSERT INTO managedobject_attribute VALUES (126, 144, 0);
INSERT INTO managedobject_attribute VALUES (126, 145, 1);
INSERT INTO managedobject_attribute VALUES (127, 146, 0);
INSERT INTO managedobject_attribute VALUES (127, 147, 1);
INSERT INTO managedobject_attribute VALUES (128, 148, 0);
INSERT INTO managedobject_attribute VALUES (128, 149, 1);
INSERT INTO managedobject_attribute VALUES (129, 150, 0);
INSERT INTO managedobject_attribute VALUES (129, 151, 1);
INSERT INTO managedobject_attribute VALUES (130, 152, 0);
INSERT INTO managedobject_attribute VALUES (130, 153, 1);
INSERT INTO managedobject_attribute VALUES (131, 154, 0);
INSERT INTO managedobject_attribute VALUES (131, 155, 1);
INSERT INTO managedobject_attribute VALUES (132, 156, 0);
INSERT INTO managedobject_attribute VALUES (132, 157, 1);
INSERT INTO managedobject_attribute VALUES (133, 158, 0);
INSERT INTO managedobject_attribute VALUES (133, 159, 1);
INSERT INTO managedobject_attribute VALUES (134, 160, 0);
INSERT INTO managedobject_attribute VALUES (134, 161, 1);
INSERT INTO managedobject_attribute VALUES (135, 162, 0);
INSERT INTO managedobject_attribute VALUES (135, 163, 1);
INSERT INTO managedobject_attribute VALUES (136, 164, 0);
INSERT INTO managedobject_attribute VALUES (136, 165, 1);
INSERT INTO managedobject_attribute VALUES (137, 166, 0);
INSERT INTO managedobject_attribute VALUES (137, 167, 1);
INSERT INTO managedobject_attribute VALUES (138, 168, 0);
INSERT INTO managedobject_attribute VALUES (138, 169, 1);
INSERT INTO managedobject_attribute VALUES (139, 170, 0);
INSERT INTO managedobject_attribute VALUES (139, 171, 1);
INSERT INTO managedobject_attribute VALUES (141, 172, 0);
INSERT INTO managedobject_attribute VALUES (141, 173, 1);
INSERT INTO managedobject_attribute VALUES (142, 174, 0);
INSERT INTO managedobject_attribute VALUES (142, 175, 1);
INSERT INTO managedobject_attribute VALUES (143, 176, 0);
INSERT INTO managedobject_attribute VALUES (143, 177, 1);
INSERT INTO managedobject_attribute VALUES (144, 178, 0);
INSERT INTO managedobject_attribute VALUES (144, 179, 1);
INSERT INTO managedobject_attribute VALUES (145, 180, 0);
INSERT INTO managedobject_attribute VALUES (145, 181, 1);
INSERT INTO managedobject_attribute VALUES (146, 182, 0);
INSERT INTO managedobject_attribute VALUES (146, 183, 1);
INSERT INTO managedobject_attribute VALUES (147, 184, 0);
INSERT INTO managedobject_attribute VALUES (147, 185, 1);
INSERT INTO managedobject_attribute VALUES (148, 186, 0);
INSERT INTO managedobject_attribute VALUES (148, 187, 1);
INSERT INTO managedobject_attribute VALUES (149, 188, 0);
INSERT INTO managedobject_attribute VALUES (149, 189, 1);
INSERT INTO managedobject_attribute VALUES (150, 190, 0);
INSERT INTO managedobject_attribute VALUES (150, 191, 1);


--
-- TOC entry 2449 (class 0 OID 23081)
-- Dependencies: 202
-- Data for Name: managedobject_link; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2450 (class 0 OID 23086)
-- Dependencies: 203
-- Data for Name: managedobject_managedobject; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2451 (class 0 OID 23093)
-- Dependencies: 204
-- Data for Name: managedobject_templatecontexts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO managedobject_templatecontexts VALUES (5, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (6, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (7, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (8, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (9, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (10, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (11, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (56, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (57, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (58, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (59, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (60, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (61, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (62, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (155, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (156, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (157, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (158, 0, 0);
INSERT INTO managedobject_templatecontexts VALUES (159, 154, 0);


--
-- TOC entry 2452 (class 0 OID 23098)
-- Dependencies: 205
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2453 (class 0 OID 23106)
-- Dependencies: 206
-- Data for Name: message_message; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2454 (class 0 OID 23113)
-- Dependencies: 207
-- Data for Name: message_readbyuserids; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2455 (class 0 OID 23116)
-- Dependencies: 208
-- Data for Name: metricevent; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO metricevent VALUES (455, 'com.ryba.server.ldap.LDAPManager', 'public void com.ryba.server.ldap.LDAPManager.authenticateUser(java.lang.String,java.lang.String) throws com.novell.ldap.LDAPException', 1442458424429, 0);
INSERT INTO metricevent VALUES (459, 'com.ryba.server.ldap.LDAPManager', 'public void com.ryba.server.ldap.LDAPManager.authenticateUser(java.lang.String,java.lang.String) throws com.novell.ldap.LDAPException', 1442458588393, 0);
INSERT INTO metricevent VALUES (461, 'com.ryba.server.ldap.LDAPManager', 'public void com.ryba.server.ldap.LDAPManager.authenticateUser(java.lang.String,java.lang.String) throws com.novell.ldap.LDAPException', 1442458882747, 0);


--
-- TOC entry 2446 (class 0 OID 23061)
-- Dependencies: 199
-- Data for Name: mor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mor VALUES (6, 0, '', 4, -1, NULL, NULL);
INSERT INTO mor VALUES (8, 0, '', 4, -1, NULL, NULL);
INSERT INTO mor VALUES (10, 0, '', 5, -1, NULL, NULL);
INSERT INTO mor VALUES (12, 0, '', 6, -1, NULL, NULL);
INSERT INTO mor VALUES (14, 0, '', 7, -1, NULL, NULL);
INSERT INTO mor VALUES (16, 0, '', 8, -1, NULL, NULL);
INSERT INTO mor VALUES (18, 0, '', 9, -1, NULL, NULL);
INSERT INTO mor VALUES (20, 0, '', 10, -1, NULL, NULL);
INSERT INTO mor VALUES (23, 0, '', 9, -1, NULL, NULL);
INSERT INTO mor VALUES (25, 0, '', 4, -1, NULL, NULL);
INSERT INTO mor VALUES (27, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (29, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (31, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (33, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (35, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (37, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (39, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (41, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (43, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (45, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (47, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (49, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (51, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (53, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (55, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (57, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (59, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (61, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (63, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (65, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (67, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (69, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (71, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (73, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (75, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (77, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (79, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (81, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (83, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (85, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (87, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (89, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (91, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (93, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (95, 0, '', 4, -1, NULL, NULL);
INSERT INTO mor VALUES (97, 0, '', 56, -1, NULL, NULL);
INSERT INTO mor VALUES (99, 0, '', 56, -1, NULL, NULL);
INSERT INTO mor VALUES (101, 0, '', 56, -1, NULL, NULL);
INSERT INTO mor VALUES (103, 0, '', 56, -1, NULL, NULL);
INSERT INTO mor VALUES (105, 0, '', 56, -1, NULL, NULL);
INSERT INTO mor VALUES (107, 0, '', 56, -1, NULL, NULL);
INSERT INTO mor VALUES (109, 0, '', 4, -1, NULL, NULL);
INSERT INTO mor VALUES (111, 0, '', 55, -1, NULL, NULL);
INSERT INTO mor VALUES (113, 0, '', 56, -1, NULL, NULL);
INSERT INTO mor VALUES (115, 0, '', 57, -1, NULL, NULL);
INSERT INTO mor VALUES (117, 0, '', 58, -1, NULL, NULL);
INSERT INTO mor VALUES (119, 0, '', 59, -1, NULL, NULL);
INSERT INTO mor VALUES (121, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (123, 0, '', 61, -1, NULL, NULL);
INSERT INTO mor VALUES (125, 0, '', 4, -1, NULL, NULL);
INSERT INTO mor VALUES (127, 0, '', 58, -1, NULL, NULL);
INSERT INTO mor VALUES (129, 0, '', 58, -1, NULL, NULL);
INSERT INTO mor VALUES (131, 0, '', 58, -1, NULL, NULL);
INSERT INTO mor VALUES (133, 0, '', 58, -1, NULL, NULL);
INSERT INTO mor VALUES (135, 0, '', 4, -1, NULL, NULL);
INSERT INTO mor VALUES (137, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (139, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (141, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (143, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (145, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (147, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (149, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (151, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (153, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (155, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (157, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (159, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (161, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (163, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (165, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (167, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (169, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (171, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (173, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (175, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (177, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (179, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (181, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (183, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (185, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (187, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (189, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (191, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (193, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (195, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (197, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (199, 0, '', 60, -1, NULL, NULL);
INSERT INTO mor VALUES (201, 0, '', 58, -1, NULL, NULL);
INSERT INTO mor VALUES (203, 0, '', 58, -1, NULL, NULL);
INSERT INTO mor VALUES (205, 0, '', 58, -1, NULL, NULL);
INSERT INTO mor VALUES (207, 0, '', 58, -1, NULL, NULL);
INSERT INTO mor VALUES (209, 0, '', 58, -1, NULL, NULL);
INSERT INTO mor VALUES (211, 0, '', 58, -1, NULL, NULL);
INSERT INTO mor VALUES (213, 0, '', 58, -1, NULL, NULL);
INSERT INTO mor VALUES (215, 0, '', 58, -1, NULL, NULL);
INSERT INTO mor VALUES (217, 0, '', 4, -1, NULL, NULL);
INSERT INTO mor VALUES (219, 0, '', 59, -1, NULL, NULL);
INSERT INTO mor VALUES (221, 0, '', 4, -1, NULL, NULL);
INSERT INTO mor VALUES (223, 0, '', 61, -1, NULL, NULL);
INSERT INTO mor VALUES (225, 0, '', 61, -1, NULL, NULL);
INSERT INTO mor VALUES (227, 0, '', 61, -1, NULL, NULL);
INSERT INTO mor VALUES (229, 0, '', 61, -1, NULL, NULL);
INSERT INTO mor VALUES (231, 0, '', 61, -1, NULL, NULL);
INSERT INTO mor VALUES (233, 0, '', 61, -1, NULL, NULL);
INSERT INTO mor VALUES (235, 0, '', 59, -1, NULL, NULL);
INSERT INTO mor VALUES (237, 0, '', 59, -1, NULL, NULL);
INSERT INTO mor VALUES (239, 0, '', 59, -1, NULL, NULL);
INSERT INTO mor VALUES (241, 0, '', 59, -1, NULL, NULL);
INSERT INTO mor VALUES (243, 0, '', 59, -1, NULL, NULL);
INSERT INTO mor VALUES (245, 0, '', 4, -1, NULL, NULL);
INSERT INTO mor VALUES (247, 0, '', 4, -1, NULL, NULL);
INSERT INTO mor VALUES (249, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (251, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (253, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (255, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (257, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (259, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (261, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (263, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (265, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (267, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (269, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (271, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (273, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (275, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (277, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (279, 0, '', 4, -1, NULL, NULL);
INSERT INTO mor VALUES (281, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (283, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (285, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (287, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (289, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (291, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (293, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (295, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (297, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (299, 0, '', 62, -1, NULL, NULL);
INSERT INTO mor VALUES (301, 0, '', 4, -1, NULL, NULL);
INSERT INTO mor VALUES (302, 0, '', 7, -1, NULL, NULL);
INSERT INTO mor VALUES (303, 0, '', 4, -1, NULL, NULL);
INSERT INTO mor VALUES (462, 0, '', 7, 0, NULL, NULL);
INSERT INTO mor VALUES (464, 0, '', 4, 0, NULL, NULL);
INSERT INTO mor VALUES (466, 0, '', 4, 0, NULL, NULL);
INSERT INTO mor VALUES (468, 0, '', 4, 0, NULL, NULL);
INSERT INTO mor VALUES (470, 0, '', 158, -1, NULL, NULL);


--
-- TOC entry 2456 (class 0 OID 23124)
-- Dependencies: 209
-- Data for Name: principal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO principal VALUES ('User', 4, 'Axiom Administrator', 'admin', 'I3Ga/Q8eJCnIuQon/GNClg==', 'admin', '', true, 'Axiom', 'Administrator');


--
-- TOC entry 2477 (class 0 OID 23259)
-- Dependencies: 230
-- Data for Name: rul; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2457 (class 0 OID 23132)
-- Dependencies: 210
-- Data for Name: runtimemetric; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO runtimemetric VALUES (304, 1442457915469, 137887744, 77965432, 517013504, 61);
INSERT INTO runtimemetric VALUES (454, 1442458215446, 137166848, 77134496, 517013504, 63);
INSERT INTO runtimemetric VALUES (457, 1442458515446, 134021120, 77313328, 517013504, 66);
INSERT INTO runtimemetric VALUES (458, 1442458568464, 174522368, 95907192, 517013504, 60);
INSERT INTO runtimemetric VALUES (460, 1442458837965, 173211648, 118067600, 517013504, 64);


--
-- TOC entry 2458 (class 0 OID 23137)
-- Dependencies: 211
-- Data for Name: seatusagerecord; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO seatusagerecord VALUES ('admin', 1442458960674);


--
-- TOC entry 2459 (class 0 OID 23142)
-- Dependencies: 212
-- Data for Name: signature; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2461 (class 0 OID 23155)
-- Dependencies: 214
-- Data for Name: signature_signatureentry; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2460 (class 0 OID 23150)
-- Dependencies: 213
-- Data for Name: signatureentry; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2462 (class 0 OID 23162)
-- Dependencies: 215
-- Data for Name: style; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2463 (class 0 OID 23167)
-- Dependencies: 216
-- Data for Name: systemadministrator; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO systemadministrator VALUES (5, 'admin');


--
-- TOC entry 2464 (class 0 OID 23172)
-- Dependencies: 217
-- Data for Name: treemodificationrecord; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2465 (class 0 OID 23177)
-- Dependencies: 218
-- Data for Name: treeview; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO treeview VALUES (7);


--
-- TOC entry 2467 (class 0 OID 23187)
-- Dependencies: 220
-- Data for Name: treeview_treeviewconfiguration; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2466 (class 0 OID 23182)
-- Dependencies: 219
-- Data for Name: treeviewconfiguration; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2468 (class 0 OID 23194)
-- Dependencies: 221
-- Data for Name: uiartifact; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2469 (class 0 OID 23202)
-- Dependencies: 222
-- Data for Name: uiartifactdescriptor; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2470 (class 0 OID 23210)
-- Dependencies: 223
-- Data for Name: updatebundledescriptor; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2471 (class 0 OID 23218)
-- Dependencies: 224
-- Data for Name: viewpermission; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2945 (class 0 OID 0)
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: 
--

SET search_path = pg_catalog;

BEGIN;

SELECT pg_catalog.lo_open('23496', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000000467414d410000afc837058ae90000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000022c4944415438cba593cd6e125114c7ffc3d7f035489595958f9dc4a6a9e9a6ec58d968625cb1d0a44b5ec027c007e81bd4e8129f8052172ea02b4d09e04a83d40d21848405022d0377c673ce30b48918174e7272b8e49edff99fffbd57b36d1bfff3f96e2f1a8dc6fbe57279b4582c7c944159c2344dce1f0a85c2ab8d8056ab75870adec6e3f182ae8731a7225816441b29dcda8ae3ececf425adfe04349bcda75c9c4824b62391082e7ff6c0dd2dcb86655b04b2a108369fcf378f409b4f53a9942caeaeaeb1a0e2afad0b0258eb7872f84cc6d808e019038100c6e3b1d359293cda792cdded557736faaf0a98aca88837f181b0f456f30b6525ddf98b197924934954abd521fd17a4fd3f287fa47c220a1caf6c01316067775fba8b07f60246348c7c3e8f68349af0783c984ea77b83c160afdd6ebff0b8b3390a5832419433fbd0b8c4b59a2293c940d7f5b56c1e991551c387025817ab1be318f4eedb09cca529def47a3d0c8743f4fb7d5067b91facd8c3e6b8b79125cbf1594e7e7def0d425a583ab2743ee6d16884603088582c260031913778bd5e676ec5ae138055d11ab612b83baaeb197fac8c157caed7eb984c26300c03c1904e375013905a19eb6ee6dfab6b7d0328168b079d4ee779a552b9383faf410f68c8a41f2095da463a799fed15f9ac72369bc1eff723140a0980c7d76ebfc652a97448f4638a5df73165b359e47239a4d3e9b517aca2dbeda256ab7dd7fef59ccbe57280a417298e28ee12d8479d7f11e413c5f16faff9acc28c660b410000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23497', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000000467414d410000afc837058ae90000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000022c4944415438cba593cd6e125114c7ffc3d7f035489595958f9dc4a6a9e9a6ec58d968625cb1d0a44b5ec027c007e81bd4e8129f8052172ea02b4d09e04a83d40d21848405022d0377c673ce30b48918174e7272b8e49edff99fffbd57b36d1bfff3f96e2f1a8dc6fbe57279b4582c7c944159c2344dce1f0a85c2ab8d8056ab75870adec6e3f182ae8731a7225816441b29dcda8ae3ececf425adfe04349bcda75c9c4824b62391082e7ff6c0dd2dcb86655b04b2a108369fcf378f409b4f53a9942caeaeaeb1a0e2afad0b0258eb7872f84cc6d808e019038100c6e3b1d359293cda792cdded557736faaf0a98aca88837f181b0f456f30b6525ddf98b197924934954abd521fd17a4fd3f287fa47c220a1caf6c01316067775fba8b07f60246348c7c3e8f68349af0783c984ea77b83c160afdd6ebff0b8b3390a5832419433fbd0b8c4b59a2293c940d7f5b56c1e991551c387025817ab1be318f4eedb09cca529def47a3d0c8743f4fb7d5067b91facd8c3e6b8b79125cbf1594e7e7def0d425a583ab2743ee6d16884603088582c260031913778bd5e676ec5ae138055d11ab612b83baaeb197fac8c157caed7eb984c26300c03c1904e375013905a19eb6ee6dfab6b7d0328168b079d4ee779a552b9383faf410f68c8a41f2095da463a799fed15f9ac72369bc1eff723140a0980c7d76ebfc652a97448f4638a5df73165b359e47239a4d3e9b517aca2dbeda256ab7dd7fef59ccbe57280a417298e28ee12d8479d7f11e413c5f16faff9acc28c660b410000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23498', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000000467414d410000afc837058ae90000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000022c4944415438cba593cf4b545114c73ff7bd37e3537b1218e28ffc15416aab1609818b202188362d02a3459b20085a14848120b609ea1fb05db46d53086e546402db0f0a0986129936e3af99717ebf77ef3d2dc65fd146f06ceee570cee77ccfbde72811e12ce670463b33c0035899be9ef49b0606943ac913aaf9d575a3b33780ea3f590a80e295bb4bda0350e2f4750e7d8829a5406ac92885aeec5c4a275fafcb8117c08d37899868abf067fe25f0c903404b051bd655539398d005a709a502fcf65bb40fbe8d230258100b08ca39d7fa636a68fc181029476c8809e388156cf91751314d612b41cc6f0389c08688684013f48dc611db7df40628f1ad2e139640c222517e9fa0ef117e73ff41c3870aa4a6c03b0fc6f18e01918357dfc2f9fec7478182c5861be8ec1c627288ce217a1f3105fc8b6350154e0044c454b0a5c55ab0c9233a8b8d3288c981ce924a2c91faba4c69738f58cb3cf51daec7c343401511abb1d176ad92c9213a7b70cf904e2c5358d15c1b19a5aef72ae5c519be2fcc7ab3c3b167b58f0f451406d17b88de45a29ddaa977119d617d2ec9e59bf7f15713a88f0f6858fb4c4f5733a2e4b90720a1cde8d26e43548807d8c01189810d402e20a64ab4f305bfb517eebc389ec089365cab7a6a804af5dddafb7b8308c32882ffe6b5dead2b25a755e3d453aae5142520bfef625c36d569b67161a463221e348e75366bcf737e93dfd6fc4cbb26aac8b83aed3a7f1be97a55dcdb7ce21ad56d5cd91098bc3da3dffc0574e632659f8967970000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23499', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000000467414d410000afc837058ae90000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000022c4944415438cba593cf4b545114c73ff7bd37e3537b1218e28ffc15416aab1609818b202188362d02a3459b20085a14848120b609ea1fb05db46d53086e546402db0f0a0986129936e3af99717ebf77ef3d2dc65fd146f06ceee570cee77ccfbde72811e12ce670463b33c0035899be9ef49b0606943ac913aaf9d575a3b33780ea3f590a80e295bb4bda0350e2f4750e7d8829a5406ac92885aeec5c4a275fafcb8117c08d37899868abf067fe25f0c903404b051bd655539398d005a709a502fcf65bb40fbe8d230258100b08ca39d7fa636a68fc181029476c8809e388156cf91751314d612b41cc6f0389c08688684013f48dc611db7df40628f1ad2e139640c222517e9fa0ef117e73ff41c3870aa4a6c03b0fc6f18e01918357dfc2f9fec7478182c5861be8ec1c627288ce217a1f3105fc8b6350154e0044c454b0a5c55ab0c9233a8b8d3288c981ce924a2c91faba4c69738f58cb3cf51daec7c343401511abb1d176ad92c9213a7b70cf904e2c5358d15c1b19a5aef72ae5c519be2fcc7ab3c3b167b58f0f451406d17b88de45a29ddaa977119d617d2ec9e59bf7f15713a88f0f6858fb4c4f5733a2e4b90720a1cde8d26e43548807d8c01189810d402e20a64ab4f305bfb517eebc389ec089365cab7a6a804af5dddafb7b8308c32882ffe6b5dead2b25a755e3d453aae5142520bfef625c36d569b67161a463221e348e75366bcf737e93dfd6fc4cbb26aac8b83aed3a7f1be97a55dcdb7ce21ad56d5cd91098bc3da3dffc0574e632659f8967970000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23500', 131072);
SELECT pg_catalog.lowrite(0, '\x47494638396110001000f70000000000ffffffb9b9bab8c6e3333436eceef2e9eef7b5d1fa768498778190b3b7bda0b8d996aac57c86938bbdf88cbbf594a9c2c5c9ce7290b08ca7c6a4bfde8795a48b98a796a1adcdd3da89bdf281adda84add8759abf82aad39bcbfb99c8f78db7e2779abca2cffc9fc9f488abce99c0e6a2c8f098badeaccbea859cb4b2cfedafb5bb57595b3d3e3fd9dcdf7daad591c1ec91bde7a1c3e399bad890adc8adb6beb8dcfb5f6364676969babcbcedeeeea4a5a581ae9ee4efea95a79ad8e9dcf3f5f3497c357da36e72a55b97ce757aa2618eaa7c9ab7876898459ebe8897a78bb8c2b093c26694be6c82ae5392bc6794bb6c92b86b97bd70b6dc8e95a6849baa8c8ab757a7cc7ea3c57b92ac72697d4dbecea8a9b399a3a79d7f8671a9b48b9f9f69f1f1ee727271e0deceebe1a5b3a45de7d992cabb77dccd8bdad4bbfbf6e0f4e3a4a7996bcbbe96dad5c5a69153fff5d8dbd3c2c4a76d957845ffeccbad9161aea699eae5ddc2bfba87735497784effe1b9b1aba3c4a2778f63347d5d38a9845bb18b6093785b6d37009d734ac09263ab845ba6815aac8760b38d67bd9770ddb287e2b78bdab28bd9b28bebc39c9b836bffd9b4d3c8bd906237855c358d623bd7ac83f1c7a0514438dacdc1845f3fe0af85d2a884ad8c70956037b3835ee4b8957b4f2fb17c57c3c0bec2876b817e7ef3f3f3cfcfcfffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000021f904010000a8002c00000000100010000008de00510954b3c68cc083080f8e2173a60c9b8409c3a0795327101f54a672ec3895d08d9c3670362542554a0c8b160210a6e94367cfa2918f1a21227003619c39a02e31b2932992a342987024cc038853273c922c2932e4675442237a44790172e7d3214290124e2102869496215f3c55a22408e1962b509af438822448975083fed02820108b94284e7e0809c24384a649133e80c0802a0b932756921409f260810e1b1e54c878217049152a4ab8f87000c1400c13286668a8013142060a033694384182030288a856303800634487101212c046e542c1050b155234401510003b');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23501', 131072);
SELECT pg_catalog.lowrite(0, '\x47494638396110001000f70000000000ffffffb9b9bab8c6e3333436eceef2e9eef7b5d1fa768498778190b3b7bda0b8d996aac57c86938bbdf88cbbf594a9c2c5c9ce7290b08ca7c6a4bfde8795a48b98a796a1adcdd3da89bdf281adda84add8759abf82aad39bcbfb99c8f78db7e2779abca2cffc9fc9f488abce99c0e6a2c8f098badeaccbea859cb4b2cfedafb5bb57595b3d3e3fd9dcdf7daad591c1ec91bde7a1c3e399bad890adc8adb6beb8dcfb5f6364676969babcbcedeeeea4a5a581ae9ee4efea95a79ad8e9dcf3f5f3497c357da36e72a55b97ce757aa2618eaa7c9ab7876898459ebe8897a78bb8c2b093c26694be6c82ae5392bc6794bb6c92b86b97bd70b6dc8e95a6849baa8c8ab757a7cc7ea3c57b92ac72697d4dbecea8a9b399a3a79d7f8671a9b48b9f9f69f1f1ee727271e0deceebe1a5b3a45de7d992cabb77dccd8bdad4bbfbf6e0f4e3a4a7996bcbbe96dad5c5a69153fff5d8dbd3c2c4a76d957845ffeccbad9161aea699eae5ddc2bfba87735497784effe1b9b1aba3c4a2778f63347d5d38a9845bb18b6093785b6d37009d734ac09263ab845ba6815aac8760b38d67bd9770ddb287e2b78bdab28bd9b28bebc39c9b836bffd9b4d3c8bd906237855c358d623bd7ac83f1c7a0514438dacdc1845f3fe0af85d2a884ad8c70956037b3835ee4b8957b4f2fb17c57c3c0bec2876b817e7ef3f3f3cfcfcfffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000021f904010000a8002c00000000100010000008de00510954b3c68cc083080f8e2173a60c9b8409c3a0795327101f54a672ec3895d08d9c3670362542554a0c8b160210a6e94367cfa2918f1a21227003619c39a02e31b2932992a342987024cc038853273c922c2932e4675442237a44790172e7d3214290124e2102869496215f3c55a22408e1962b509af438822448975083fed02820108b94284e7e0809c24384a649133e80c0802a0b932756921409f260810e1b1e54c878217049152a4ab8f87000c1400c13286668a8013142060a033694384182030288a856303800634487101212c046e542c1050b155234401510003b');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23502', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23503', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23504', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23505', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23506', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100803000000282d0f5300000300504c5445000000346692366893396a943b75a13e77a23f7ba647749c4b779e4c789e427da7457da64e84ac4291bd4292be4395c14897c24a99c34c9ac4519dc55aa1c87eb3d27fb5d482b9d7c2c2c2c5c5c5c9c9c9cbcbcbccccccdfdfdfdee4e9e2e2e2e3e3e3e6e6e6e7e7e7e4eaefe9e9e9eaeaeaebebebe9ebedecececedededefefefe1ebf1e7eff4eff2f4ecf2f5edf3f6eef4f7f0f0f0f1f1f1f2f2f2f1f2f3f1f3f6f1f4f7f4f4f4f5f5f5f6f6f6f7f7f7f6f7f9f8f8f8f9f9f9fafafafbfbfbfcfcfc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f190fef20000010074524e53ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0053f707250000009f49444154789c55ced7128230104051c0861dbb8620f6821d50820493ffffa9986412cb7ddb33b33b6bb019042a8ff10c0631a1323cf62400922084c26045174238d0e7294ee3db9aa6c9c49390572d731a6dc41a90401ac3da1285bbf55c01ed3bed0b4651b0d7202276c5defe022d0d8ab1867bc6a1d569620599691508391f0f1a1ee5519dbc440aae5da747647f47a97ecccdbf730e39f82ef8047df606fe5d4bc6af9f3e190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23507', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100803000000282d0f5300000300504c5445000000346692366893396a943b75a13e77a23f7ba647749c4b779e4c789e427da7457da64e84ac4291bd4292be4395c14897c24a99c34c9ac4519dc55aa1c87eb3d27fb5d482b9d7c2c2c2c5c5c5c9c9c9cbcbcbccccccdfdfdfdee4e9e2e2e2e3e3e3e6e6e6e7e7e7e4eaefe9e9e9eaeaeaebebebe9ebedecececedededefefefe1ebf1e7eff4eff2f4ecf2f5edf3f6eef4f7f0f0f0f1f1f1f2f2f2f1f2f3f1f3f6f1f4f7f4f4f4f5f5f5f6f6f6f7f7f7f6f7f9f8f8f8f9f9f9fafafafbfbfbfcfcfc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f190fef20000010074524e53ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0053f707250000009f49444154789c55ced7128230104051c0861dbb8620f6821d50820493ffffa9986412cb7ddb33b33b6bb019042a8ff10c0631a1323cf62400922084c26045174238d0e7294ee3db9aa6c9c49390572d731a6dc41a90401ac3da1285bbf55c01ed3bed0b4651b0d7202276c5defe022d0d8ab1867bc6a1d569620599691508391f0f1a1ee5519dbc440aae5da747647f47a97ecccdbf730e39f82ef8047df606fe5d4bc6af9f3e190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23508', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100803000000282d0f5300000300504c54455c7aaa607ead6683b191a5c76c8ab77290ba7694beffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074faca550000000874524e53ffffffffffffff00de83bd590000003849444154789c636047030c4409303030a0093033b0b3b1b1b1b23031e2508162104c00ae0a2200044073e066605141ba19ece82af07a0e0026cd05d18910b2010000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23509', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100803000000282d0f5300000300504c54455c7aaa607ead6683b191a5c76c8ab77290ba7694beffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074faca550000000874524e53ffffffffffffff00de83bd590000003849444154789c636047030c4409303030a0093033b0b3b1b1b1b23031e2508162104c00ae0a2200044073e066605141ba19ece82af07a0e0026cd05d18910b2010000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23510', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002e649444154789c6d92495393591885fd2beeac76eb2ce2802376bb698702c29030890cda5d885184083612d10a210984106244434808432c4151ca469084e1634862049cf910d1722816ead6c71b2c171816e7aeee79ce7ddf735701abfe2ab8b6f6cf7cdbd4c17c9bef609e8df8bc460ee40a9db0b25f685f4e037b8f5bd8935d4f5c8691d8e4ff5e457c112d1dc25c23ccdfd5e65e54e56d28cbda48bbe02155e32145d34a72a90bc57917e21e71596662145a96018479526dbecf3ddf0cd3afde33f5f21d532f16083f9fe7f1b3370467e6084ccbbc7df791c5c545fe883df61b20af71b679e029a76aba4915c929a5ee25294a5c2489e4c4e21612ce3a97c6da9951170d88cf6d94ddc32fa97d10e65e78813bc105ba03f3dc9e7883579aa37d6416f7d06baef73d233eb7211a2096253b7dcf296af163ed7b8af16e109d57a2aa63944acf30173d1295de20d6de19b1544b34406c5a768811fe75f463ea0931fff91b739fbe220bcd7efccaeb0f5fd0b825ea7aa644232b00444db2bd6f9a93f607e8bbc368db25ca5c439434fb39d7344851938fe216097d5758d4591f0d101dcbd6de27e434f450753b4c656788f2f60025ad93a89de3143a244e3bc6a8ba15127fc11c0dd8936d91ebee86c8347471b12388c633c939d73845cd12ffdc1825ffda30f9f6612e7504d89db9420bbbb3ea65435780b42b9d9c774f70c63946e14d8982eb239cb00d91d5e0e7b8d54fb980eecaa88d06c4659a659d7782a48a56f1d49fa9b92235624ab7f848310da0340d8a9d8cb133dd140d109f43d6b6491c2b7552601f2127926af1a3343f42611820a1ba9f245d3feaa65176a85600ec48af932bdca31c56df245b3c57553fb8949aa8efe7e8d587fc7df97f8e68fb386d1b61bbcac89a9823f232c07655ad5ce119e3726710ad3744457b90b2d6009a96498a1d13a2ca71ced8c568962162954656af3bd4b40c10ab34356e4b33119366646baa812d29063627d7b02959cf26859e8d49d56c48ac667da28ef509ba5bbfcc11fd009ea8bb8a49553b2d0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23511', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002e649444154789c6d92495393591885fd2beeac76eb2ce2802376bb698702c29030890cda5d885184083612d10a210984106244434808432c4151ca469084e1634862049cf910d1722816ead6c71b2c171816e7aeee79ce7ddf735701abfe2ab8b6f6cf7cdbd4c17c9bef609e8df8bc460ee40a9db0b25f685f4e037b8f5bd8935d4f5c8691d8e4ff5e457c112d1dc25c23ccdfd5e65e54e56d28cbda48bbe02155e32145d34a72a90bc57917e21e71596662145a96018479526dbecf3ddf0cd3afde33f5f21d532f16083f9fe7f1b3370467e6084ccbbc7df791c5c545fe883df61b20af71b679e029a76aba4915c929a5ee25294a5c2489e4c4e21612ce3a97c6da9951170d88cf6d94ddc32fa97d10e65e78813bc105ba03f3dc9e7883579aa37d6416f7d06baef73d233eb7211a2096253b7dcf296af163ed7b8af16e109d57a2aa63944acf30173d1295de20d6de19b1544b34406c5a768811fe75f463ea0931fff91b739fbe220bcd7efccaeb0f5fd0b825ea7aa644232b00444db2bd6f9a93f607e8bbc368db25ca5c439434fb39d7344851938fe216097d5758d4591f0d101dcbd6de27e434f450753b4c656788f2f60025ad93a89de3143a244e3bc6a8ba15127fc11c0dd8936d91ebee86c8347471b12388c633c939d73845cd12ffdc1825ffda30f9f6612e7504d89db9420bbbb3ea65435780b42b9d9c774f70c63946e14d8982eb239cb00d91d5e0e7b8d54fb980eecaa88d06c4659a659d7782a48a56f1d49fa9b92235624ab7f848310da0340d8a9d8cb133dd140d109f43d6b6491c2b7552601f2127926af1a3343f42611820a1ba9f245d3feaa65176a85600ec48af932bdca31c56df245b3c57553fb8949aa8efe7e8d587fc7df97f8e68fb386d1b61bbcac89a9823f232c07655ad5ce119e3726710ad3744457b90b2d6009a96498a1d13a2ca71ced8c568962162954656af3bd4b40c10ab34356e4b33119366646baa812d29063627d7b02959cf26859e8d49d56c48ac667da28ef509ba5bbfcc11fd009ea8bb8a49553b2d0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23512', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000016b49444154789c95935dab0151148639bfe3a8f31f9cfccf535cf8016e24522e24246a8870319824b7446418637cbf67bf3b5be3e30c67d7d3ecda7b3d7bad352d1f009f589f82a020f4822fc1076314be8b20b8dd6ecdc3e1703a1e8f78863847381cfeb997284188c1ebf51ab66d5f592e97582c16984c2652321e8f1189446e245c7e0a78c1711cec763bf9259665c1344d4ca75329d86c36e023d168544a1e040c2e954ac8e572c8643248a55288c7e388c5620f255d7ae2bf118832ae17b867ddaa94d96c2633198d467f0b48b55a45b95c46b15844369b9599a4d369249349241209cce7736fc13d2a13d6cf9eac562b6f41abd542bd5e87a669a8542ab227854201f97c5ef686a27f65a0b2608309b3f114f47a3de8ba8e76bb8d66b38946a3815aad2661562f05ee57c97ebf7fc053301c0e31180cd0eff7611806badd2e3a9dce15f5ab9f09ce5e7db8e3c418f72c7c8b06d93c782758dcb538806e41809237c659c1d10f30f617ceb2a1320ff1b5ec0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23513', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000016b49444154789c95935dab0151148639bfe3a8f31f9cfccf535cf8016e24522e24246a8870319824b7446418637cbf67bf3b5be3e30c67d7d3ecda7b3d7bad352d1f009f589f82a020f4822fc1076314be8b20b8dd6ecdc3e1703a1e8f78863847381cfeb997284188c1ebf51ab66d5f592e97582c16984c2652321e8f1189446e245c7e0a78c1711cec763bf9259665c1344d4ca75329d86c36e023d168544a1e040c2e954ac8e572c8643248a55288c7e388c5620f255d7ae2bf118832ae17b867ddaa94d96c2633198d467f0b48b55a45b95c46b15844369b9599a4d369249349241209cce7736fc13d2a13d6cf9eac562b6f41abd542bd5e87a669a8542ab227854201f97c5ef686a27f65a0b2608309b3f114f47a3de8ba8e76bb8d66b38946a3815aad2661562f05ee57c97ebf7fc053301c0e31180cd0eff7611806badd2e3a9dce15f5ab9f09ce5e7db8e3c418f72c7c8b06d93c782758dcb538806e41809237c659c1d10f30f617ceb2a1320ff1b5ec0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23514', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100803000000282d0f5300000300504c54457c744f422b35deeef5ed1a46cce4efcde4eff5fafcd0e6f0fdfdfee8f3f7deedf4ac8c40d9ebf3fcfefefdfefed9eaf3f1f7fad5e8f1dabd7c83774dcde4eea28843d4b269ecf6f9d5b269d4e8f2a78a42d9ebf2f9fcfdecf5f9d5e9f1978146b08f3e7f754e83774cfafcfdf2f8fbe0c88f8e7d49877a4c7b735085794b937f47d9eaf2d1e6f08a7b4aedf5fa8c7d4a9782467e754e9b8444deeef4a08643a48842cce3ee917f489d8545d4b268359b587c744ef6fafcedf5f90089cfe3f0f6b4903d005597ffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001de210920000004474524e53ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0071d28f12000000a249444154789c55cad71282301040514c424711c4de7bef3d2111e5ffffc9645167bcb3bb0f67564bd3e45baad224bcb22ac9077af98225c70a6b4906ee30a76a8dc3bb0bd088e3d88035ce00e5d15356547b02b8f136976daa9c1f0076b6fa50c7ee025c1fbf16005be4204788a383d00460ea2dbda6103ea5fe1aa014605c17a2436930cfc0c478258449a93900d847ba4ea28b4e08e903cc18d39806c300fe7b0329f72fcfe667c6140000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23515', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100803000000282d0f5300000300504c54457c744f422b35deeef5ed1a46cce4efcde4eff5fafcd0e6f0fdfdfee8f3f7deedf4ac8c40d9ebf3fcfefefdfefed9eaf3f1f7fad5e8f1dabd7c83774dcde4eea28843d4b269ecf6f9d5b269d4e8f2a78a42d9ebf2f9fcfdecf5f9d5e9f1978146b08f3e7f754e83774cfafcfdf2f8fbe0c88f8e7d49877a4c7b735085794b937f47d9eaf2d1e6f08a7b4aedf5fa8c7d4a9782467e754e9b8444deeef4a08643a48842cce3ee917f489d8545d4b268359b587c744ef6fafcedf5f90089cfe3f0f6b4903d005597ffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001de210920000004474524e53ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0071d28f12000000a249444154789c55cad71282301040514c424711c4de7bef3d2111e5ffffc9645167bcb3bb0f67564bd3e45baad224bcb22ac9077af98225c70a6b4906ee30a76a8dc3bb0bd088e3d88035ce00e5d15356547b02b8f136976daa9c1f0076b6fa50c7ee025c1fbf16005be4204788a383d00460ea2dbda6103ea5fe1aa014605c17a2436930cfc0c478258449a93900d847ba4ea28b4e08e903cc18d39806c300fe7b0329f72fcfe667c6140000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23516', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100803000000282d0f5300000300504c54453caa2b3fad2e3fac2f44b1334ab33b4bb23d4ab73a4db83f51be4163bb5563bb5666be5866be596abe5f71bf6754c14558c5495fcc5162c75461c75564c55660cc5160cd5261ce536ac15c68d15c68d45a6fc6626fda6273c06a74cb677ac37270db6378dd6d7fd67476e16a7ce7707de8707de87182c97785dc7a81ec7582ed7689ee7e85f07a86f17b88f17d94d98a94da8a98de8f8be1818bf18191e78796ec8c96ec8d9af0919ef3959ef495a4d99da5e59da6e99ea6f19eb2eeabb7e0b1b2f6abc3e4c0c5e6c2c7e7c4c7e8c5c8e9c6cdeecad9f0d6daf9d7e9f6e8f0f1f0f5f5f5f5faf4f5faf5fafdf9fbfdfbfefffeffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003af3ac21000000b449444154789c5dcfd71282400c05d06041ec58b08bbd63afd87b5b01f7ff7fc60de8387a1fcf647213b8939fdc81f48af5c168329da9982d01228ba154a6546e286d1695415a10634caa4d65d53121c10ba284b236ae4304af9d0fb299fcd2a0e716828773cca3627ca13f4f1505c16ddbd04bb8afd363a1dc9c214040a337fd7948b23d531320a751ba8f60d7d802c83e762eb36bf406f03bed3cde33f800008722d5bf60499141cd6dc5e34ba4e52e81fff75f544e29933c3c289f0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23517', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100803000000282d0f5300000300504c54453caa2b3fad2e3fac2f44b1334ab33b4bb23d4ab73a4db83f51be4163bb5563bb5666be5866be596abe5f71bf6754c14558c5495fcc5162c75461c75564c55660cc5160cd5261ce536ac15c68d15c68d45a6fc6626fda6273c06a74cb677ac37270db6378dd6d7fd67476e16a7ce7707de8707de87182c97785dc7a81ec7582ed7689ee7e85f07a86f17b88f17d94d98a94da8a98de8f8be1818bf18191e78796ec8c96ec8d9af0919ef3959ef495a4d99da5e59da6e99ea6f19eb2eeabb7e0b1b2f6abc3e4c0c5e6c2c7e7c4c7e8c5c8e9c6cdeecad9f0d6daf9d7e9f6e8f0f1f0f5f5f5f5faf4f5faf5fafdf9fbfdfbfefffeffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003af3ac21000000b449444154789c5dcfd71282400c05d06041ec58b08bbd63afd87b5b01f7ff7fc60de8387a1fcf647213b8939fdc81f48af5c168329da9982d01228ba154a6546e286d1695415a10634caa4d65d53121c10ba284b236ae4304af9d0fb299fcd2a0e716828773cca3627ca13f4f1505c16ddbd04bb8afd363a1dc9c214040a337fd7948b23d531320a751ba8f60d7d802c83e762eb36bf406f03bed3cde33f800008722d5bf60499141cd6dc5e34ba4e52e81fff75f544e29933c3c289f0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23518', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002e649444154789c6d92495393591885fd2beeac76eb2ce2802376bb698702c29030890cda5d885184083612d10a210984106244434808432c4151ca469084e1634862049cf910d1722816ead6c71b2c171816e7aeee79ce7ddf735701abfe2ab8b6f6cf7cdbd4c17c9bef609e8df8bc460ee40a9db0b25f685f4e037b8f5bd8935d4f5c8691d8e4ff5e457c112d1dc25c23ccdfd5e65e54e56d28cbda48bbe02155e32145d34a72a90bc57917e21e71596662145a96018479526dbecf3ddf0cd3afde33f5f21d532f16083f9fe7f1b3370467e6084ccbbc7df791c5c545fe883df61b20af71b679e029a76aba4915c929a5ee25294a5c2489e4c4e21612ce3a97c6da9951170d88cf6d94ddc32fa97d10e65e78813bc105ba03f3dc9e7883579aa37d6416f7d06baef73d233eb7211a2096253b7dcf296af163ed7b8af16e109d57a2aa63944acf30173d1295de20d6de19b1544b34406c5a768811fe75f463ea0931fff91b739fbe220bcd7efccaeb0f5fd0b825ea7aa644232b00444db2bd6f9a93f607e8bbc368db25ca5c439434fb39d7344851938fe216097d5758d4591f0d101dcbd6de27e434f450753b4c656788f2f60025ad93a89de3143a244e3bc6a8ba15127fc11c0dd8936d91ebee86c8347471b12388c633c939d73845cd12ffdc1825ffda30f9f6612e7504d89db9420bbbb3ea65435780b42b9d9c774f70c63946e14d8982eb239cb00d91d5e0e7b8d54fb980eecaa88d06c4659a659d7782a48a56f1d49fa9b92235624ab7f848310da0340d8a9d8cb133dd140d109f43d6b6491c2b7552601f2127926af1a3343f42611820a1ba9f245d3feaa65176a85600ec48af932bdca31c56df245b3c57553fb8949aa8efe7e8d587fc7df97f8e68fb386d1b61bbcac89a9823f232c07655ad5ce119e3726710ad3744457b90b2d6009a96498a1d13a2ca71ced8c568962162954656af3bd4b40c10ab34356e4b33119366646baa812d29063627d7b02959cf26859e8d49d56c48ac667da28ef509ba5bbfcc11fd009ea8bb8a49553b2d0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23519', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002e649444154789c6d92495393591885fd2beeac76eb2ce2802376bb698702c29030890cda5d885184083612d10a210984106244434808432c4151ca469084e1634862049cf910d1722816ead6c71b2c171816e7aeee79ce7ddf735701abfe2ab8b6f6cf7cdbd4c17c9bef609e8df8bc460ee40a9db0b25f685f4e037b8f5bd8935d4f5c8691d8e4ff5e457c112d1dc25c23ccdfd5e65e54e56d28cbda48bbe02155e32145d34a72a90bc57917e21e71596662145a96018479526dbecf3ddf0cd3afde33f5f21d532f16083f9fe7f1b3370467e6084ccbbc7df791c5c545fe883df61b20af71b679e029a76aba4915c929a5ee25294a5c2489e4c4e21612ce3a97c6da9951170d88cf6d94ddc32fa97d10e65e78813bc105ba03f3dc9e7883579aa37d6416f7d06baef73d233eb7211a2096253b7dcf296af163ed7b8af16e109d57a2aa63944acf30173d1295de20d6de19b1544b34406c5a768811fe75f463ea0931fff91b739fbe220bcd7efccaeb0f5fd0b825ea7aa644232b00444db2bd6f9a93f607e8bbc368db25ca5c439434fb39d7344851938fe216097d5758d4591f0d101dcbd6de27e434f450753b4c656788f2f60025ad93a89de3143a244e3bc6a8ba15127fc11c0dd8936d91ebee86c8347471b12388c633c939d73845cd12ffdc1825ffda30f9f6612e7504d89db9420bbbb3ea65435780b42b9d9c774f70c63946e14d8982eb239cb00d91d5e0e7b8d54fb980eecaa88d06c4659a659d7782a48a56f1d49fa9b92235624ab7f848310da0340d8a9d8cb133dd140d109f43d6b6491c2b7552601f2127926af1a3343f42611820a1ba9f245d3feaa65176a85600ec48af932bdca31c56df245b3c57553fb8949aa8efe7e8d587fc7df97f8e68fb386d1b61bbcac89a9823f232c07655ad5ce119e3726710ad3744457b90b2d6009a96498a1d13a2ca71ced8c568962162954656af3bd4b40c10ab34356e4b33119366646baa812d29063627d7b02959cf26859e8d49d56c48ac667da28ef509ba5bbfcc11fd009ea8bb8a49553b2d0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23520', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23521', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23522', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23523', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23524', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23526', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23528', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23529', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23530', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23531', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23532', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23533', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23534', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23535', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23536', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23537', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23538', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23539', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23540', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23541', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23542', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23543', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23544', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23545', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23546', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23547', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23548', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23549', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23550', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23551', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23552', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23553', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23554', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23555', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23556', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23557', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23558', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23559', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23560', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23561', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23562', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23563', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23564', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23565', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23566', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23567', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23568', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23569', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23570', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23571', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23572', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23573', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23574', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23575', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23576', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23577', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23578', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23579', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23580', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23581', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23582', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23583', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23584', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23585', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23586', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23587', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23588', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23589', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23590', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23591', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23592', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23593', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23594', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000028c49444154789ca5936d48144118c77776efee6b1c41451f02c528a217702185a4e2bcd41444b4eb835151c141d887a2e2c8cade508cd25e0cf5340b2521b4947c4b9d84a8508225a288223aacb30e295cd3b3cbddbddb7fcf458ab6f6a90fc332b3f3fb3f33bf99110008ffd3e675cc7a418ed5093cea1760d4089e99f14815f3feb8c610bec2f844054b5c3080606fecce12983de930792eb46ac667fe11acc47a73a0dd95317e4954c72e8a1e4b005576c79a57c07cbc0b787600d3f58b10b9ce12a7ae3277e4e672e0d10e44bb3240b0faad4c9417dc825ec37c46cb3a0ad807a32d1504fb272b995f6b4d01783ea61a9240b0f79f0ee2ed6715e37a6b32ada41004abdabd54aa5e8048d3da38ecb748346a0559af66f29cfd3a49966a0eec84d9970bf4e7c278e0c2d7525119bd203a67e6054f4bf2c7624916e2b2b4db4b41a641b0fac7b412edda06f46d071e66c268df028295d039897f2e9102c1531242654e047c362e4cdf603cd69f070c1521c60b607467c3e82470201fe8cd04bad3e99b05bd3d1dd32d9b68356e0acd41a47923de1da10032cd4916c2950c1315a242c7c4c934d7db36d3c40c0a7041bf9f86911249f97452e2c327a4c087e336bc3d6cc3ab223bb7481c2b179d244b35fbf210ed70fd0ed15ad340b042b0d322f1ef0182f954e37ae81d99f872460a849b92819e2ca835abf0fe98cd7a0a733b64ba7ca26135eddf83f1da9520d35e32ed9fbcb501e872217439012f0fda7d0b0610ecf95e9b40d7389f6e5c36c8b44ab0934cbb83a5cb80ceadd048e29ba38b31b4d761bd89a3e7454fe8aca4861b93315eb706c3c5d26ca5d787ecca64630a46ca9330b8c7a13e2d7458df42bc91e94492d542b238999e7d752fbc76cff3fd0e3eb8dbe17b52e89827f2178ceda08d9423e8fd0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23595', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000028c49444154789ca5936d48144118c77776efee6b1c41451f02c528a217702185a4e2bcd41444b4eb835151c141d887a2e2c8cade508cd25e0cf5340b2521b4947c4b9d84a8508225a288223aacb30e295cd3b3cbddbddb7fcf458ab6f6a90fc332b3f3fb3f33bf99110008ffd3e675cc7a418ed5093cea1760d4089e99f14815f3feb8c610bec2f844054b5c3080606fecce12983de930792eb46ac667fe11acc47a73a0dd95317e4954c72e8a1e4b005576c79a57c07cbc0b787600d3f58b10b9ce12a7ae3277e4e672e0d10e44bb3240b0faad4c9417dc825ec37c46cb3a0ad807a32d1504fb272b995f6b4d01783ea61a9240b0f79f0ee2ed6715e37a6b32ada41004abdabd54aa5e8048d3da38ecb748346a0559af66f29cfd3a49966a0eec84d9970bf4e7c278e0c2d7525119bd203a67e6054f4bf2c7624916e2b2b4db4b41a641b0fac7b412edda06f46d071e66c268df028295d039897f2e9102c1531242654e047c362e4cdf603cd69f070c1521c60b607467c3e82470201fe8cd04bad3e99b05bd3d1dd32d9b68356e0acd41a47923de1da10032cd4916c2950c1315a242c7c4c934d7db36d3c40c0a7041bf9f86911249f97452e2c327a4c087e336bc3d6cc3ab223bb7481c2b179d244b35fbf210ed70fd0ed15ad340b042b0d322f1ef0182f954e37ae81d99f872460a849b92819e2ca835abf0fe98cd7a0a733b64ba7ca26135eddf83f1da9520d35e32ed9fbcb501e872217439012f0fda7d0b0610ecf95e9b40d7389f6e5c36c8b44ab0934cbb83a5cb80ceadd048e29ba38b31b4d761bd89a3e7454fe8aca4861b93315eb706c3c5d26ca5d787ecca64630a46ca9330b8c7a13e2d7458df42bc91e94492d542b238999e7d752fbc76cff3fd0e3eb8dbe17b52e89827f2178ceda08d9423e8fd0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23596', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000028c49444154789ca5936d48144118c77776efee6b1c41451f02c528a217702185a4e2bcd41444b4eb835151c141d887a2e2c8cade508cd25e0cf5340b2521b4947c4b9d84a8508225a288223aacb30e295cd3b3cbddbddb7fcf458ab6f6a90fc332b3f3fb3f33bf99110008ffd3e675cc7a418ed5093cea1760d4089e99f14815f3feb8c610bec2f844054b5c3080606fecce12983de930792eb46ac667fe11acc47a73a0dd95317e4954c72e8a1e4b005576c79a57c07cbc0b787600d3f58b10b9ce12a7ae3277e4e672e0d10e44bb3240b0faad4c9417dc825ec37c46cb3a0ad807a32d1504fb272b995f6b4d01783ea61a9240b0f79f0ee2ed6715e37a6b32ada41004abdabd54aa5e8048d3da38ecb748346a0559af66f29cfd3a49966a0eec84d9970bf4e7c278e0c2d7525119bd203a67e6054f4bf2c7624916e2b2b4db4b41a641b0fac7b412edda06f46d071e66c268df028295d039897f2e9102c1531242654e047c362e4cdf603cd69f070c1521c60b607467c3e82470201fe8cd04bad3e99b05bd3d1dd32d9b68356e0acd41a47923de1da10032cd4916c2950c1315a242c7c4c934d7db36d3c40c0a7041bf9f86911249f97452e2c327a4c087e336bc3d6cc3ab223bb7481c2b179d244b35fbf210ed70fd0ed15ad340b042b0d322f1ef0182f954e37ae81d99f872460a849b92819e2ca835abf0fe98cd7a0a733b64ba7ca26135eddf83f1da9520d35e32ed9fbcb501e872217439012f0fda7d0b0610ecf95e9b40d7389f6e5c36c8b44ab0934cbb83a5cb80ceadd048e29ba38b31b4d761bd89a3e7454fe8aca4861b93315eb706c3c5d26ca5d787ecca64630a46ca9330b8c7a13e2d7458df42bc91e94492d542b238999e7d752fbc76cff3fd0e3eb8dbe17b52e89827f2178ceda08d9423e8fd0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23597', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000028c49444154789ca5936d48144118c77776efee6b1c41451f02c528a217702185a4e2bcd41444b4eb835151c141d887a2e2c8cade508cd25e0cf5340b2521b4947c4b9d84a8508225a288223aacb30e295cd3b3cbddbddb7fcf458ab6f6a90fc332b3f3fb3f33bf99110008ffd3e675cc7a418ed5093cea1760d4089e99f14815f3feb8c610bec2f844054b5c3080606fecce12983de930792eb46ac667fe11acc47a73a0dd95317e4954c72e8a1e4b005576c79a57c07cbc0b787600d3f58b10b9ce12a7ae3277e4e672e0d10e44bb3240b0faad4c9417dc825ec37c46cb3a0ad807a32d1504fb272b995f6b4d01783ea61a9240b0f79f0ee2ed6715e37a6b32ada41004abdabd54aa5e8048d3da38ecb748346a0559af66f29cfd3a49966a0eec84d9970bf4e7c278e0c2d7525119bd203a67e6054f4bf2c7624916e2b2b4db4b41a641b0fac7b412edda06f46d071e66c268df028295d039897f2e9102c1531242654e047c362e4cdf603cd69f070c1521c60b607467c3e82470201fe8cd04bad3e99b05bd3d1dd32d9b68356e0acd41a47923de1da10032cd4916c2950c1315a242c7c4c934d7db36d3c40c0a7041bf9f86911249f97452e2c327a4c087e336bc3d6cc3ab223bb7481c2b179d244b35fbf210ed70fd0ed15ad340b042b0d322f1ef0182f954e37ae81d99f872460a849b92819e2ca835abf0fe98cd7a0a733b64ba7ca26135eddf83f1da9520d35e32ed9fbcb501e872217439012f0fda7d0b0610ecf95e9b40d7389f6e5c36c8b44ab0934cbb83a5cb80ceadd048e29ba38b31b4d761bd89a3e7454fe8aca4861b93315eb706c3c5d26ca5d787ecca64630a46ca9330b8c7a13e2d7458df42bc91e94492d542b238999e7d752fbc76cff3fd0e3eb8dbe17b52e89827f2178ceda08d9423e8fd0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23598', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000028c49444154789ca5936d48144118c77776efee6b1c41451f02c528a217702185a4e2bcd41444b4eb835151c141d887a2e2c8cade508cd25e0cf5340b2521b4947c4b9d84a8508225a288223aacb30e295cd3b3cbddbddb7fcf458ab6f6a90fc332b3f3fb3f33bf99110008ffd3e675cc7a418ed5093cea1760d4089e99f14815f3feb8c610bec2f844054b5c3080606fecce12983de930792eb46ac667fe11acc47a73a0dd95317e4954c72e8a1e4b005576c79a57c07cbc0b787600d3f58b10b9ce12a7ae3277e4e672e0d10e44bb3240b0faad4c9417dc825ec37c46cb3a0ad807a32d1504fb272b995f6b4d01783ea61a9240b0f79f0ee2ed6715e37a6b32ada41004abdabd54aa5e8048d3da38ecb748346a0559af66f29cfd3a49966a0eec84d9970bf4e7c278e0c2d7525119bd203a67e6054f4bf2c7624916e2b2b4db4b41a641b0fac7b412edda06f46d071e66c268df028295d039897f2e9102c1531242654e047c362e4cdf603cd69f070c1521c60b607467c3e82470201fe8cd04bad3e99b05bd3d1dd32d9b68356e0acd41a47923de1da10032cd4916c2950c1315a242c7c4c934d7db36d3c40c0a7041bf9f86911249f97452e2c327a4c087e336bc3d6cc3ab223bb7481c2b179d244b35fbf210ed70fd0ed15ad340b042b0d322f1ef0182f954e37ae81d99f872460a849b92819e2ca835abf0fe98cd7a0a733b64ba7ca26135eddf83f1da9520d35e32ed9fbcb501e872217439012f0fda7d0b0610ecf95e9b40d7389f6e5c36c8b44ab0934cbb83a5cb80ceadd048e29ba38b31b4d761bd89a3e7454fe8aca4861b93315eb706c3c5d26ca5d787ecca64630a46ca9330b8c7a13e2d7458df42bc91e94492d542b238999e7d752fbc76cff3fd0e3eb8dbe17b52e89827f2178ceda08d9423e8fd0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23599', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000028c49444154789ca5936d48144118c77776efee6b1c41451f02c528a217702185a4e2bcd41444b4eb835151c141d887a2e2c8cade508cd25e0cf5340b2521b4947c4b9d84a8508225a288223aacb30e295cd3b3cbddbddb7fcf458ab6f6a90fc332b3f3fb3f33bf99110008ffd3e675cc7a418ed5093cea1760d4089e99f14815f3feb8c610bec2f844054b5c3080606fecce12983de930792eb46ac667fe11acc47a73a0dd95317e4954c72e8a1e4b005576c79a57c07cbc0b787600d3f58b10b9ce12a7ae3277e4e672e0d10e44bb3240b0faad4c9417dc825ec37c46cb3a0ad807a32d1504fb272b995f6b4d01783ea61a9240b0f79f0ee2ed6715e37a6b32ada41004abdabd54aa5e8048d3da38ecb748346a0559af66f29cfd3a49966a0eec84d9970bf4e7c278e0c2d7525119bd203a67e6054f4bf2c7624916e2b2b4db4b41a641b0fac7b412edda06f46d071e66c268df028295d039897f2e9102c1531242654e047c362e4cdf603cd69f070c1521c60b607467c3e82470201fe8cd04bad3e99b05bd3d1dd32d9b68356e0acd41a47923de1da10032cd4916c2950c1315a242c7c4c934d7db36d3c40c0a7041bf9f86911249f97452e2c327a4c087e336bc3d6cc3ab223bb7481c2b179d244b35fbf210ed70fd0ed15ad340b042b0d322f1ef0182f954e37ae81d99f872460a849b92819e2ca835abf0fe98cd7a0a733b64ba7ca26135eddf83f1da9520d35e32ed9fbcb501e872217439012f0fda7d0b0610ecf95e9b40d7389f6e5c36c8b44ab0934cbb83a5cb80ceadd048e29ba38b31b4d761bd89a3e7454fe8aca4861b93315eb706c3c5d26ca5d787ecca64630a46ca9330b8c7a13e2d7458df42bc91e94492d542b238999e7d752fbc76cff3fd0e3eb8dbe17b52e89827f2178ceda08d9423e8fd0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23600', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000028c49444154789ca5936d48144118c77776efee6b1c41451f02c528a217702185a4e2bcd41444b4eb835151c141d887a2e2c8cade508cd25e0cf5340b2521b4947c4b9d84a8508225a288223aacb30e295cd3b3cbddbddb7fcf458ab6f6a90fc332b3f3fb3f33bf99110008ffd3e675cc7a418ed5093cea1760d4089e99f14815f3feb8c610bec2f844054b5c3080606fecce12983de930792eb46ac667fe11acc47a73a0dd95317e4954c72e8a1e4b005576c79a57c07cbc0b787600d3f58b10b9ce12a7ae3277e4e672e0d10e44bb3240b0faad4c9417dc825ec37c46cb3a0ad807a32d1504fb272b995f6b4d01783ea61a9240b0f79f0ee2ed6715e37a6b32ada41004abdabd54aa5e8048d3da38ecb748346a0559af66f29cfd3a49966a0eec84d9970bf4e7c278e0c2d7525119bd203a67e6054f4bf2c7624916e2b2b4db4b41a641b0fac7b412edda06f46d071e66c268df028295d039897f2e9102c1531242654e047c362e4cdf603cd69f070c1521c60b607467c3e82470201fe8cd04bad3e99b05bd3d1dd32d9b68356e0acd41a47923de1da10032cd4916c2950c1315a242c7c4c934d7db36d3c40c0a7041bf9f86911249f97452e2c327a4c087e336bc3d6cc3ab223bb7481c2b179d244b35fbf210ed70fd0ed15ad340b042b0d322f1ef0182f954e37ae81d99f872460a849b92819e2ca835abf0fe98cd7a0a733b64ba7ca26135eddf83f1da9520d35e32ed9fbcb501e872217439012f0fda7d0b0610ecf95e9b40d7389f6e5c36c8b44ab0934cbb83a5cb80ceadd048e29ba38b31b4d761bd89a3e7454fe8aca4861b93315eb706c3c5d26ca5d787ecca64630a46ca9330b8c7a13e2d7458df42bc91e94492d542b238999e7d752fbc76cff3fd0e3eb8dbe17b52e89827f2178ceda08d9423e8fd0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23601', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000028c49444154789ca5936d48144118c77776efee6b1c41451f02c528a217702185a4e2bcd41444b4eb835151c141d887a2e2c8cade508cd25e0cf5340b2521b4947c4b9d84a8508225a288223aacb30e295cd3b3cbddbddb7fcf458ab6f6a90fc332b3f3fb3f33bf99110008ffd3e675cc7a418ed5093cea1760d4089e99f14815f3feb8c610bec2f844054b5c3080606fecce12983de930792eb46ac667fe11acc47a73a0dd95317e4954c72e8a1e4b005576c79a57c07cbc0b787600d3f58b10b9ce12a7ae3277e4e672e0d10e44bb3240b0faad4c9417dc825ec37c46cb3a0ad807a32d1504fb272b995f6b4d01783ea61a9240b0f79f0ee2ed6715e37a6b32ada41004abdabd54aa5e8048d3da38ecb748346a0559af66f29cfd3a49966a0eec84d9970bf4e7c278e0c2d7525119bd203a67e6054f4bf2c7624916e2b2b4db4b41a641b0fac7b412edda06f46d071e66c268df028295d039897f2e9102c1531242654e047c362e4cdf603cd69f070c1521c60b607467c3e82470201fe8cd04bad3e99b05bd3d1dd32d9b68356e0acd41a47923de1da10032cd4916c2950c1315a242c7c4c934d7db36d3c40c0a7041bf9f86911249f97452e2c327a4c087e336bc3d6cc3ab223bb7481c2b179d244b35fbf210ed70fd0ed15ad340b042b0d322f1ef0182f954e37ae81d99f872460a849b92819e2ca835abf0fe98cd7a0a733b64ba7ca26135eddf83f1da9520d35e32ed9fbcb501e872217439012f0fda7d0b0610ecf95e9b40d7389f6e5c36c8b44ab0934cbb83a5cb80ceadd048e29ba38b31b4d761bd89a3e7454fe8aca4861b93315eb706c3c5d26ca5d787ecca64630a46ca9330b8c7a13e2d7458df42bc91e94492d542b238999e7d752fbc76cff3fd0e3eb8dbe17b52e89827f2178ceda08d9423e8fd0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23602', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000028c49444154789ca5936d48144118c77776efee6b1c41451f02c528a217702185a4e2bcd41444b4eb835151c141d887a2e2c8cade508cd25e0cf5340b2521b4947c4b9d84a8508225a288223aacb30e295cd3b3cbddbddb7fcf458ab6f6a90fc332b3f3fb3f33bf99110008ffd3e675cc7a418ed5093cea1760d4089e99f14815f3feb8c610bec2f844054b5c3080606fecce12983de930792eb46ac667fe11acc47a73a0dd95317e4954c72e8a1e4b005576c79a57c07cbc0b787600d3f58b10b9ce12a7ae3277e4e672e0d10e44bb3240b0faad4c9417dc825ec37c46cb3a0ad807a32d1504fb272b995f6b4d01783ea61a9240b0f79f0ee2ed6715e37a6b32ada41004abdabd54aa5e8048d3da38ecb748346a0559af66f29cfd3a49966a0eec84d9970bf4e7c278e0c2d7525119bd203a67e6054f4bf2c7624916e2b2b4db4b41a641b0fac7b412edda06f46d071e66c268df028295d039897f2e9102c1531242654e047c362e4cdf603cd69f070c1521c60b607467c3e82470201fe8cd04bad3e99b05bd3d1dd32d9b68356e0acd41a47923de1da10032cd4916c2950c1315a242c7c4c934d7db36d3c40c0a7041bf9f86911249f97452e2c327a4c087e336bc3d6cc3ab223bb7481c2b179d244b35fbf210ed70fd0ed15ad340b042b0d322f1ef0182f954e37ae81d99f872460a849b92819e2ca835abf0fe98cd7a0a733b64ba7ca26135eddf83f1da9520d35e32ed9fbcb501e872217439012f0fda7d0b0610ecf95e9b40d7389f6e5c36c8b44ab0934cbb83a5cb80ceadd048e29ba38b31b4d761bd89a3e7454fe8aca4861b93315eb706c3c5d26ca5d787ecca64630a46ca9330b8c7a13e2d7458df42bc91e94492d542b238999e7d752fbc76cff3fd0e3eb8dbe17b52e89827f2178ceda08d9423e8fd0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23603', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000028c49444154789ca5936d48144118c77776efee6b1c41451f02c528a217702185a4e2bcd41444b4eb835151c141d887a2e2c8cade508cd25e0cf5340b2521b4947c4b9d84a8508225a288223aacb30e295cd3b3cbddbddb7fcf458ab6f6a90fc332b3f3fb3f33bf99110008ffd3e675cc7a418ed5093cea1760d4089e99f14815f3feb8c610bec2f844054b5c3080606fecce12983de930792eb46ac667fe11acc47a73a0dd95317e4954c72e8a1e4b005576c79a57c07cbc0b787600d3f58b10b9ce12a7ae3277e4e672e0d10e44bb3240b0faad4c9417dc825ec37c46cb3a0ad807a32d1504fb272b995f6b4d01783ea61a9240b0f79f0ee2ed6715e37a6b32ada41004abdabd54aa5e8048d3da38ecb748346a0559af66f29cfd3a49966a0eec84d9970bf4e7c278e0c2d7525119bd203a67e6054f4bf2c7624916e2b2b4db4b41a641b0fac7b412edda06f46d071e66c268df028295d039897f2e9102c1531242654e047c362e4cdf603cd69f070c1521c60b607467c3e82470201fe8cd04bad3e99b05bd3d1dd32d9b68356e0acd41a47923de1da10032cd4916c2950c1315a242c7c4c934d7db36d3c40c0a7041bf9f86911249f97452e2c327a4c087e336bc3d6cc3ab223bb7481c2b179d244b35fbf210ed70fd0ed15ad340b042b0d322f1ef0182f954e37ae81d99f872460a849b92819e2ca835abf0fe98cd7a0a733b64ba7ca26135eddf83f1da9520d35e32ed9fbcb501e872217439012f0fda7d0b0610ecf95e9b40d7389f6e5c36c8b44ab0934cbb83a5cb80ceadd048e29ba38b31b4d761bd89a3e7454fe8aca4861b93315eb706c3c5d26ca5d787ecca64630a46ca9330b8c7a13e2d7458df42bc91e94492d542b238999e7d752fbc76cff3fd0e3eb8dbe17b52e89827f2178ceda08d9423e8fd0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23604', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000028c49444154789ca5936d48144118c77776efee6b1c41451f02c528a217702185a4e2bcd41444b4eb835151c141d887a2e2c8cade508cd25e0cf5340b2521b4947c4b9d84a8508225a288223aacb30e295cd3b3cbddbddb7fcf458ab6f6a90fc332b3f3fb3f33bf99110008ffd3e675cc7a418ed5093cea1760d4089e99f14815f3feb8c610bec2f844054b5c3080606fecce12983de930792eb46ac667fe11acc47a73a0dd95317e4954c72e8a1e4b005576c79a57c07cbc0b787600d3f58b10b9ce12a7ae3277e4e672e0d10e44bb3240b0faad4c9417dc825ec37c46cb3a0ad807a32d1504fb272b995f6b4d01783ea61a9240b0f79f0ee2ed6715e37a6b32ada41004abdabd54aa5e8048d3da38ecb748346a0559af66f29cfd3a49966a0eec84d9970bf4e7c278e0c2d7525119bd203a67e6054f4bf2c7624916e2b2b4db4b41a641b0fac7b412edda06f46d071e66c268df028295d039897f2e9102c1531242654e047c362e4cdf603cd69f070c1521c60b607467c3e82470201fe8cd04bad3e99b05bd3d1dd32d9b68356e0acd41a47923de1da10032cd4916c2950c1315a242c7c4c934d7db36d3c40c0a7041bf9f86911249f97452e2c327a4c087e336bc3d6cc3ab223bb7481c2b179d244b35fbf210ed70fd0ed15ad340b042b0d322f1ef0182f954e37ae81d99f872460a849b92819e2ca835abf0fe98cd7a0a733b64ba7ca26135eddf83f1da9520d35e32ed9fbcb501e872217439012f0fda7d0b0610ecf95e9b40d7389f6e5c36c8b44ab0934cbb83a5cb80ceadd048e29ba38b31b4d761bd89a3e7454fe8aca4861b93315eb706c3c5d26ca5d787ecca64630a46ca9330b8c7a13e2d7458df42bc91e94492d542b238999e7d752fbc76cff3fd0e3eb8dbe17b52e89827f2178ceda08d9423e8fd0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23605', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000028c49444154789ca5936d48144118c77776efee6b1c41451f02c528a217702185a4e2bcd41444b4eb835151c141d887a2e2c8cade508cd25e0cf5340b2521b4947c4b9d84a8508225a288223aacb30e295cd3b3cbddbddb7fcf458ab6f6a90fc332b3f3fb3f33bf99110008ffd3e675cc7a418ed5093cea1760d4089e99f14815f3feb8c610bec2f844054b5c3080606fecce12983de930792eb46ac667fe11acc47a73a0dd95317e4954c72e8a1e4b005576c79a57c07cbc0b787600d3f58b10b9ce12a7ae3277e4e672e0d10e44bb3240b0faad4c9417dc825ec37c46cb3a0ad807a32d1504fb272b995f6b4d01783ea61a9240b0f79f0ee2ed6715e37a6b32ada41004abdabd54aa5e8048d3da38ecb748346a0559af66f29cfd3a49966a0eec84d9970bf4e7c278e0c2d7525119bd203a67e6054f4bf2c7624916e2b2b4db4b41a641b0fac7b412edda06f46d071e66c268df028295d039897f2e9102c1531242654e047c362e4cdf603cd69f070c1521c60b607467c3e82470201fe8cd04bad3e99b05bd3d1dd32d9b68356e0acd41a47923de1da10032cd4916c2950c1315a242c7c4c934d7db36d3c40c0a7041bf9f86911249f97452e2c327a4c087e336bc3d6cc3ab223bb7481c2b179d244b35fbf210ed70fd0ed15ad340b042b0d322f1ef0182f954e37ae81d99f872460a849b92819e2ca835abf0fe98cd7a0a733b64ba7ca26135eddf83f1da9520d35e32ed9fbcb501e872217439012f0fda7d0b0610ecf95e9b40d7389f6e5c36c8b44ab0934cbb83a5cb80ceadd048e29ba38b31b4d761bd89a3e7454fe8aca4861b93315eb706c3c5d26ca5d787ecca64630a46ca9330b8c7a13e2d7458df42bc91e94492d542b238999e7d752fbc76cff3fd0e3eb8dbe17b52e89827f2178ceda08d9423e8fd0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23606', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23607', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23608', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000028c49444154789ca5936d48144118c77776efee6b1c41451f02c528a217702185a4e2bcd41444b4eb835151c141d887a2e2c8cade508cd25e0cf5340b2521b4947c4b9d84a8508225a288223aacb30e295cd3b3cbddbddb7fcf458ab6f6a90fc332b3f3fb3f33bf99110008ffd3e675cc7a418ed5093cea1760d4089e99f14815f3feb8c610bec2f844054b5c3080606fecce12983de930792eb46ac667fe11acc47a73a0dd95317e4954c72e8a1e4b005576c79a57c07cbc0b787600d3f58b10b9ce12a7ae3277e4e672e0d10e44bb3240b0faad4c9417dc825ec37c46cb3a0ad807a32d1504fb272b995f6b4d01783ea61a9240b0f79f0ee2ed6715e37a6b32ada41004abdabd54aa5e8048d3da38ecb748346a0559af66f29cfd3a49966a0eec84d9970bf4e7c278e0c2d7525119bd203a67e6054f4bf2c7624916e2b2b4db4b41a641b0fac7b412edda06f46d071e66c268df028295d039897f2e9102c1531242654e047c362e4cdf603cd69f070c1521c60b607467c3e82470201fe8cd04bad3e99b05bd3d1dd32d9b68356e0acd41a47923de1da10032cd4916c2950c1315a242c7c4c934d7db36d3c40c0a7041bf9f86911249f97452e2c327a4c087e336bc3d6cc3ab223bb7481c2b179d244b35fbf210ed70fd0ed15ad340b042b0d322f1ef0182f954e37ae81d99f872460a849b92819e2ca835abf0fe98cd7a0a733b64ba7ca26135eddf83f1da9520d35e32ed9fbcb501e872217439012f0fda7d0b0610ecf95e9b40d7389f6e5c36c8b44ab0934cbb83a5cb80ceadd048e29ba38b31b4d761bd89a3e7454fe8aca4861b93315eb706c3c5d26ca5d787ecca64630a46ca9330b8c7a13e2d7458df42bc91e94492d542b238999e7d752fbc76cff3fd0e3eb8dbe17b52e89827f2178ceda08d9423e8fd0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23609', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000028c49444154789ca5936d48144118c77776efee6b1c41451f02c528a217702185a4e2bcd41444b4eb835151c141d887a2e2c8cade508cd25e0cf5340b2521b4947c4b9d84a8508225a288223aacb30e295cd3b3cbddbddb7fcf458ab6f6a90fc332b3f3fb3f33bf99110008ffd3e675cc7a418ed5093cea1760d4089e99f14815f3feb8c610bec2f844054b5c3080606fecce12983de930792eb46ac667fe11acc47a73a0dd95317e4954c72e8a1e4b005576c79a57c07cbc0b787600d3f58b10b9ce12a7ae3277e4e672e0d10e44bb3240b0faad4c9417dc825ec37c46cb3a0ad807a32d1504fb272b995f6b4d01783ea61a9240b0f79f0ee2ed6715e37a6b32ada41004abdabd54aa5e8048d3da38ecb748346a0559af66f29cfd3a49966a0eec84d9970bf4e7c278e0c2d7525119bd203a67e6054f4bf2c7624916e2b2b4db4b41a641b0fac7b412edda06f46d071e66c268df028295d039897f2e9102c1531242654e047c362e4cdf603cd69f070c1521c60b607467c3e82470201fe8cd04bad3e99b05bd3d1dd32d9b68356e0acd41a47923de1da10032cd4916c2950c1315a242c7c4c934d7db36d3c40c0a7041bf9f86911249f97452e2c327a4c087e336bc3d6cc3ab223bb7481c2b179d244b35fbf210ed70fd0ed15ad340b042b0d322f1ef0182f954e37ae81d99f872460a849b92819e2ca835abf0fe98cd7a0a733b64ba7ca26135eddf83f1da9520d35e32ed9fbcb501e872217439012f0fda7d0b0610ecf95e9b40d7389f6e5c36c8b44ab0934cbb83a5cb80ceadd048e29ba38b31b4d761bd89a3e7454fe8aca4861b93315eb706c3c5d26ca5d787ecca64630a46ca9330b8c7a13e2d7458df42bc91e94492d542b238999e7d752fbc76cff3fd0e3eb8dbe17b52e89827f2178ceda08d9423e8fd0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23610', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23611', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000030d49444154789c5593594f13511886b9d2bf60fc015e882246634c305171170d21d16834225b1177bd0144489048b40113174c44638c311a6354140c089422b5db802874191090961629d28576ba9c99ce4c5f4f476cf5e2992f2799f739df99ef4c06808c9d750345079bccbdf9cde6002546210ab7929521f94d2692a736d8722af577b654742c4b66fea23cf635ea3ffb38e20b4478c91fe1e10fa7f1714908c6e638d4b5bba06a998ce654742cff4f9077d3b0c0c5e292c919073323827189303b45181c020626797c6423e0454037d489f1e74731f9be11238f7763f47e66a12238a036c6425101c36e095fdd22ad2286148900dd148f1e368a90bb0d1e6d1582960f40f827162daf616ade3bffa703b5912405dfa8606456c4b75949910dcec4a1ff2180196e43c07e0d82bb1d9e4f4d8859df4272ea617d524e5282604480754e828d62f5c818552422466c5a046c7590637ac47e9c837ff03cc69e95c2dc5a9618bc5bb04a11ecbf69248b5430e64980a5613bc536472bdb8780f50a64624274ea2488eb3838b606cea705286a7c23a4a740057e2a189f4f288c51be18dfc13354b5142e0499398690ed2a265bf3f0cb61c1ae06234909f65c37125f58009b0a7780edaea46deb401ca5e05d2710a49d4c3cd807b3dd85052e8edcfa7f04bb1a0cc44be7cdd223f477be80bdb306a35db731cb1c46d4711cfe916a7c7f5480617646193347446cad35a405b9f506321fe261ff99c02bf50e807362fce121686b56c24077d535efc5b065020cbd1b662a20711939950369c1b65a3d990b121cfec0a3a13c0b82a9050273074ce376bca85805d54b0b0ada09f297880a12365dec4f0bb6540f10b79fe0824ec691dc15b8519c098dfa003a9e5cc243c68dfb2cd06207eed900955644841e61fda9deb460f3e5fea8c31b4d54f4cb38d527292f9569258512ba2eed1351ac1151945c6b247aad65796d59773825d8705a33bd10e239878fc8d3de18a61762985ac21b8e2b24bf7c9848a0ff9b2c2712c1d5455df69460e399deb3d9aa1ecdfaf25e7f76790f49a1ea21eb2859aaee3f94292cae29e9eacb2ae92a4d667f03d6cb1f5ca09497190000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23612', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23613', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23614', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100802000000909168360000028849444154789c4592ed4b536114c09fb94f214928e29fa4f66d5ffa101442ea669618bd88085a441ab36256ce855a4145a508b23e05a2891939b7ebe6e6dcdddceebcaf9b9bd3ed6ef7ee4eb7d3b9db30f85d380ff7fcceb9e79e8764017e52dccb2f6b83af16faaddffb74166f4f2e6060b67e7be8589d72fad31550012aa03f2403f07cdec9142056045a055a81035507e3900aae24d896b647edcbe9326855871c01dc9ffc2416c11dcb6d1d6a081557b6a3f26624b71a48e3db95e08975c93364ff715c7588047077e2a3a8c22e9bf3b20a428cada4a19518db3602092cbc23947e0b30e5f4d93eafe4501001ee8c7f4021c89e06f92c31b6a043c5f3ee480663fae89ccd83a441340bddc36f531782a0002dc861314f1a9afdbce263f33bcc090aeb7e69cd27ac53314c308fcd4a35a1ffd97b3c872595167548435395664f2cb7199137e8ec6630c1a3f064eebfc01720922886a4d281a431e2293134ee7359efa1bc15d3fe4494bfe10cab42efd87c5de87b5a15a4825ede70859046422e11e365626ca6d8922ba6622b9ca47b6c4eac09bd8f67b93cd0a28242585462bcde21cc67829c4c714577bc88ad70eeae917775e1d6e86c3c0741510908da1eaf467899189af6391947f71c6aae3876c81c9dc38d47d3f54fea1a7130d90b41238696108fbfabc5c72a6e168502c59c24cfe0da804daa2deee6903d7a0cfb7c01cbe3cad041021c6eb00d3b6c332ac56413253059acc9dad5b87e6f2a94863da1e217ca3ea1e21540872f53ec998badb898730fa326cb60ea19c764fdf2750f3b0e6408a4613705de345029d849015da8132f01578234a60d4d6332390558fc157df0c2691a70745aec1d9619a4dd32dd617ed36eb675f6bebeda6333f5db0627be2eafe3a4f00f45e24494e1a849120000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23615', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100802000000909168360000028849444154789c4592ed4b536114c09fb94f214928e29fa4f66d5ffa101442ea669618bd88085a441ab36256ce855a4145a508b23e05a2891939b7ebe6e6dcdddceebcaf9b9bd3ed6ef7ee4eb7d3b9db30f85d380ff7fcceb9e79e8764017e52dccb2f6b83af16faaddffb74166f4f2e6060b67e7be8589d72fad31550012aa03f2403f07cdec9142056045a055a81035507e3900aae24d896b647edcbe9326855871c01dc9ffc2416c11dcb6d1d6a081557b6a3f26624b71a48e3db95e08975c93364ff715c7588047077e2a3a8c22e9bf3b20a428cada4a19518db3602092cbc23947e0b30e5f4d93eafe4501001ee8c7f4021c89e06f92c31b6a043c5f3ee480663fae89ccd83a441340bddc36f531782a0002dc861314f1a9afdbce263f33bcc090aeb7e69cd27ac53314c308fcd4a35a1ffd97b3c872595167548435395664f2cb7199137e8ec6630c1a3f064eebfc01720922886a4d281a431e2293134ee7359efa1bc15d3fe4494bfe10cab42efd87c5de87b5a15a4825ede70859046422e11e365626ca6d8922ba6622b9ca47b6c4eac09bd8f67b93cd0a28242585462bcde21cc67829c4c714577bc88ad70eeae917775e1d6e86c3c0741510908da1eaf467899189af6391947f71c6aae3876c81c9dc38d47d3f54fea1a7130d90b41238696108fbfabc5c72a6e168502c59c24cfe0da804daa2deee6903d7a0cfb7c01cbe3cad041021c6eb00d3b6c332ac56413253059acc9dad5b87e6f2a94863da1e217ca3ea1e21540872f53ec998badb898730fa326cb60ea19c764fdf2750f3b0e6408a4613705de345029d849015da8132f01578234a60d4d6332390558fc157df0c2691a70745aec1d9619a4dd32dd617ed36eb675f6bebeda6333f5db0627be2eafe3a4f00f45e24494e1a849120000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23616', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23617', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23618', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000025449444154789ca5935b6892611cc6475044b9d52a22aacb169b948c41e928170be7611e113f4d9d87fc8c3212695b73da14ebb35117cd8bc1940eeb30dd0183825d24d18dd071b8d5aadb18ddc540bbdb8cc2a7f77b2f84c17045170fef81e7f9f17f7879eb00d4fd8fd6bdbce030df0e9fda8d48473d064e0ae06bdf05d6acbbff57001feb8a45b4cd183b7b1437553b30ea3e82be0e01dcd203609dd6910d0121a318a3b6260c90d00dd321126e409c390c5fc75e185af75436049c3fde88cb6a21c6af6830c29e80fd5823ae1a9b616d3f08a66d2746face6caf091854ee5b5d7c7e17c5f713f8fefa01e61ff5e3ebb36b58981d4354b3ffe7a78717b7d404241cadef4a7393582e64b1f2718a689aee4bf353b8e311156a566893fbb64aa5d2ec78a013e5c23dac7e794ab5f22183c9814e88c5e227a2d3e7b6ad0b502a950d2a958a53abd548a552e8e9e9c1c41043a5d168e89d4ea7e3f771e215ac0190e0a66030788b37f2a6643209abd58a6c368b4c260393c984e1e161783c1e747777576432d920816cae0248f012cbb248a7d330180c301a8db0dbedc8e572c8e7f3b0582cd06ab5b0d96c8846a370bbdd15b95cde57052c0c35ff5e9e1d44381c06c771d4e470384026a3e3330c03afd70b97cb05bfdf8f622e8ab7fd2de52a6031d25229bdb84e0d8944828248256ae62bf5f6f6221008201e8f53d88f971ce682c24a15f0f9b13f341f6afae5743aa1d7eba991572c16a3fdf9a9f833e98faeae2e2c44456592e1d6bcc2d2b4af9e746c22cff88af45d22e397150a0578f121b2162512c91bb3d92cfc36e3abaff91bff457f0006cb7ee97738589e0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23619', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000025449444154789ca5935b6892611cc6475044b9d52a22aacb169b948c41e928170be7611e113f4d9d87fc8c3212695b73da14ebb35117cd8bc1940eeb30dd0183825d24d18dd071b8d5aadb18ddc540bbdb8cc2a7f77b2f84c17045170fef81e7f9f17f7879eb00d4fd8fd6bdbce030df0e9fda8d48473d064e0ae06bdf05d6acbbff57001feb8a45b4cd183b7b1437553b30ea3e82be0e01dcd203609dd6910d0121a318a3b6260c90d00dd321126e409c390c5fc75e185af75436049c3fde88cb6a21c6af6830c29e80fd5823ae1a9b616d3f08a66d2746face6caf091854ee5b5d7c7e17c5f713f8fefa01e61ff5e3ebb36b58981d4354b3ffe7a78717b7d404241cadef4a7393582e64b1f2718a689aee4bf353b8e311156a566893fbb64aa5d2ec78a013e5c23dac7e794ab5f22183c9814e88c5e227a2d3e7b6ad0b502a950d2a958a53abd548a552e8e9e9c1c41043a5d168e89d4ea7e3f771e215ac0190e0a66030788b37f2a6643209abd58a6c368b4c260393c984e1e161783c1e747777576432d920816cae0248f012cbb248a7d330180c301a8db0dbedc8e572c8e7f3b0582cd06ab5b0d96c8846a370bbdd15b95cde57052c0c35ff5e9e1d44381c06c771d4e470384026a3e3330c03afd70b97cb05bfdf8f622e8ab7fd2de52a6031d25229bdb84e0d8944828248256ae62bf5f6f6221008201e8f53d88f971ce682c24a15f0f9b13f341f6afae5743aa1d7eba991572c16a3fdf9a9f833e98faeae2e2c44456592e1d6bcc2d2b4af9e746c22cff88af45d22e397150a0578f121b2162512c91bb3d92cfc36e3abaff91bff457f0006cb7ee97738589e0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23620', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23621', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23622', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23623', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23624', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23625', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23626', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23627', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23628', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23629', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23630', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23631', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23632', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23633', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23634', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23635', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23636', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23637', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23638', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23639', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23640', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23641', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23642', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23643', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23644', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23645', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23646', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23647', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23648', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23649', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23650', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23651', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23652', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23653', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23654', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23655', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23656', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23657', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23658', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23659', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23660', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23661', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23662', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23663', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23664', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23665', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23666', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23667', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23668', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23669', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23670', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23671', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23672', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23673', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23674', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23675', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23676', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23677', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23678', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23679', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23680', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23681', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23682', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23683', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23684', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23685', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23686', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23687', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23688', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23689', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23690', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23691', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23692', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23693', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23694', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23695', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23696', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23697', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000024b49444154789c7d93cd8b526114c66fe8fc012d06a2a81888a0457b4106a26996b3acd9b4aa590c449ba0a6da4404d24cb4099aa4afe5147ea2a8a8dc0b8a8a5fe9f82d8a99e368ea18b5b0b9965f4fefb9324ee28c170e17ce7bceef79ce7bcfe5d2e93452a914128904e2f13862b118a2d128229108c2e1f02c006e5a70c96412fd7e7f222a958a0409040253211c295343b95c96944ba5d2084239e6025eaff758084796a998d428110a8522ad560bdd6e57ca13d0eff7c3e5721d09e148f5a09035ff6596cbed761bf55617c2eed049b15884c7e381200813108e940f2cf77a3d50f3de7e1f1bdb033cfb02f0e5e159a150201770381c63108ecd28369b4da9a8d3e9a0c694d7a3036ca680b769e0c5f621249fcf930b58add611840b0683f36c46b1d1684845c96657525633c0c72cf02e330ec9e572e4022693498248149fcfa764338af57a5d2acafce8e279a40f75fa10b21e059c3b4348369b251730180cb3a359dc6eb792cd28d66ab509c87b06f8a47e0de7cd4be0176620dc3803fbd35bd0e974e7c76e94cda7e4795eac56ab23888a41b6de6c22767f1e6deb4b0c3276ec7fbe87f09dcb3de782fceec477753a9d4abbdd2ed2261224cd2096e50b1059335e2d016b2701d51c9a1b57e0b8262b1eb95d369b4d69b15844da448290ed41c480ff9f5f4f4e81bf2a1f1cbbe366b359c16e5aa405e3af9fc6ef0fb701d6f4e701879f2c765665702cca2a53ff34a3d1a8d0ebf5a2a05a4570e562effbda1cf61ecde0ebca09084bf29e7d51f6782a8042abd52a341acd39eff2d9874cf11bd966ef5d6aa6f37fcf791f7ef0b086b90000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23698', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23699', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23700', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23701', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23702', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23703', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23704', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23705', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23706', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23707', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23708', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23709', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23710', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23711', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23712', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23713', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000023149444154789c7d92cf8b525114c7df3f318b3645bb362d5a2548ad2382162d5a66d114d4a216b3aa4554d0686319c194d4d03a745434157d3d4151f1573afe784f5144cc34355b253dc9a7f39d7b9ee9643a3e385ceebde77cbedf73dfe1244982288ac8e7f3c8e572c866b3c8643248a7d348a5526b00b855c1150a058cc7e38568369b2a241e8faf8470a44c058d464355aed7eb33089d3117884422474238b24cc9a44607c96432ddeff7a1288a7a4ec0582c866030b814c291ea349115ff61961b83c1009dbe82c0b789935aad8670388c4020b000e148796a79341a818a7ffc1ee3f9de3e9e7e0184c6e4ae5aad920bf8fdfe3908c77a947bbd9e9a341c0ed166ca86cc3ede88c03b09d8da3b84542a1572018fc73383708944e21ceb51ee76bb6a52a1a7a8ca6606f85002de17e721e572995cc0e974aa1095128d46b5ac47b9d3e9a849c59f0af4e931ccd221c49001f8af1348a9542217b0dbed6bb35e42a19096f528b7dbed05c80e033cfa64c7fdb73adc7a79193afd053c316f607777f7c4dc8bb2feb48220c8ad566b0679c6200f1c1ff1d87a1d6e711bd9ef3c4c9fefe0aae934cede3d665cf8af3ccf6b7d3e9f4c9348108941ae192ec259780567f135cd0a8cc23a4cc26d020c964e97d7ebd5badd6e99269120971e9e8157dcc1bf9f2bbf4d80a367dce57269d84bcb3460e7ef9dc4167f039bbc4e2ddef4eb563b9886c3e1d0d86c3679c3b48e2bc65378c1df549569a5fdd237f83fac56abc662b11c67c97a16bfc8f6df554ff707517a20cde7df8ac10000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23714', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23715', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23716', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100802000000909168360000028849444154789c4592ed4b536114c09fb94f214928e29fa4f66d5ffa101442ea669618bd88085a441ab36256ce855a4145a508b23e05a2891939b7ebe6e6dcdddceebcaf9b9bd3ed6ef7ee4eb7d3b9db30f85d380ff7fcceb9e79e8764017e52dccb2f6b83af16faaddffb74166f4f2e6060b67e7be8589d72fad31550012aa03f2403f07cdec9142056045a055a81035507e3900aae24d896b647edcbe9326855871c01dc9ffc2416c11dcb6d1d6a081557b6a3f26624b71a48e3db95e08975c93364ff715c7588047077e2a3a8c22e9bf3b20a428cada4a19518db3602092cbc23947e0b30e5f4d93eafe4501001ee8c7f4021c89e06f92c31b6a043c5f3ee480663fae89ccd83a441340bddc36f531782a0002dc861314f1a9afdbce263f33bcc090aeb7e69cd27ac53314c308fcd4a35a1ffd97b3c872595167548435395664f2cb7199137e8ec6630c1a3f064eebfc01720922886a4d281a431e2293134ee7359efa1bc15d3fe4494bfe10cab42efd87c5de87b5a15a4825ede70859046422e11e365626ca6d8922ba6622b9ca47b6c4eac09bd8f67b93cd0a28242585462bcde21cc67829c4c714577bc88ad70eeae917775e1d6e86c3c0741510908da1eaf467899189af6391947f71c6aae3876c81c9dc38d47d3f54fea1a7130d90b41238696108fbfabc5c72a6e168502c59c24cfe0da804daa2deee6903d7a0cfb7c01cbe3cad041021c6eb00d3b6c332ac56413253059acc9dad5b87e6f2a94863da1e217ca3ea1e21540872f53ec998badb898730fa326cb60ea19c764fdf2750f3b0e6408a4613705de345029d849015da8132f01578234a60d4d6332390558fc157df0c2691a70745aec1d9619a4dd32dd617ed36eb675f6bebeda6333f5db0627be2eafe3a4f00f45e24494e1a849120000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23717', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100802000000909168360000028849444154789c4592ed4b536114c09fb94f214928e29fa4f66d5ffa101442ea669618bd88085a441ab36256ce855a4145a508b23e05a2891939b7ebe6e6dcdddceebcaf9b9bd3ed6ef7ee4eb7d3b9db30f85d380ff7fcceb9e79e8764017e52dccb2f6b83af16faaddffb74166f4f2e6060b67e7be8589d72fad31550012aa03f2403f07cdec9142056045a055a81035507e3900aae24d896b647edcbe9326855871c01dc9ffc2416c11dcb6d1d6a081557b6a3f26624b71a48e3db95e08975c93364ff715c7588047077e2a3a8c22e9bf3b20a428cada4a19518db3602092cbc23947e0b30e5f4d93eafe4501001ee8c7f4021c89e06f92c31b6a043c5f3ee480663fae89ccd83a441340bddc36f531782a0002dc861314f1a9afdbce263f33bcc090aeb7e69cd27ac53314c308fcd4a35a1ffd97b3c872595167548435395664f2cb7199137e8ec6630c1a3f064eebfc01720922886a4d281a431e2293134ee7359efa1bc15d3fe4494bfe10cab42efd87c5de87b5a15a4825ede70859046422e11e365626ca6d8922ba6622b9ca47b6c4eac09bd8f67b93cd0a28242585462bcde21cc67829c4c714577bc88ad70eeae917775e1d6e86c3c0741510908da1eaf467899189af6391947f71c6aae3876c81c9dc38d47d3f54fea1a7130d90b41238696108fbfabc5c72a6e168502c59c24cfe0da804daa2deee6903d7a0cfb7c01cbe3cad041021c6eb00d3b6c332ac56413253059acc9dad5b87e6f2a94863da1e217ca3ea1e21540872f53ec998badb898730fa326cb60ea19c764fdf2750f3b0e6408a4613705de345029d849015da8132f01578234a60d4d6332390558fc157df0c2691a70745aec1d9619a4dd32dd617ed36eb675f6bebeda6333f5db0627be2eafe3a4f00f45e24494e1a849120000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23718', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23719', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23720', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000025449444154789ca5935b6892611cc6475044b9d52a22aacb169b948c41e928170be7611e113f4d9d87fc8c3212695b73da14ebb35117cd8bc1940eeb30dd0183825d24d18dd071b8d5aadb18ddc540bbdb8cc2a7f77b2f84c17045170fef81e7f9f17f7879eb00d4fd8fd6bdbce030df0e9fda8d48473d064e0ae06bdf05d6acbbff57001feb8a45b4cd183b7b1437553b30ea3e82be0e01dcd203609dd6910d0121a318a3b6260c90d00dd321126e409c390c5fc75e185af75436049c3fde88cb6a21c6af6830c29e80fd5823ae1a9b616d3f08a66d2746face6caf091854ee5b5d7c7e17c5f713f8fefa01e61ff5e3ebb36b58981d4354b3ffe7a78717b7d404241cadef4a7393582e64b1f2718a689aee4bf353b8e311156a566893fbb64aa5d2ec78a013e5c23dac7e794ab5f22183c9814e88c5e227a2d3e7b6ad0b502a950d2a958a53abd548a552e8e9e9c1c41043a5d168e89d4ea7e3f771e215ac0190e0a66030788b37f2a6643209abd58a6c368b4c260393c984e1e161783c1e747777576432d920816cae0248f012cbb248a7d330180c301a8db0dbedc8e572c8e7f3b0582cd06ab5b0d96c8846a370bbdd15b95cde57052c0c35ff5e9e1d44381c06c771d4e470384026a3e3330c03afd70b97cb05bfdf8f622e8ab7fd2de52a6031d25229bdb84e0d8944828248256ae62bf5f6f6221008201e8f53d88f971ce682c24a15f0f9b13f341f6afae5743aa1d7eba991572c16a3fdf9a9f833e98faeae2e2c44456592e1d6bcc2d2b4af9e746c22cff88af45d22e397150a0578f121b2162512c91bb3d92cfc36e3abaff91bff457f0006cb7ee97738589e0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23721', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000025449444154789ca5935b6892611cc6475044b9d52a22aacb169b948c41e928170be7611e113f4d9d87fc8c3212695b73da14ebb35117cd8bc1940eeb30dd0183825d24d18dd071b8d5aadb18ddc540bbdb8cc2a7f77b2f84c17045170fef81e7f9f17f7879eb00d4fd8fd6bdbce030df0e9fda8d48473d064e0ae06bdf05d6acbbff57001feb8a45b4cd183b7b1437553b30ea3e82be0e01dcd203609dd6910d0121a318a3b6260c90d00dd321126e409c390c5fc75e185af75436049c3fde88cb6a21c6af6830c29e80fd5823ae1a9b616d3f08a66d2746face6caf091854ee5b5d7c7e17c5f713f8fefa01e61ff5e3ebb36b58981d4354b3ffe7a78717b7d404241cadef4a7393582e64b1f2718a689aee4bf353b8e311156a566893fbb64aa5d2ec78a013e5c23dac7e794ab5f22183c9814e88c5e227a2d3e7b6ad0b502a950d2a958a53abd548a552e8e9e9c1c41043a5d168e89d4ea7e3f771e215ac0190e0a66030788b37f2a6643209abd58a6c368b4c260393c984e1e161783c1e747777576432d920816cae0248f012cbb248a7d330180c301a8db0dbedc8e572c8e7f3b0582cd06ab5b0d96c8846a370bbdd15b95cde57052c0c35ff5e9e1d44381c06c771d4e470384026a3e3330c03afd70b97cb05bfdf8f622e8ab7fd2de52a6031d25229bdb84e0d8944828248256ae62bf5f6f6221008201e8f53d88f971ce682c24a15f0f9b13f341f6afae5743aa1d7eba991572c16a3fdf9a9f833e98faeae2e2c44456592e1d6bcc2d2b4af9e746c22cff88af45d22e397150a0578f121b2162512c91bb3d92cfc36e3abaff91bff457f0006cb7ee97738589e0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23722', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000025449444154789ca5935b6892611cc6475044b9d52a22aacb169b948c41e928170be7611e113f4d9d87fc8c3212695b73da14ebb35117cd8bc1940eeb30dd0183825d24d18dd071b8d5aadb18ddc540bbdb8cc2a7f77b2f84c17045170fef81e7f9f17f7879eb00d4fd8fd6bdbce030df0e9fda8d48473d064e0ae06bdf05d6acbbff57001feb8a45b4cd183b7b1437553b30ea3e82be0e01dcd203609dd6910d0121a318a3b6260c90d00dd321126e409c390c5fc75e185af75436049c3fde88cb6a21c6af6830c29e80fd5823ae1a9b616d3f08a66d2746face6caf091854ee5b5d7c7e17c5f713f8fefa01e61ff5e3ebb36b58981d4354b3ffe7a78717b7d404241cadef4a7393582e64b1f2718a689aee4bf353b8e311156a566893fbb64aa5d2ec78a013e5c23dac7e794ab5f22183c9814e88c5e227a2d3e7b6ad0b502a950d2a958a53abd548a552e8e9e9c1c41043a5d168e89d4ea7e3f771e215ac0190e0a66030788b37f2a6643209abd58a6c368b4c260393c984e1e161783c1e747777576432d920816cae0248f012cbb248a7d330180c301a8db0dbedc8e572c8e7f3b0582cd06ab5b0d96c8846a370bbdd15b95cde57052c0c35ff5e9e1d44381c06c771d4e470384026a3e3330c03afd70b97cb05bfdf8f622e8ab7fd2de52a6031d25229bdb84e0d8944828248256ae62bf5f6f6221008201e8f53d88f971ce682c24a15f0f9b13f341f6afae5743aa1d7eba991572c16a3fdf9a9f833e98faeae2e2c44456592e1d6bcc2d2b4af9e746c22cff88af45d22e397150a0578f121b2162512c91bb3d92cfc36e3abaff91bff457f0006cb7ee97738589e0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23723', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000025449444154789ca5935b6892611cc6475044b9d52a22aacb169b948c41e928170be7611e113f4d9d87fc8c3212695b73da14ebb35117cd8bc1940eeb30dd0183825d24d18dd071b8d5aadb18ddc540bbdb8cc2a7f77b2f84c17045170fef81e7f9f17f7879eb00d4fd8fd6bdbce030df0e9fda8d48473d064e0ae06bdf05d6acbbff57001feb8a45b4cd183b7b1437553b30ea3e82be0e01dcd203609dd6910d0121a318a3b6260c90d00dd321126e409c390c5fc75e185af75436049c3fde88cb6a21c6af6830c29e80fd5823ae1a9b616d3f08a66d2746face6caf091854ee5b5d7c7e17c5f713f8fefa01e61ff5e3ebb36b58981d4354b3ffe7a78717b7d404241cadef4a7393582e64b1f2718a689aee4bf353b8e311156a566893fbb64aa5d2ec78a013e5c23dac7e794ab5f22183c9814e88c5e227a2d3e7b6ad0b502a950d2a958a53abd548a552e8e9e9c1c41043a5d168e89d4ea7e3f771e215ac0190e0a66030788b37f2a6643209abd58a6c368b4c260393c984e1e161783c1e747777576432d920816cae0248f012cbb248a7d330180c301a8db0dbedc8e572c8e7f3b0582cd06ab5b0d96c8846a370bbdd15b95cde57052c0c35ff5e9e1d44381c06c771d4e470384026a3e3330c03afd70b97cb05bfdf8f622e8ab7fd2de52a6031d25229bdb84e0d8944828248256ae62bf5f6f6221008201e8f53d88f971ce682c24a15f0f9b13f341f6afae5743aa1d7eba991572c16a3fdf9a9f833e98faeae2e2c44456592e1d6bcc2d2b4af9e746c22cff88af45d22e397150a0578f121b2162512c91bb3d92cfc36e3abaff91bff457f0006cb7ee97738589e0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23724', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000025449444154789ca5935b6892611cc6475044b9d52a22aacb169b948c41e928170be7611e113f4d9d87fc8c3212695b73da14ebb35117cd8bc1940eeb30dd0183825d24d18dd071b8d5aadb18ddc540bbdb8cc2a7f77b2f84c17045170fef81e7f9f17f7879eb00d4fd8fd6bdbce030df0e9fda8d48473d064e0ae06bdf05d6acbbff57001feb8a45b4cd183b7b1437553b30ea3e82be0e01dcd203609dd6910d0121a318a3b6260c90d00dd321126e409c390c5fc75e185af75436049c3fde88cb6a21c6af6830c29e80fd5823ae1a9b616d3f08a66d2746face6caf091854ee5b5d7c7e17c5f713f8fefa01e61ff5e3ebb36b58981d4354b3ffe7a78717b7d404241cadef4a7393582e64b1f2718a689aee4bf353b8e311156a566893fbb64aa5d2ec78a013e5c23dac7e794ab5f22183c9814e88c5e227a2d3e7b6ad0b502a950d2a958a53abd548a552e8e9e9c1c41043a5d168e89d4ea7e3f771e215ac0190e0a66030788b37f2a6643209abd58a6c368b4c260393c984e1e161783c1e747777576432d920816cae0248f012cbb248a7d330180c301a8db0dbedc8e572c8e7f3b0582cd06ab5b0d96c8846a370bbdd15b95cde57052c0c35ff5e9e1d44381c06c771d4e470384026a3e3330c03afd70b97cb05bfdf8f622e8ab7fd2de52a6031d25229bdb84e0d8944828248256ae62bf5f6f6221008201e8f53d88f971ce682c24a15f0f9b13f341f6afae5743aa1d7eba991572c16a3fdf9a9f833e98faeae2e2c44456592e1d6bcc2d2b4af9e746c22cff88af45d22e397150a0578f121b2162512c91bb3d92cfc36e3abaff91bff457f0006cb7ee97738589e0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23725', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000025449444154789ca5935b6892611cc6475044b9d52a22aacb169b948c41e928170be7611e113f4d9d87fc8c3212695b73da14ebb35117cd8bc1940eeb30dd0183825d24d18dd071b8d5aadb18ddc540bbdb8cc2a7f77b2f84c17045170fef81e7f9f17f7879eb00d4fd8fd6bdbce030df0e9fda8d48473d064e0ae06bdf05d6acbbff57001feb8a45b4cd183b7b1437553b30ea3e82be0e01dcd203609dd6910d0121a318a3b6260c90d00dd321126e409c390c5fc75e185af75436049c3fde88cb6a21c6af6830c29e80fd5823ae1a9b616d3f08a66d2746face6caf091854ee5b5d7c7e17c5f713f8fefa01e61ff5e3ebb36b58981d4354b3ffe7a78717b7d404241cadef4a7393582e64b1f2718a689aee4bf353b8e311156a566893fbb64aa5d2ec78a013e5c23dac7e794ab5f22183c9814e88c5e227a2d3e7b6ad0b502a950d2a958a53abd548a552e8e9e9c1c41043a5d168e89d4ea7e3f771e215ac0190e0a66030788b37f2a6643209abd58a6c368b4c260393c984e1e161783c1e747777576432d920816cae0248f012cbb248a7d330180c301a8db0dbedc8e572c8e7f3b0582cd06ab5b0d96c8846a370bbdd15b95cde57052c0c35ff5e9e1d44381c06c771d4e470384026a3e3330c03afd70b97cb05bfdf8f622e8ab7fd2de52a6031d25229bdb84e0d8944828248256ae62bf5f6f6221008201e8f53d88f971ce682c24a15f0f9b13f341f6afae5743aa1d7eba991572c16a3fdf9a9f833e98faeae2e2c44456592e1d6bcc2d2b4af9e746c22cff88af45d22e397150a0578f121b2162512c91bb3d92cfc36e3abaff91bff457f0006cb7ee97738589e0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23726', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000025449444154789ca5935b6892611cc6475044b9d52a22aacb169b948c41e928170be7611e113f4d9d87fc8c3212695b73da14ebb35117cd8bc1940eeb30dd0183825d24d18dd071b8d5aadb18ddc540bbdb8cc2a7f77b2f84c17045170fef81e7f9f17f7879eb00d4fd8fd6bdbce030df0e9fda8d48473d064e0ae06bdf05d6acbbff57001feb8a45b4cd183b7b1437553b30ea3e82be0e01dcd203609dd6910d0121a318a3b6260c90d00dd321126e409c390c5fc75e185af75436049c3fde88cb6a21c6af6830c29e80fd5823ae1a9b616d3f08a66d2746face6caf091854ee5b5d7c7e17c5f713f8fefa01e61ff5e3ebb36b58981d4354b3ffe7a78717b7d404241cadef4a7393582e64b1f2718a689aee4bf353b8e311156a566893fbb64aa5d2ec78a013e5c23dac7e794ab5f22183c9814e88c5e227a2d3e7b6ad0b502a950d2a958a53abd548a552e8e9e9c1c41043a5d168e89d4ea7e3f771e215ac0190e0a66030788b37f2a6643209abd58a6c368b4c260393c984e1e161783c1e747777576432d920816cae0248f012cbb248a7d330180c301a8db0dbedc8e572c8e7f3b0582cd06ab5b0d96c8846a370bbdd15b95cde57052c0c35ff5e9e1d44381c06c771d4e470384026a3e3330c03afd70b97cb05bfdf8f622e8ab7fd2de52a6031d25229bdb84e0d8944828248256ae62bf5f6f6221008201e8f53d88f971ce682c24a15f0f9b13f341f6afae5743aa1d7eba991572c16a3fdf9a9f833e98faeae2e2c44456592e1d6bcc2d2b4af9e746c22cff88af45d22e397150a0578f121b2162512c91bb3d92cfc36e3abaff91bff457f0006cb7ee97738589e0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23727', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000025449444154789ca5935b6892611cc6475044b9d52a22aacb169b948c41e928170be7611e113f4d9d87fc8c3212695b73da14ebb35117cd8bc1940eeb30dd0183825d24d18dd071b8d5aadb18ddc540bbdb8cc2a7f77b2f84c17045170fef81e7f9f17f7879eb00d4fd8fd6bdbce030df0e9fda8d48473d064e0ae06bdf05d6acbbff57001feb8a45b4cd183b7b1437553b30ea3e82be0e01dcd203609dd6910d0121a318a3b6260c90d00dd321126e409c390c5fc75e185af75436049c3fde88cb6a21c6af6830c29e80fd5823ae1a9b616d3f08a66d2746face6caf091854ee5b5d7c7e17c5f713f8fefa01e61ff5e3ebb36b58981d4354b3ffe7a78717b7d404241cadef4a7393582e64b1f2718a689aee4bf353b8e311156a566893fbb64aa5d2ec78a013e5c23dac7e794ab5f22183c9814e88c5e227a2d3e7b6ad0b502a950d2a958a53abd548a552e8e9e9c1c41043a5d168e89d4ea7e3f771e215ac0190e0a66030788b37f2a6643209abd58a6c368b4c260393c984e1e161783c1e747777576432d920816cae0248f012cbb248a7d330180c301a8db0dbedc8e572c8e7f3b0582cd06ab5b0d96c8846a370bbdd15b95cde57052c0c35ff5e9e1d44381c06c771d4e470384026a3e3330c03afd70b97cb05bfdf8f622e8ab7fd2de52a6031d25229bdb84e0d8944828248256ae62bf5f6f6221008201e8f53d88f971ce682c24a15f0f9b13f341f6afae5743aa1d7eba991572c16a3fdf9a9f833e98faeae2e2c44456592e1d6bcc2d2b4af9e746c22cff88af45d22e397150a0578f121b2162512c91bb3d92cfc36e3abaff91bff457f0006cb7ee97738589e0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23728', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000025449444154789ca5935b6892611cc6475044b9d52a22aacb169b948c41e928170be7611e113f4d9d87fc8c3212695b73da14ebb35117cd8bc1940eeb30dd0183825d24d18dd071b8d5aadb18ddc540bbdb8cc2a7f77b2f84c17045170fef81e7f9f17f7879eb00d4fd8fd6bdbce030df0e9fda8d48473d064e0ae06bdf05d6acbbff57001feb8a45b4cd183b7b1437553b30ea3e82be0e01dcd203609dd6910d0121a318a3b6260c90d00dd321126e409c390c5fc75e185af75436049c3fde88cb6a21c6af6830c29e80fd5823ae1a9b616d3f08a66d2746face6caf091854ee5b5d7c7e17c5f713f8fefa01e61ff5e3ebb36b58981d4354b3ffe7a78717b7d404241cadef4a7393582e64b1f2718a689aee4bf353b8e311156a566893fbb64aa5d2ec78a013e5c23dac7e794ab5f22183c9814e88c5e227a2d3e7b6ad0b502a950d2a958a53abd548a552e8e9e9c1c41043a5d168e89d4ea7e3f771e215ac0190e0a66030788b37f2a6643209abd58a6c368b4c260393c984e1e161783c1e747777576432d920816cae0248f012cbb248a7d330180c301a8db0dbedc8e572c8e7f3b0582cd06ab5b0d96c8846a370bbdd15b95cde57052c0c35ff5e9e1d44381c06c771d4e470384026a3e3330c03afd70b97cb05bfdf8f622e8ab7fd2de52a6031d25229bdb84e0d8944828248256ae62bf5f6f6221008201e8f53d88f971ce682c24a15f0f9b13f341f6afae5743aa1d7eba991572c16a3fdf9a9f833e98faeae2e2c44456592e1d6bcc2d2b4af9e746c22cff88af45d22e397150a0578f121b2162512c91bb3d92cfc36e3abaff91bff457f0006cb7ee97738589e0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23729', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000025449444154789ca5935b6892611cc6475044b9d52a22aacb169b948c41e928170be7611e113f4d9d87fc8c3212695b73da14ebb35117cd8bc1940eeb30dd0183825d24d18dd071b8d5aadb18ddc540bbdb8cc2a7f77b2f84c17045170fef81e7f9f17f7879eb00d4fd8fd6bdbce030df0e9fda8d48473d064e0ae06bdf05d6acbbff57001feb8a45b4cd183b7b1437553b30ea3e82be0e01dcd203609dd6910d0121a318a3b6260c90d00dd321126e409c390c5fc75e185af75436049c3fde88cb6a21c6af6830c29e80fd5823ae1a9b616d3f08a66d2746face6caf091854ee5b5d7c7e17c5f713f8fefa01e61ff5e3ebb36b58981d4354b3ffe7a78717b7d404241cadef4a7393582e64b1f2718a689aee4bf353b8e311156a566893fbb64aa5d2ec78a013e5c23dac7e794ab5f22183c9814e88c5e227a2d3e7b6ad0b502a950d2a958a53abd548a552e8e9e9c1c41043a5d168e89d4ea7e3f771e215ac0190e0a66030788b37f2a6643209abd58a6c368b4c260393c984e1e161783c1e747777576432d920816cae0248f012cbb248a7d330180c301a8db0dbedc8e572c8e7f3b0582cd06ab5b0d96c8846a370bbdd15b95cde57052c0c35ff5e9e1d44381c06c771d4e470384026a3e3330c03afd70b97cb05bfdf8f622e8ab7fd2de52a6031d25229bdb84e0d8944828248256ae62bf5f6f6221008201e8f53d88f971ce682c24a15f0f9b13f341f6afae5743aa1d7eba991572c16a3fdf9a9f833e98faeae2e2c44456592e1d6bcc2d2b4af9e746c22cff88af45d22e397150a0578f121b2162512c91bb3d92cfc36e3abaff91bff457f0006cb7ee97738589e0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23730', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000025449444154789ca5935b6892611cc6475044b9d52a22aacb169b948c41e928170be7611e113f4d9d87fc8c3212695b73da14ebb35117cd8bc1940eeb30dd0183825d24d18dd071b8d5aadb18ddc540bbdb8cc2a7f77b2f84c17045170fef81e7f9f17f7879eb00d4fd8fd6bdbce030df0e9fda8d48473d064e0ae06bdf05d6acbbff57001feb8a45b4cd183b7b1437553b30ea3e82be0e01dcd203609dd6910d0121a318a3b6260c90d00dd321126e409c390c5fc75e185af75436049c3fde88cb6a21c6af6830c29e80fd5823ae1a9b616d3f08a66d2746face6caf091854ee5b5d7c7e17c5f713f8fefa01e61ff5e3ebb36b58981d4354b3ffe7a78717b7d404241cadef4a7393582e64b1f2718a689aee4bf353b8e311156a566893fbb64aa5d2ec78a013e5c23dac7e794ab5f22183c9814e88c5e227a2d3e7b6ad0b502a950d2a958a53abd548a552e8e9e9c1c41043a5d168e89d4ea7e3f771e215ac0190e0a66030788b37f2a6643209abd58a6c368b4c260393c984e1e161783c1e747777576432d920816cae0248f012cbb248a7d330180c301a8db0dbedc8e572c8e7f3b0582cd06ab5b0d96c8846a370bbdd15b95cde57052c0c35ff5e9e1d44381c06c771d4e470384026a3e3330c03afd70b97cb05bfdf8f622e8ab7fd2de52a6031d25229bdb84e0d8944828248256ae62bf5f6f6221008201e8f53d88f971ce682c24a15f0f9b13f341f6afae5743aa1d7eba991572c16a3fdf9a9f833e98faeae2e2c44456592e1d6bcc2d2b4af9e746c22cff88af45d22e397150a0578f121b2162512c91bb3d92cfc36e3abaff91bff457f0006cb7ee97738589e0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23731', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000025449444154789ca5935b6892611cc6475044b9d52a22aacb169b948c41e928170be7611e113f4d9d87fc8c3212695b73da14ebb35117cd8bc1940eeb30dd0183825d24d18dd071b8d5aadb18ddc540bbdb8cc2a7f77b2f84c17045170fef81e7f9f17f7879eb00d4fd8fd6bdbce030df0e9fda8d48473d064e0ae06bdf05d6acbbff57001feb8a45b4cd183b7b1437553b30ea3e82be0e01dcd203609dd6910d0121a318a3b6260c90d00dd321126e409c390c5fc75e185af75436049c3fde88cb6a21c6af6830c29e80fd5823ae1a9b616d3f08a66d2746face6caf091854ee5b5d7c7e17c5f713f8fefa01e61ff5e3ebb36b58981d4354b3ffe7a78717b7d404241cadef4a7393582e64b1f2718a689aee4bf353b8e311156a566893fbb64aa5d2ec78a013e5c23dac7e794ab5f22183c9814e88c5e227a2d3e7b6ad0b502a950d2a958a53abd548a552e8e9e9c1c41043a5d168e89d4ea7e3f771e215ac0190e0a66030788b37f2a6643209abd58a6c368b4c260393c984e1e161783c1e747777576432d920816cae0248f012cbb248a7d330180c301a8db0dbedc8e572c8e7f3b0582cd06ab5b0d96c8846a370bbdd15b95cde57052c0c35ff5e9e1d44381c06c771d4e470384026a3e3330c03afd70b97cb05bfdf8f622e8ab7fd2de52a6031d25229bdb84e0d8944828248256ae62bf5f6f6221008201e8f53d88f971ce682c24a15f0f9b13f341f6afae5743aa1d7eba991572c16a3fdf9a9f833e98faeae2e2c44456592e1d6bcc2d2b4af9e746c22cff88af45d22e397150a0578f121b2162512c91bb3d92cfc36e3abaff91bff457f0006cb7ee97738589e0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23732', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100802000000909168360000028849444154789c4592ed4b536114c09fb94f214928e29fa4f66d5ffa101442ea669618bd88085a441ab36256ce855a4145a508b23e05a2891939b7ebe6e6dcdddceebcaf9b9bd3ed6ef7ee4eb7d3b9db30f85d380ff7fcceb9e79e8764017e52dccb2f6b83af16faaddffb74166f4f2e6060b67e7be8589d72fad31550012aa03f2403f07cdec9142056045a055a81035507e3900aae24d896b647edcbe9326855871c01dc9ffc2416c11dcb6d1d6a081557b6a3f26624b71a48e3db95e08975c93364ff715c7588047077e2a3a8c22e9bf3b20a428cada4a19518db3602092cbc23947e0b30e5f4d93eafe4501001ee8c7f4021c89e06f92c31b6a043c5f3ee480663fae89ccd83a441340bddc36f531782a0002dc861314f1a9afdbce263f33bcc090aeb7e69cd27ac53314c308fcd4a35a1ffd97b3c872595167548435395664f2cb7199137e8ec6630c1a3f064eebfc01720922886a4d281a431e2293134ee7359efa1bc15d3fe4494bfe10cab42efd87c5de87b5a15a4825ede70859046422e11e365626ca6d8922ba6622b9ca47b6c4eac09bd8f67b93cd0a28242585462bcde21cc67829c4c714577bc88ad70eeae917775e1d6e86c3c0741510908da1eaf467899189af6391947f71c6aae3876c81c9dc38d47d3f54fea1a7130d90b41238696108fbfabc5c72a6e168502c59c24cfe0da804daa2deee6903d7a0cfb7c01cbe3cad041021c6eb00d3b6c332ac56413253059acc9dad5b87e6f2a94863da1e217ca3ea1e21540872f53ec998badb898730fa326cb60ea19c764fdf2750f3b0e6408a4613705de345029d849015da8132f01578234a60d4d6332390558fc157df0c2691a70745aec1d9619a4dd32dd617ed36eb675f6bebeda6333f5db0627be2eafe3a4f00f45e24494e1a849120000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23733', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100802000000909168360000028849444154789c4592ed4b536114c09fb94f214928e29fa4f66d5ffa101442ea669618bd88085a441ab36256ce855a4145a508b23e05a2891939b7ebe6e6dcdddceebcaf9b9bd3ed6ef7ee4eb7d3b9db30f85d380ff7fcceb9e79e8764017e52dccb2f6b83af16faaddffb74166f4f2e6060b67e7be8589d72fad31550012aa03f2403f07cdec9142056045a055a81035507e3900aae24d896b647edcbe9326855871c01dc9ffc2416c11dcb6d1d6a081557b6a3f26624b71a48e3db95e08975c93364ff715c7588047077e2a3a8c22e9bf3b20a428cada4a19518db3602092cbc23947e0b30e5f4d93eafe4501001ee8c7f4021c89e06f92c31b6a043c5f3ee480663fae89ccd83a441340bddc36f531782a0002dc861314f1a9afdbce263f33bcc090aeb7e69cd27ac53314c308fcd4a35a1ffd97b3c872595167548435395664f2cb7199137e8ec6630c1a3f064eebfc01720922886a4d281a431e2293134ee7359efa1bc15d3fe4494bfe10cab42efd87c5de87b5a15a4825ede70859046422e11e365626ca6d8922ba6622b9ca47b6c4eac09bd8f67b93cd0a28242585462bcde21cc67829c4c714577bc88ad70eeae917775e1d6e86c3c0741510908da1eaf467899189af6391947f71c6aae3876c81c9dc38d47d3f54fea1a7130d90b41238696108fbfabc5c72a6e168502c59c24cfe0da804daa2deee6903d7a0cfb7c01cbe3cad041021c6eb00d3b6c332ac56413253059acc9dad5b87e6f2a94863da1e217ca3ea1e21540872f53ec998badb898730fa326cb60ea19c764fdf2750f3b0e6408a4613705de345029d849015da8132f01578234a60d4d6332390558fc157df0c2691a70745aec1d9619a4dd32dd617ed36eb675f6bebeda6333f5db0627be2eafe3a4f00f45e24494e1a849120000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23734', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100802000000909168360000028849444154789c4592ed4b536114c09fb94f214928e29fa4f66d5ffa101442ea669618bd88085a441ab36256ce855a4145a508b23e05a2891939b7ebe6e6dcdddceebcaf9b9bd3ed6ef7ee4eb7d3b9db30f85d380ff7fcceb9e79e8764017e52dccb2f6b83af16faaddffb74166f4f2e6060b67e7be8589d72fad31550012aa03f2403f07cdec9142056045a055a81035507e3900aae24d896b647edcbe9326855871c01dc9ffc2416c11dcb6d1d6a081557b6a3f26624b71a48e3db95e08975c93364ff715c7588047077e2a3a8c22e9bf3b20a428cada4a19518db3602092cbc23947e0b30e5f4d93eafe4501001ee8c7f4021c89e06f92c31b6a043c5f3ee480663fae89ccd83a441340bddc36f531782a0002dc861314f1a9afdbce263f33bcc090aeb7e69cd27ac53314c308fcd4a35a1ffd97b3c872595167548435395664f2cb7199137e8ec6630c1a3f064eebfc01720922886a4d281a431e2293134ee7359efa1bc15d3fe4494bfe10cab42efd87c5de87b5a15a4825ede70859046422e11e365626ca6d8922ba6622b9ca47b6c4eac09bd8f67b93cd0a28242585462bcde21cc67829c4c714577bc88ad70eeae917775e1d6e86c3c0741510908da1eaf467899189af6391947f71c6aae3876c81c9dc38d47d3f54fea1a7130d90b41238696108fbfabc5c72a6e168502c59c24cfe0da804daa2deee6903d7a0cfb7c01cbe3cad041021c6eb00d3b6c332ac56413253059acc9dad5b87e6f2a94863da1e217ca3ea1e21540872f53ec998badb898730fa326cb60ea19c764fdf2750f3b0e6408a4613705de345029d849015da8132f01578234a60d4d6332390558fc157df0c2691a70745aec1d9619a4dd32dd617ed36eb675f6bebeda6333f5db0627be2eafe3a4f00f45e24494e1a849120000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23735', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100802000000909168360000028849444154789c4592ed4b536114c09fb94f214928e29fa4f66d5ffa101442ea669618bd88085a441ab36256ce855a4145a508b23e05a2891939b7ebe6e6dcdddceebcaf9b9bd3ed6ef7ee4eb7d3b9db30f85d380ff7fcceb9e79e8764017e52dccb2f6b83af16faaddffb74166f4f2e6060b67e7be8589d72fad31550012aa03f2403f07cdec9142056045a055a81035507e3900aae24d896b647edcbe9326855871c01dc9ffc2416c11dcb6d1d6a081557b6a3f26624b71a48e3db95e08975c93364ff715c7588047077e2a3a8c22e9bf3b20a428cada4a19518db3602092cbc23947e0b30e5f4d93eafe4501001ee8c7f4021c89e06f92c31b6a043c5f3ee480663fae89ccd83a441340bddc36f531782a0002dc861314f1a9afdbce263f33bcc090aeb7e69cd27ac53314c308fcd4a35a1ffd97b3c872595167548435395664f2cb7199137e8ec6630c1a3f064eebfc01720922886a4d281a431e2293134ee7359efa1bc15d3fe4494bfe10cab42efd87c5de87b5a15a4825ede70859046422e11e365626ca6d8922ba6622b9ca47b6c4eac09bd8f67b93cd0a28242585462bcde21cc67829c4c714577bc88ad70eeae917775e1d6e86c3c0741510908da1eaf467899189af6391947f71c6aae3876c81c9dc38d47d3f54fea1a7130d90b41238696108fbfabc5c72a6e168502c59c24cfe0da804daa2deee6903d7a0cfb7c01cbe3cad041021c6eb00d3b6c332ac56413253059acc9dad5b87e6f2a94863da1e217ca3ea1e21540872f53ec998badb898730fa326cb60ea19c764fdf2750f3b0e6408a4613705de345029d849015da8132f01578234a60d4d6332390558fc157df0c2691a70745aec1d9619a4dd32dd617ed36eb675f6bebeda6333f5db0627be2eafe3a4f00f45e24494e1a849120000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23736', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100802000000909168360000028849444154789c4592ed4b536114c09fb94f214928e29fa4f66d5ffa101442ea669618bd88085a441ab36256ce855a4145a508b23e05a2891939b7ebe6e6dcdddceebcaf9b9bd3ed6ef7ee4eb7d3b9db30f85d380ff7fcceb9e79e8764017e52dccb2f6b83af16faaddffb74166f4f2e6060b67e7be8589d72fad31550012aa03f2403f07cdec9142056045a055a81035507e3900aae24d896b647edcbe9326855871c01dc9ffc2416c11dcb6d1d6a081557b6a3f26624b71a48e3db95e08975c93364ff715c7588047077e2a3a8c22e9bf3b20a428cada4a19518db3602092cbc23947e0b30e5f4d93eafe4501001ee8c7f4021c89e06f92c31b6a043c5f3ee480663fae89ccd83a441340bddc36f531782a0002dc861314f1a9afdbce263f33bcc090aeb7e69cd27ac53314c308fcd4a35a1ffd97b3c872595167548435395664f2cb7199137e8ec6630c1a3f064eebfc01720922886a4d281a431e2293134ee7359efa1bc15d3fe4494bfe10cab42efd87c5de87b5a15a4825ede70859046422e11e365626ca6d8922ba6622b9ca47b6c4eac09bd8f67b93cd0a28242585462bcde21cc67829c4c714577bc88ad70eeae917775e1d6e86c3c0741510908da1eaf467899189af6391947f71c6aae3876c81c9dc38d47d3f54fea1a7130d90b41238696108fbfabc5c72a6e168502c59c24cfe0da804daa2deee6903d7a0cfb7c01cbe3cad041021c6eb00d3b6c332ac56413253059acc9dad5b87e6f2a94863da1e217ca3ea1e21540872f53ec998badb898730fa326cb60ea19c764fdf2750f3b0e6408a4613705de345029d849015da8132f01578234a60d4d6332390558fc157df0c2691a70745aec1d9619a4dd32dd617ed36eb675f6bebeda6333f5db0627be2eafe3a4f00f45e24494e1a849120000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23737', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100802000000909168360000028849444154789c4592ed4b536114c09fb94f214928e29fa4f66d5ffa101442ea669618bd88085a441ab36256ce855a4145a508b23e05a2891939b7ebe6e6dcdddceebcaf9b9bd3ed6ef7ee4eb7d3b9db30f85d380ff7fcceb9e79e8764017e52dccb2f6b83af16faaddffb74166f4f2e6060b67e7be8589d72fad31550012aa03f2403f07cdec9142056045a055a81035507e3900aae24d896b647edcbe9326855871c01dc9ffc2416c11dcb6d1d6a081557b6a3f26624b71a48e3db95e08975c93364ff715c7588047077e2a3a8c22e9bf3b20a428cada4a19518db3602092cbc23947e0b30e5f4d93eafe4501001ee8c7f4021c89e06f92c31b6a043c5f3ee480663fae89ccd83a441340bddc36f531782a0002dc861314f1a9afdbce263f33bcc090aeb7e69cd27ac53314c308fcd4a35a1ffd97b3c872595167548435395664f2cb7199137e8ec6630c1a3f064eebfc01720922886a4d281a431e2293134ee7359efa1bc15d3fe4494bfe10cab42efd87c5de87b5a15a4825ede70859046422e11e365626ca6d8922ba6622b9ca47b6c4eac09bd8f67b93cd0a28242585462bcde21cc67829c4c714577bc88ad70eeae917775e1d6e86c3c0741510908da1eaf467899189af6391947f71c6aae3876c81c9dc38d47d3f54fea1a7130d90b41238696108fbfabc5c72a6e168502c59c24cfe0da804daa2deee6903d7a0cfb7c01cbe3cad041021c6eb00d3b6c332ac56413253059acc9dad5b87e6f2a94863da1e217ca3ea1e21540872f53ec998badb898730fa326cb60ea19c764fdf2750f3b0e6408a4613705de345029d849015da8132f01578234a60d4d6332390558fc157df0c2691a70745aec1d9619a4dd32dd617ed36eb675f6bebeda6333f5db0627be2eafe3a4f00f45e24494e1a849120000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23738', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100802000000909168360000028849444154789c4592ed4b536114c09fb94f214928e29fa4f66d5ffa101442ea669618bd88085a441ab36256ce855a4145a508b23e05a2891939b7ebe6e6dcdddceebcaf9b9bd3ed6ef7ee4eb7d3b9db30f85d380ff7fcceb9e79e8764017e52dccb2f6b83af16faaddffb74166f4f2e6060b67e7be8589d72fad31550012aa03f2403f07cdec9142056045a055a81035507e3900aae24d896b647edcbe9326855871c01dc9ffc2416c11dcb6d1d6a081557b6a3f26624b71a48e3db95e08975c93364ff715c7588047077e2a3a8c22e9bf3b20a428cada4a19518db3602092cbc23947e0b30e5f4d93eafe4501001ee8c7f4021c89e06f92c31b6a043c5f3ee480663fae89ccd83a441340bddc36f531782a0002dc861314f1a9afdbce263f33bcc090aeb7e69cd27ac53314c308fcd4a35a1ffd97b3c872595167548435395664f2cb7199137e8ec6630c1a3f064eebfc01720922886a4d281a431e2293134ee7359efa1bc15d3fe4494bfe10cab42efd87c5de87b5a15a4825ede70859046422e11e365626ca6d8922ba6622b9ca47b6c4eac09bd8f67b93cd0a28242585462bcde21cc67829c4c714577bc88ad70eeae917775e1d6e86c3c0741510908da1eaf467899189af6391947f71c6aae3876c81c9dc38d47d3f54fea1a7130d90b41238696108fbfabc5c72a6e168502c59c24cfe0da804daa2deee6903d7a0cfb7c01cbe3cad041021c6eb00d3b6c332ac56413253059acc9dad5b87e6f2a94863da1e217ca3ea1e21540872f53ec998badb898730fa326cb60ea19c764fdf2750f3b0e6408a4613705de345029d849015da8132f01578234a60d4d6332390558fc157df0c2691a70745aec1d9619a4dd32dd617ed36eb675f6bebeda6333f5db0627be2eafe3a4f00f45e24494e1a849120000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23739', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100802000000909168360000028849444154789c4592ed4b536114c09fb94f214928e29fa4f66d5ffa101442ea669618bd88085a441ab36256ce855a4145a508b23e05a2891939b7ebe6e6dcdddceebcaf9b9bd3ed6ef7ee4eb7d3b9db30f85d380ff7fcceb9e79e8764017e52dccb2f6b83af16faaddffb74166f4f2e6060b67e7be8589d72fad31550012aa03f2403f07cdec9142056045a055a81035507e3900aae24d896b647edcbe9326855871c01dc9ffc2416c11dcb6d1d6a081557b6a3f26624b71a48e3db95e08975c93364ff715c7588047077e2a3a8c22e9bf3b20a428cada4a19518db3602092cbc23947e0b30e5f4d93eafe4501001ee8c7f4021c89e06f92c31b6a043c5f3ee480663fae89ccd83a441340bddc36f531782a0002dc861314f1a9afdbce263f33bcc090aeb7e69cd27ac53314c308fcd4a35a1ffd97b3c872595167548435395664f2cb7199137e8ec6630c1a3f064eebfc01720922886a4d281a431e2293134ee7359efa1bc15d3fe4494bfe10cab42efd87c5de87b5a15a4825ede70859046422e11e365626ca6d8922ba6622b9ca47b6c4eac09bd8f67b93cd0a28242585462bcde21cc67829c4c714577bc88ad70eeae917775e1d6e86c3c0741510908da1eaf467899189af6391947f71c6aae3876c81c9dc38d47d3f54fea1a7130d90b41238696108fbfabc5c72a6e168502c59c24cfe0da804daa2deee6903d7a0cfb7c01cbe3cad041021c6eb00d3b6c332ac56413253059acc9dad5b87e6f2a94863da1e217ca3ea1e21540872f53ec998badb898730fa326cb60ea19c764fdf2750f3b0e6408a4613705de345029d849015da8132f01578234a60d4d6332390558fc157df0c2691a70745aec1d9619a4dd32dd617ed36eb675f6bebeda6333f5db0627be2eafe3a4f00f45e24494e1a849120000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23740', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100802000000909168360000028849444154789c4592ed4b536114c09fb94f214928e29fa4f66d5ffa101442ea669618bd88085a441ab36256ce855a4145a508b23e05a2891939b7ebe6e6dcdddceebcaf9b9bd3ed6ef7ee4eb7d3b9db30f85d380ff7fcceb9e79e8764017e52dccb2f6b83af16faaddffb74166f4f2e6060b67e7be8589d72fad31550012aa03f2403f07cdec9142056045a055a81035507e3900aae24d896b647edcbe9326855871c01dc9ffc2416c11dcb6d1d6a081557b6a3f26624b71a48e3db95e08975c93364ff715c7588047077e2a3a8c22e9bf3b20a428cada4a19518db3602092cbc23947e0b30e5f4d93eafe4501001ee8c7f4021c89e06f92c31b6a043c5f3ee480663fae89ccd83a441340bddc36f531782a0002dc861314f1a9afdbce263f33bcc090aeb7e69cd27ac53314c308fcd4a35a1ffd97b3c872595167548435395664f2cb7199137e8ec6630c1a3f064eebfc01720922886a4d281a431e2293134ee7359efa1bc15d3fe4494bfe10cab42efd87c5de87b5a15a4825ede70859046422e11e365626ca6d8922ba6622b9ca47b6c4eac09bd8f67b93cd0a28242585462bcde21cc67829c4c714577bc88ad70eeae917775e1d6e86c3c0741510908da1eaf467899189af6391947f71c6aae3876c81c9dc38d47d3f54fea1a7130d90b41238696108fbfabc5c72a6e168502c59c24cfe0da804daa2deee6903d7a0cfb7c01cbe3cad041021c6eb00d3b6c332ac56413253059acc9dad5b87e6f2a94863da1e217ca3ea1e21540872f53ec998badb898730fa326cb60ea19c764fdf2750f3b0e6408a4613705de345029d849015da8132f01578234a60d4d6332390558fc157df0c2691a70745aec1d9619a4dd32dd617ed36eb675f6bebeda6333f5db0627be2eafe3a4f00f45e24494e1a849120000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23741', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d4948445200000010000000100802000000909168360000028849444154789c4592ed4b536114c09fb94f214928e29fa4f66d5ffa101442ea669618bd88085a441ab36256ce855a4145a508b23e05a2891939b7ebe6e6dcdddceebcaf9b9bd3ed6ef7ee4eb7d3b9db30f85d380ff7fcceb9e79e8764017e52dccb2f6b83af16faaddffb74166f4f2e6060b67e7be8589d72fad31550012aa03f2403f07cdec9142056045a055a81035507e3900aae24d896b647edcbe9326855871c01dc9ffc2416c11dcb6d1d6a081557b6a3f26624b71a48e3db95e08975c93364ff715c7588047077e2a3a8c22e9bf3b20a428cada4a19518db3602092cbc23947e0b30e5f4d93eafe4501001ee8c7f4021c89e06f92c31b6a043c5f3ee480663fae89ccd83a441340bddc36f531782a0002dc861314f1a9afdbce263f33bcc090aeb7e69cd27ac53314c308fcd4a35a1ffd97b3c872595167548435395664f2cb7199137e8ec6630c1a3f064eebfc01720922886a4d281a431e2293134ee7359efa1bc15d3fe4494bfe10cab42efd87c5de87b5a15a4825ede70859046422e11e365626ca6d8922ba6622b9ca47b6c4eac09bd8f67b93cd0a28242585462bcde21cc67829c4c714577bc88ad70eeae917775e1d6e86c3c0741510908da1eaf467899189af6391947f71c6aae3876c81c9dc38d47d3f54fea1a7130d90b41238696108fbfabc5c72a6e168502c59c24cfe0da804daa2deee6903d7a0cfb7c01cbe3cad041021c6eb00d3b6c332ac56413253059acc9dad5b87e6f2a94863da1e217ca3ea1e21540872f53ec998badb898730fa326cb60ea19c764fdf2750f3b0e6408a4613705de345029d849015da8132f01578234a60d4d6332390558fc157df0c2691a70745aec1d9619a4dd32dd617ed36eb675f6bebeda6333f5db0627be2eafe3a4f00f45e24494e1a849120000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23742', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23743', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23744', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23745', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23746', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23747', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23748', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23749', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23750', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23751', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23752', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23753', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23754', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23755', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23756', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23757', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23758', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23759', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23760', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23761', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23762', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23763', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23764', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23765', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23766', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23767', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23768', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23769', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23770', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23771', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23772', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23773', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23774', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23775', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23776', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23777', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23778', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23779', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23780', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23781', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23782', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23783', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23784', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23785', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23786', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23787', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23788', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23789', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23790', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23791', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23792', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23793', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23794', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23795', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23796', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23797', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002bb49444154789c55935b4f135114857992ff6214211a63025143048368f801223729a2082824041230043181a00f1a95a0a8d1079f8da0480b2185b6b472532e05e55268a1403ba5edb49dd3cea5cb3d536ce1e19bc924b3be59679f336900d2aeb419cb6ef4580d454fad078440308d67eaddc68a7a265961b77931bbc9f43ca77ae0849af98f762978629ae078c61d84a3b22f1c852f9482e3551896dd3cdabe3aa17bb91ac9ae1e483f2628ec327b784194273745d8b624d89c12ac9b12cc8e188cab51fcb087119580c115016d5fb650f96255b85833989e145cefb608c1480c332e19b32e89ee12a634490ce36b51e8ed1112289871cbb0ed88e8fcee446ecbd8e754836e0b53057324f8b52d616e5bd6643fb74498d66318f923c0b11fd696126212f6fd11e43d1a978e0902e11816e80b8bc4c2ae82df9a446d216a2d0cd4e2db620803f34104684ef91d2696145cebb2303f099677e3b053788958742b9827d934cd64d291908cfe1560a039f8c322f21f5b52820212f848b0b217d758de5345712cec249a68126a32b19e98898f04791d4704573b2d8c0bc5604f8695641355a2ce65da956862213cbc88dcf62382bc0e33f3d27edb7753614de056922d669c32a6d42d26781ae4a556734a90db6e667bc128967612b513c81a6a7896c2d3848dce8695044c5490dd644c092eb79a983bc0e02b2f07575e01ae8c282905575a02efad438a8bc1dd4c1089c9385f3f9612e4341b99cb477bdcdc82f8c74f88bfff00a5bf1fca9b7790fbfa21f7be85fcba0fcaab5e041f34204c4bc8ba6348092e3c1c8b38bc9178a8b1117c6383f652b0ae5e83afad47a0b60ec1fb444d1d3dd7aaa752395d391c4a0acede1dd9f004a3bc8363ca8657c08647c0da21de90a8a14e3ec464d0ffa628f178e064d9d0525270ee9ea12653a71fc9aa32f832abf42c894ecfce1019bae104951afe531543a3191543b7d5ec3fc53834acd71fb4600000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23798', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23799', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23800', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002e649444154789c6d92495393591885fd2beeac76eb2ce2802376bb698702c29030890cda5d885184083612d10a210984106244434808432c4151ca469084e1634862049cf910d1722816ead6c71b2c171816e7aeee79ce7ddf735701abfe2ab8b6f6cf7cdbd4c17c9bef609e8df8bc460ee40a9db0b25f685f4e037b8f5bd8935d4f5c8691d8e4ff5e457c112d1dc25c23ccdfd5e65e54e56d28cbda48bbe02155e32145d34a72a90bc57917e21e71596662145a96018479526dbecf3ddf0cd3afde33f5f21d532f16083f9fe7f1b3370467e6084ccbbc7df791c5c545fe883df61b20af71b679e029a76aba4915c929a5ee25294a5c2489e4c4e21612ce3a97c6da9951170d88cf6d94ddc32fa97d10e65e78813bc105ba03f3dc9e7883579aa37d6416f7d06baef73d233eb7211a2096253b7dcf296af163ed7b8af16e109d57a2aa63944acf30173d1295de20d6de19b1544b34406c5a768811fe75f463ea0931fff91b739fbe220bcd7efccaeb0f5fd0b825ea7aa644232b00444db2bd6f9a93f607e8bbc368db25ca5c439434fb39d7344851938fe216097d5758d4591f0d101dcbd6de27e434f450753b4c656788f2f60025ad93a89de3143a244e3bc6a8ba15127fc11c0dd8936d91ebee86c8347471b12388c633c939d73845cd12ffdc1825ffda30f9f6612e7504d89db9420bbbb3ea65435780b42b9d9c774f70c63946e14d8982eb239cb00d91d5e0e7b8d54fb980eecaa88d06c4659a659d7782a48a56f1d49fa9b92235624ab7f848310da0340d8a9d8cb133dd140d109f43d6b6491c2b7552601f2127926af1a3343f42611820a1ba9f245d3feaa65176a85600ec48af932bdca31c56df245b3c57553fb8949aa8efe7e8d587fc7df97f8e68fb386d1b61bbcac89a9823f232c07655ad5ce119e3726710ad3744457b90b2d6009a96498a1d13a2ca71ced8c568962162954656af3bd4b40c10ab34356e4b33119366646baa812d29063627d7b02959cf26859e8d49d56c48ac667da28ef509ba5bbfcc11fd009ea8bb8a49553b2d0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23801', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002e649444154789c6d92495393591885fd2beeac76eb2ce2802376bb698702c29030890cda5d885184083612d10a210984106244434808432c4151ca469084e1634862049cf910d1722816ead6c71b2c171816e7aeee79ce7ddf735701abfe2ab8b6f6cf7cdbd4c17c9bef609e8df8bc460ee40a9db0b25f685f4e037b8f5bd8935d4f5c8691d8e4ff5e457c112d1dc25c23ccdfd5e65e54e56d28cbda48bbe02155e32145d34a72a90bc57917e21e71596662145a96018479526dbecf3ddf0cd3afde33f5f21d532f16083f9fe7f1b3370467e6084ccbbc7df791c5c545fe883df61b20af71b679e029a76aba4915c929a5ee25294a5c2489e4c4e21612ce3a97c6da9951170d88cf6d94ddc32fa97d10e65e78813bc105ba03f3dc9e7883579aa37d6416f7d06baef73d233eb7211a2096253b7dcf296af163ed7b8af16e109d57a2aa63944acf30173d1295de20d6de19b1544b34406c5a768811fe75f463ea0931fff91b739fbe220bcd7efccaeb0f5fd0b825ea7aa644232b00444db2bd6f9a93f607e8bbc368db25ca5c439434fb39d7344851938fe216097d5758d4591f0d101dcbd6de27e434f450753b4c656788f2f60025ad93a89de3143a244e3bc6a8ba15127fc11c0dd8936d91ebee86c8347471b12388c633c939d73845cd12ffdc1825ffda30f9f6612e7504d89db9420bbbb3ea65435780b42b9d9c774f70c63946e14d8982eb239cb00d91d5e0e7b8d54fb980eecaa88d06c4659a659d7782a48a56f1d49fa9b92235624ab7f848310da0340d8a9d8cb133dd140d109f43d6b6491c2b7552601f2127926af1a3343f42611820a1ba9f245d3feaa65176a85600ec48af932bdca31c56df245b3c57553fb8949aa8efe7e8d587fc7df97f8e68fb386d1b61bbcac89a9823f232c07655ad5ce119e3726710ad3744457b90b2d6009a96498a1d13a2ca71ced8c568962162954656af3bd4b40c10ab34356e4b33119366646baa812d29063627d7b02959cf26859e8d49d56c48ac667da28ef509ba5bbfcc11fd009ea8bb8a49553b2d0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23802', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23803', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23809', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000477040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000027371007e0002000000037371007e0002000000977371007e00020000009878');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23810', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23811', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000777040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000057371007e0002000000067371007e0002000000077371007e0002000000087371007e0002000000097371007e00020000000a7371007e00020000000b78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23812', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23813', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23814', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23815', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23816', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23817', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23818', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23819', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000677040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000997371007e0002000000307371007e0002000000377371007e00020000003f7371007e00020000006d7371007e00020000007b78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23820', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000677040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000e7371007e0002000000197371007e00020000001d7371007e0002000000207371007e0002000000257371007e00020000002878');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23821', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000677040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000f7371007e0002000000147371007e0002000000157371007e0002000000167371007e0002000000177371007e00020000001878');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23822', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000477040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000107371007e0002000000117371007e0002000000127371007e00020000001378');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23823', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23824', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23825', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23826', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23827', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23828', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23829', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23830', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23831', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23832', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000377040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000001a7371007e00020000001b7371007e00020000001c78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23833', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23834', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23835', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23836', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000277040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000001e7371007e00020000001f78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23837', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23838', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23839', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000477040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000217371007e0002000000227371007e0002000000237371007e00020000002478');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23840', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23841', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23842', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23843', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23844', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000277040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000267371007e00020000002778');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23845', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23846', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23847', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000777040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000297371007e00020000002a7371007e00020000002b7371007e00020000002c7371007e00020000002d7371007e00020000002e7371007e00020000002f78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23848', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23849', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23850', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23851', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23852', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23853', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23854', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23855', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000677040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000317371007e0002000000327371007e0002000000337371007e0002000000347371007e0002000000357371007e00020000003678');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23856', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23857', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23858', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23859', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23860', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23861', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23862', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000777040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000387371007e0002000000397371007e00020000003a7371007e00020000003b7371007e00020000003c7371007e00020000003d7371007e00020000003e78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23863', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23864', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23865', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23866', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23867', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23868', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23869', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23870', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000d770400000010737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000407371007e0002000000417371007e0002000000427371007e0002000000437371007e0002000000447371007e0002000000657371007e0002000000667371007e0002000000677371007e0002000000687371007e0002000000697371007e00020000006a7371007e00020000006b7371007e00020000006c78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23871', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23872', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23873', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23874', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23875', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000020770400000026737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000457371007e0002000000467371007e0002000000477371007e0002000000487371007e0002000000497371007e00020000004a7371007e00020000004b7371007e00020000004c7371007e00020000004d7371007e00020000004e7371007e00020000004f7371007e0002000000507371007e0002000000517371007e0002000000527371007e0002000000537371007e0002000000547371007e0002000000557371007e0002000000567371007e0002000000577371007e0002000000587371007e0002000000597371007e00020000005a7371007e00020000005b7371007e00020000005c7371007e00020000005d7371007e00020000005e7371007e00020000005f7371007e0002000000607371007e0002000000617371007e0002000000627371007e0002000000637371007e00020000006478');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23876', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23877', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23878', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23879', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23880', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23881', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23882', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23883', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23884', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23885', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23886', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23887', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23888', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23889', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23890', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23891', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23892', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23893', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23894', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23895', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23896', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23897', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23898', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23899', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23900', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23901', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23902', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23903', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23904', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23905', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23906', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23907', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23908', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23909', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23910', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23911', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23912', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23913', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23914', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23915', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23916', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000777040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000006e7371007e00020000006f7371007e0002000000767371007e0002000000777371007e0002000000787371007e0002000000797371007e00020000007a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23917', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23918', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000677040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000707371007e0002000000717371007e0002000000727371007e0002000000737371007e0002000000747371007e00020000007578');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23919', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23920', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23921', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23922', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23923', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23924', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23925', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23926', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23927', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23928', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23929', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23930', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000277040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000007c7371007e00020000008c78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23931', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000f770400000010737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000007d7371007e00020000007e7371007e00020000007f7371007e0002000000807371007e0002000000817371007e0002000000827371007e0002000000837371007e0002000000847371007e0002000000857371007e0002000000867371007e0002000000877371007e0002000000887371007e0002000000897371007e00020000008a7371007e00020000008b78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23932', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23933', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23934', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23935', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23936', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23937', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23938', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23939', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23940', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23941', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23942', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23943', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23944', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23945', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23946', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23947', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000a77040000000a737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000008d7371007e00020000008e7371007e00020000008f7371007e0002000000907371007e0002000000917371007e0002000000927371007e0002000000937371007e0002000000947371007e0002000000957371007e00020000009678');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23948', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23949', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23950', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23951', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23952', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23953', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23954', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23955', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23956', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23957', 131072);
SELECT pg_catalog.lowrite(0, '\xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000a78');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23960', 131072);
SELECT pg_catalog.lowrite(0, '\x47494638396110001000e60000000000ffffff8e8e8f494a4dc9cacc4a4c4f53585d62666ad8d9da32373be2f2fe5a5d5f959798d0e7ebb2b3b3accfca63ad98ecefeee8ebea66a68f86a59accd4d15ba08366a78c70b397679e8875af9784c0a8b5c8c056a8856ebb996baf9265a4886b9e88c5d3cdc6cfcb57b68a65bc9565b9936ec69d60ad8964b28f6bbb97588d7577b89a68a08679b599e7f2ed67bb925ca5826bb7926ab08e70b8966eac8e7dbd9f83bfa291c2aa9bc1afa6cab9bdcec65cae8561ab8576b7967cbb9b94c6adbcccc4f4f8f6cedbd472958270967d7a7d63a39879bc9a6d968267f0e0ca3a3733b8884fa1794a765e41bf9a6ddab383c5a37ad5bb9b5d5244d8be9fecd0afe3d2be9a6b37a07543715434a67c4db78b5869533bc8a57ecaab88cfb08cc1a586b7a188d9c0a3f0dcc6aa794889745e4c4640e6d6c5774e288d5d31efe6de9d8f839259349d6949ad8773332f2df0f0f0ededede5e5e5cececea9a9a9959595ffffff00000000000000000000000000000000000000000000000000000021f90401000076002c000000001000100000079880768276700e027472838a8371050306070b758b8b616065536609739483634a55504d4b0c9d82566762514c5904a67652545f4f5a6faf765e5d485b5c08b76a6458576bb7824769684e11af2f13456d6c46102d9d42191b446e4917183420943a3533330a311f383f27228b39323c3c0d3d2e403726218b152524240f3e3e362c5058e8b4838206182a3ca4e8b0e296842141388c501408003b');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23970', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002e649444154789c6d92495393591885fd2beeac76eb2ce2802376bb698702c29030890cda5d885184083612d10a210984106244434808432c4151ca469084e1634862049cf910d1722816ead6c71b2c171816e7aeee79ce7ddf735701abfe2ab8b6f6cf7cdbd4c17c9bef609e8df8bc460ee40a9db0b25f685f4e037b8f5bd8935d4f5c8691d8e4ff5e457c112d1dc25c23ccdfd5e65e54e56d28cbda48bbe02155e32145d34a72a90bc57917e21e71596662145a96018479526dbecf3ddf0cd3afde33f5f21d532f16083f9fe7f1b3370467e6084ccbbc7df791c5c545fe883df61b20af71b679e029a76aba4915c929a5ee25294a5c2489e4c4e21612ce3a97c6da9951170d88cf6d94ddc32fa97d10e65e78813bc105ba03f3dc9e7883579aa37d6416f7d06baef73d233eb7211a2096253b7dcf296af163ed7b8af16e109d57a2aa63944acf30173d1295de20d6de19b1544b34406c5a768811fe75f463ea0931fff91b739fbe220bcd7efccaeb0f5fd0b825ea7aa644232b00444db2bd6f9a93f607e8bbc368db25ca5c439434fb39d7344851938fe216097d5758d4591f0d101dcbd6de27e434f450753b4c656788f2f60025ad93a89de3143a244e3bc6a8ba15127fc11c0dd8936d91ebee86c8347471b12388c633c939d73845cd12ffdc1825ffda30f9f6612e7504d89db9420bbbb3ea65435780b42b9d9c774f70c63946e14d8982eb239cb00d91d5e0e7b8d54fb980eecaa88d06c4659a659d7782a48a56f1d49fa9b92235624ab7f848310da0340d8a9d8cb133dd140d109f43d6b6491c2b7552601f2127926af1a3343f42611820a1ba9f245d3feaa65176a85600ec48af932bdca31c56df245b3c57553fb8949aa8efe7e8d587fc7df97f8e68fb386d1b61bbcac89a9823f232c07655ad5ce119e3726710ad3744457b90b2d6009a96498a1d13a2ca71ced8c568962162954656af3bd4b40c10ab34356e4b33119366646baa812d29063627d7b02959cf26859e8d49d56c48ac667da28ef509ba5bbfcc11fd009ea8bb8a49553b2d0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23971', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff61000002e649444154789c6d92495393591885fd2beeac76eb2ce2802376bb698702c29030890cda5d885184083612d10a210984106244434808432c4151ca469084e1634862049cf910d1722816ead6c71b2c171816e7aeee79ce7ddf735701abfe2ab8b6f6cf7cdbd4c17c9bef609e8df8bc460ee40a9db0b25f685f4e037b8f5bd8935d4f5c8691d8e4ff5e457c112d1dc25c23ccdfd5e65e54e56d28cbda48bbe02155e32145d34a72a90bc57917e21e71596662145a96018479526dbecf3ddf0cd3afde33f5f21d532f16083f9fe7f1b3370467e6084ccbbc7df791c5c545fe883df61b20af71b679e029a76aba4915c929a5ee25294a5c2489e4c4e21612ce3a97c6da9951170d88cf6d94ddc32fa97d10e65e78813bc105ba03f3dc9e7883579aa37d6416f7d06baef73d233eb7211a2096253b7dcf296af163ed7b8af16e109d57a2aa63944acf30173d1295de20d6de19b1544b34406c5a768811fe75f463ea0931fff91b739fbe220bcd7efccaeb0f5fd0b825ea7aa644232b00444db2bd6f9a93f607e8bbc368db25ca5c439434fb39d7344851938fe216097d5758d4591f0d101dcbd6de27e434f450753b4c656788f2f60025ad93a89de3143a244e3bc6a8ba15127fc11c0dd8936d91ebee86c8347471b12388c633c939d73845cd12ffdc1825ffda30f9f6612e7504d89db9420bbbb3ea65435780b42b9d9c774f70c63946e14d8982eb239cb00d91d5e0e7b8d54fb980eecaa88d06c4659a659d7782a48a56f1d49fa9b92235624ab7f848310da0340d8a9d8cb133dd140d109f43d6b6491c2b7552601f2127926af1a3343f42611820a1ba9f245d3feaa65176a85600ec48af932bdca31c56df245b3c57553fb8949aa8efe7e8d587fc7df97f8e68fb386d1b61bbcac89a9823f232c07655ad5ce119e3726710ad3744457b90b2d6009a96498a1d13a2ca71ced8c568962162954656af3bd4b40c10ab34356e4b33119366646baa812d29063627d7b02959cf26859e8d49d56c48ac667da28ef509ba5bbfcc11fd009ea8bb8a49553b2d0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23972', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23973', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23974', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23975', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23976', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23977', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000020449444154789ccd934b6b13511886bb70efce9fe0aa15d166447429882b37a21b6f2082da2c244aa1226817bd8010288d22229642a9608b4523824beba29ada766ca2994cd2daf4129a60333367ee672eaf5f52edc48d9bba10e6e13b67f13eef3970a60d40db6ed855f8df090a6f3ac5f2f445befae1720b9778f1edf125e975fb3e62ef1fa49becd911c869c109c38096217d0db6d79e5dc3fa4c97bb36d3e5fca632d7636f646e970baf0e9d8d04533135f46d38eb4998cb43305746609527117a0ab90c84be4e68db7baf0e04dc95a7845c247821b0806b144ec1280d837dedc556e6066ab37128d93e288bf7a18877505fe8261274b22ae4979d7a24988871cfda84924ba13e3f88eafb5bb0aa9fa895fd6a6f4c353a015d4f9e10ec48307e8437ef1f388405f86633e85b129c4a0af65a1facefdd308bd76048e7e11b79c863b116c1a8e086be059f7d84a7bc03ff310977f329051fc05ab90bab148759b800e3db69e8d913f07511f248abe089e0049c816fa5e156c7a8f521ec556a5d6eb45e85913f073d770aeccb3168f307e1b1cf901fb70a52313be40a8547e16c0cc12ef752380153be42e133d47a124c3c0a6dee00d4d9fd24c8a091891e52f27085ab25d5587a1e18c567d0e547d0a524f47c3f58ee1e58b607da62029a1887b6701d4e6d3aa48cba2390fadb6f4a831de3d240478da6fd57069a53a3ccf0fff133fd048dd11b320da1e05a0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23978', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000016b49444154789c95935dab0151148639bfe3a8f31f9cfccf535cf8016e24522e24246a8870319824b7446418637cbf67bf3b5be3e30c67d7d3ecda7b3d7bad352d1f009f589f82a020f4822fc1076314be8b20b8dd6ecdc3e1703a1e8f78863847381cfeb997284188c1ebf51ab66d5f592e97582c16984c2652321e8f1189446e245c7e0a78c1711cec763bf9259665c1344d4ca75329d86c36e023d168544a1e040c2e954ac8e572c8643248a55288c7e388c5620f255d7ae2bf118832ae17b867ddaa94d96c2633198d467f0b48b55a45b95c46b15844369b9599a4d369249349241209cce7736fc13d2a13d6cf9eac562b6f41abd542bd5e87a669a8542ab227854201f97c5ef686a27f65a0b2608309b3f114f47a3de8ba8e76bb8d66b38946a3815aad2661562f05ee57c97ebf7fc053301c0e31180cd0eff7611806badd2e3a9dce15f5ab9f09ce5e7db8e3c418f72c7c8b06d93c782758dcb538806e41809237c659c1d10f30f617ceb2a1320ff1b5ec0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('23979', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000100000001008060000001ff3ff610000016b49444154789c95935dab0151148639bfe3a8f31f9cfccf535cf8016e24522e24246a8870319824b7446418637cbf67bf3b5be3e30c67d7d3ecda7b3d7bad352d1f009f589f82a020f4822fc1076314be8b20b8dd6ecdc3e1703a1e8f78863847381cfeb997284188c1ebf51ab66d5f592e97582c16984c2652321e8f1189446e245c7e0a78c1711cec763bf9259665c1344d4ca75329d86c36e023d168544a1e040c2e954ac8e572c8643248a55288c7e388c5620f255d7ae2bf118832ae17b867ddaa94d96c2633198d467f0b48b55a45b95c46b15844369b9599a4d369249349241209cce7736fc13d2a13d6cf9eac562b6f41abd542bd5e87a669a8542ab227854201f97c5ef686a27f65a0b2608309b3f114f47a3de8ba8e76bb8d66b38946a3815aad2661562f05ee57c97ebf7fc053301c0e31180cd0eff7611806badd2e3a9dce15f5ab9f09ce5e7db8e3c418f72c7c8b06d93c782758dcb538806e41809237c659c1d10f30f617ceb2a1320ff1b5ec0000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

COMMIT;

SET search_path = public, pg_catalog;

--
-- TOC entry 2137 (class 2606 OID 22915)
-- Name: acl_aclentry_entries_pk_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY acl_aclentry
    ADD CONSTRAINT acl_aclentry_entries_pk_key UNIQUE (entries_pk);


--
-- TOC entry 2133 (class 2606 OID 22902)
-- Name: acl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY acl
    ADD CONSTRAINT acl_pkey PRIMARY KEY (managedobjectid);


--
-- TOC entry 2135 (class 2606 OID 22910)
-- Name: aclentry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY aclentry
    ADD CONSTRAINT aclentry_pkey PRIMARY KEY (pk);


--
-- TOC entry 2139 (class 2606 OID 22923)
-- Name: artifacttrigger_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY artifacttrigger
    ADD CONSTRAINT artifacttrigger_pkey PRIMARY KEY (id);


--
-- TOC entry 2143 (class 2606 OID 22936)
-- Name: attribute_dns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attribute_dns
    ADD CONSTRAINT attribute_dns_pkey PRIMARY KEY (attribute_id, p_index);


--
-- TOC entry 2145 (class 2606 OID 22941)
-- Name: attribute_listitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attribute_listitems
    ADD CONSTRAINT attribute_listitems_pkey PRIMARY KEY (attribute_id, p_index);


--
-- TOC entry 2141 (class 2606 OID 22931)
-- Name: attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attribute
    ADD CONSTRAINT attribute_pkey PRIMARY KEY (id);


--
-- TOC entry 2147 (class 2606 OID 22946)
-- Name: attribute_selecteddns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attribute_selecteddns
    ADD CONSTRAINT attribute_selecteddns_pkey PRIMARY KEY (attribute_id, sp_index);


--
-- TOC entry 2149 (class 2606 OID 22951)
-- Name: attribute_selecteditems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attribute_selecteditems
    ADD CONSTRAINT attribute_selecteditems_pkey PRIMARY KEY (attribute_id, p_index);


--
-- TOC entry 2151 (class 2606 OID 22956)
-- Name: axiomlock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY axiomlock
    ADD CONSTRAINT axiomlock_pkey PRIMARY KEY (artifactid);


--
-- TOC entry 2157 (class 2606 OID 22971)
-- Name: childhistory_childhistoryentry_entries_pk_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY childhistory_childhistoryentry
    ADD CONSTRAINT childhistory_childhistoryentry_entries_pk_key UNIQUE (entries_pk);


--
-- TOC entry 2153 (class 2606 OID 22961)
-- Name: childhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY childhistory
    ADD CONSTRAINT childhistory_pkey PRIMARY KEY (managedobjectid);


--
-- TOC entry 2155 (class 2606 OID 22966)
-- Name: childhistoryentry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY childhistoryentry
    ADD CONSTRAINT childhistoryentry_pkey PRIMARY KEY (pk);


--
-- TOC entry 2251 (class 2606 OID 23230)
-- Name: cndition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cndition
    ADD CONSTRAINT cndition_pkey PRIMARY KEY (pk);


--
-- TOC entry 2253 (class 2606 OID 23238)
-- Name: cndition_sortdescriptors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cndition_sortdescriptors
    ADD CONSTRAINT cndition_sortdescriptors_pkey PRIMARY KEY (cndition_pk, sd_index);


--
-- TOC entry 2159 (class 2606 OID 22979)
-- Name: configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT configuration_pkey PRIMARY KEY (id);


--
-- TOC entry 2161 (class 2606 OID 22987)
-- Name: consequence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY consequence
    ADD CONSTRAINT consequence_pkey PRIMARY KEY (pk);


--
-- TOC entry 2255 (class 2606 OID 23246)
-- Name: decision_cell_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY decision_cell
    ADD CONSTRAINT decision_cell_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 23258)
-- Name: decision_row_decision_cell_cells_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY decision_row_decision_cell
    ADD CONSTRAINT decision_row_decision_cell_cells_id_key UNIQUE (cells_id);


--
-- TOC entry 2261 (class 2606 OID 23256)
-- Name: decision_row_decision_cell_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY decision_row_decision_cell
    ADD CONSTRAINT decision_row_decision_cell_pkey PRIMARY KEY (decision_row_id, cell_index);


--
-- TOC entry 2257 (class 2606 OID 23251)
-- Name: decision_row_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY decision_row
    ADD CONSTRAINT decision_row_pkey PRIMARY KEY (id);


--
-- TOC entry 2165 (class 2606 OID 22997)
-- Name: decisionmatrix_decision_row_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY decisionmatrix_decision_row
    ADD CONSTRAINT decisionmatrix_decision_row_pkey PRIMARY KEY (decisionmatrix_pk, row_index);


--
-- TOC entry 2167 (class 2606 OID 22999)
-- Name: decisionmatrix_decision_row_rows_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY decisionmatrix_decision_row
    ADD CONSTRAINT decisionmatrix_decision_row_rows_id_key UNIQUE (rows_id);


--
-- TOC entry 2163 (class 2606 OID 22992)
-- Name: decisionmatrix_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY decisionmatrix
    ADD CONSTRAINT decisionmatrix_pkey PRIMARY KEY (pk);


--
-- TOC entry 2171 (class 2606 OID 23012)
-- Name: expression_expression_expressions_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY expression_expression
    ADD CONSTRAINT expression_expression_expressions_id_key UNIQUE (expressions_id);


--
-- TOC entry 2173 (class 2606 OID 23017)
-- Name: expression_linktype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY expression_linktype
    ADD CONSTRAINT expression_linktype_pkey PRIMARY KEY (expression_id, search_links);


--
-- TOC entry 2175 (class 2606 OID 23019)
-- Name: expression_linktype_searchablelinktypes_pk_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY expression_linktype
    ADD CONSTRAINT expression_linktype_searchablelinktypes_pk_key UNIQUE (searchablelinktypes_pk);


--
-- TOC entry 2169 (class 2606 OID 23007)
-- Name: expression_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY expression
    ADD CONSTRAINT expression_pkey PRIMARY KEY (id);


--
-- TOC entry 2177 (class 2606 OID 23024)
-- Name: fileartifact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fileartifact
    ADD CONSTRAINT fileartifact_pkey PRIMARY KEY (pk);


--
-- TOC entry 2179 (class 2606 OID 23029)
-- Name: id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY id
    ADD CONSTRAINT id_pkey PRIMARY KEY (typeordinal);


--
-- TOC entry 2181 (class 2606 OID 23034)
-- Name: latestversion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY latestversion
    ADD CONSTRAINT latestversion_pkey PRIMARY KEY (idnumber);


--
-- TOC entry 2183 (class 2606 OID 23042)
-- Name: licensekey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY licensekey
    ADD CONSTRAINT licensekey_pkey PRIMARY KEY (guid);


--
-- TOC entry 2185 (class 2606 OID 23047)
-- Name: lightweightnode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lightweightnode
    ADD CONSTRAINT lightweightnode_pkey PRIMARY KEY (pk);


--
-- TOC entry 2187 (class 2606 OID 23055)
-- Name: link_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY link
    ADD CONSTRAINT link_pkey PRIMARY KEY (id);


--
-- TOC entry 2189 (class 2606 OID 23060)
-- Name: linktype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY linktype
    ADD CONSTRAINT linktype_pkey PRIMARY KEY (pk);


--
-- TOC entry 2195 (class 2606 OID 23080)
-- Name: managedobject_attribute_attributes_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY managedobject_attribute
    ADD CONSTRAINT managedobject_attribute_attributes_id_key UNIQUE (attributes_id);


--
-- TOC entry 2197 (class 2606 OID 23078)
-- Name: managedobject_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY managedobject_attribute
    ADD CONSTRAINT managedobject_attribute_pkey PRIMARY KEY (managedobject_pk, attrib_index);


--
-- TOC entry 2199 (class 2606 OID 23085)
-- Name: managedobject_link_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY managedobject_link
    ADD CONSTRAINT managedobject_link_pkey PRIMARY KEY (managedobject_pk, link_index);


--
-- TOC entry 2201 (class 2606 OID 23092)
-- Name: managedobject_managedobject_embeddedobjects_pk_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY managedobject_managedobject
    ADD CONSTRAINT managedobject_managedobject_embeddedobjects_pk_key UNIQUE (embeddedobjects_pk);


--
-- TOC entry 2203 (class 2606 OID 23090)
-- Name: managedobject_managedobject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY managedobject_managedobject
    ADD CONSTRAINT managedobject_managedobject_pkey PRIMARY KEY (managedobject_pk, embed_index);


--
-- TOC entry 2193 (class 2606 OID 23073)
-- Name: managedobject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY managedobject
    ADD CONSTRAINT managedobject_pkey PRIMARY KEY (pk);


--
-- TOC entry 2205 (class 2606 OID 23097)
-- Name: managedobject_templatecontexts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY managedobject_templatecontexts
    ADD CONSTRAINT managedobject_templatecontexts_pkey PRIMARY KEY (managedobject_pk, tmp_index);


--
-- TOC entry 2209 (class 2606 OID 23112)
-- Name: message_message_messages_pk_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY message_message
    ADD CONSTRAINT message_message_messages_pk_key UNIQUE (messages_pk);


--
-- TOC entry 2211 (class 2606 OID 23110)
-- Name: message_message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY message_message
    ADD CONSTRAINT message_message_pkey PRIMARY KEY (message_pk, message_index);


--
-- TOC entry 2207 (class 2606 OID 23105)
-- Name: message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY message
    ADD CONSTRAINT message_pkey PRIMARY KEY (pk);


--
-- TOC entry 2213 (class 2606 OID 23123)
-- Name: metricevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY metricevent
    ADD CONSTRAINT metricevent_pkey PRIMARY KEY (id);


--
-- TOC entry 2191 (class 2606 OID 23065)
-- Name: mor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mor
    ADD CONSTRAINT mor_pkey PRIMARY KEY (id);


--
-- TOC entry 2215 (class 2606 OID 23131)
-- Name: principal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY principal
    ADD CONSTRAINT principal_pkey PRIMARY KEY (pk);


--
-- TOC entry 2263 (class 2606 OID 23263)
-- Name: rul_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rul
    ADD CONSTRAINT rul_pkey PRIMARY KEY (pk);


--
-- TOC entry 2217 (class 2606 OID 23136)
-- Name: runtimemetric_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY runtimemetric
    ADD CONSTRAINT runtimemetric_pkey PRIMARY KEY (id);


--
-- TOC entry 2219 (class 2606 OID 23141)
-- Name: seatusagerecord_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY seatusagerecord
    ADD CONSTRAINT seatusagerecord_pkey PRIMARY KEY (userdn);


--
-- TOC entry 2221 (class 2606 OID 23149)
-- Name: signature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY signature
    ADD CONSTRAINT signature_pkey PRIMARY KEY (pk);


--
-- TOC entry 2225 (class 2606 OID 23161)
-- Name: signature_signatureentry_entries_pk_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY signature_signatureentry
    ADD CONSTRAINT signature_signatureentry_entries_pk_key UNIQUE (entries_pk);


--
-- TOC entry 2227 (class 2606 OID 23159)
-- Name: signature_signatureentry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY signature_signatureentry
    ADD CONSTRAINT signature_signatureentry_pkey PRIMARY KEY (signature_pk, entry_index);


--
-- TOC entry 2223 (class 2606 OID 23154)
-- Name: signatureentry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY signatureentry
    ADD CONSTRAINT signatureentry_pkey PRIMARY KEY (pk);


--
-- TOC entry 2229 (class 2606 OID 23166)
-- Name: style_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY style
    ADD CONSTRAINT style_pkey PRIMARY KEY (id);


--
-- TOC entry 2231 (class 2606 OID 23171)
-- Name: systemadministrator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY systemadministrator
    ADD CONSTRAINT systemadministrator_pkey PRIMARY KEY (pk);


--
-- TOC entry 2233 (class 2606 OID 23176)
-- Name: treemodificationrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY treemodificationrecord
    ADD CONSTRAINT treemodificationrecord_pkey PRIMARY KEY (treemodificationid);


--
-- TOC entry 2235 (class 2606 OID 23181)
-- Name: treeview_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY treeview
    ADD CONSTRAINT treeview_pkey PRIMARY KEY (pk);


--
-- TOC entry 2239 (class 2606 OID 23193)
-- Name: treeview_treeviewconfiguration_configurations_pk_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY treeview_treeviewconfiguration
    ADD CONSTRAINT treeview_treeviewconfiguration_configurations_pk_key UNIQUE (configurations_pk);


--
-- TOC entry 2241 (class 2606 OID 23191)
-- Name: treeview_treeviewconfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY treeview_treeviewconfiguration
    ADD CONSTRAINT treeview_treeviewconfiguration_pkey PRIMARY KEY (treeview_pk, config_index);


--
-- TOC entry 2237 (class 2606 OID 23186)
-- Name: treeviewconfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY treeviewconfiguration
    ADD CONSTRAINT treeviewconfiguration_pkey PRIMARY KEY (pk);


--
-- TOC entry 2243 (class 2606 OID 23201)
-- Name: uiartifact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY uiartifact
    ADD CONSTRAINT uiartifact_pkey PRIMARY KEY (pk);


--
-- TOC entry 2245 (class 2606 OID 23209)
-- Name: uiartifactdescriptor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY uiartifactdescriptor
    ADD CONSTRAINT uiartifactdescriptor_pkey PRIMARY KEY (artifactid);


--
-- TOC entry 2247 (class 2606 OID 23217)
-- Name: updatebundledescriptor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY updatebundledescriptor
    ADD CONSTRAINT updatebundledescriptor_pkey PRIMARY KEY (id);


--
-- TOC entry 2249 (class 2606 OID 23222)
-- Name: viewpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY viewpermission
    ADD CONSTRAINT viewpermission_pkey PRIMARY KEY (pk);


--
-- TOC entry 2286 (class 2606 OID 23374)
-- Name: fk12af022cb10b6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mor
    ADD CONSTRAINT fk12af022cb10b6 FOREIGN KEY (managedobjectreferences_id) REFERENCES managedobject(pk);


--
-- TOC entry 2296 (class 2606 OID 23424)
-- Name: fk190fff8f4ba508c4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY message_message
    ADD CONSTRAINT fk190fff8f4ba508c4 FOREIGN KEY (message_pk) REFERENCES message(pk);


--
-- TOC entry 2295 (class 2606 OID 23419)
-- Name: fk190fff8f7c6ec55f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY message_message
    ADD CONSTRAINT fk190fff8f7c6ec55f FOREIGN KEY (messages_pk) REFERENCES message(pk);


--
-- TOC entry 2309 (class 2606 OID 23489)
-- Name: fk1ba89b1335d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rul
    ADD CONSTRAINT fk1ba89b1335d FOREIGN KEY (pk) REFERENCES managedobject(pk);


--
-- TOC entry 2303 (class 2606 OID 23459)
-- Name: fk1e82a086b1335d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY uiartifact
    ADD CONSTRAINT fk1e82a086b1335d FOREIGN KEY (pk) REFERENCES managedobject(pk);


--
-- TOC entry 2265 (class 2606 OID 23269)
-- Name: fk3546da5d2a1af7b0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl_aclentry
    ADD CONSTRAINT fk3546da5d2a1af7b0 FOREIGN KEY (entries_pk) REFERENCES aclentry(pk);


--
-- TOC entry 2264 (class 2606 OID 23264)
-- Name: fk3546da5dc37897b0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY acl_aclentry
    ADD CONSTRAINT fk3546da5dc37897b0 FOREIGN KEY (acl_managedobjectid) REFERENCES acl(managedobjectid);


--
-- TOC entry 2268 (class 2606 OID 23284)
-- Name: fk35e0d3bf3afc3dc7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attribute_listitems
    ADD CONSTRAINT fk35e0d3bf3afc3dc7 FOREIGN KEY (attribute_id) REFERENCES attribute(id);


--
-- TOC entry 2269 (class 2606 OID 23289)
-- Name: fk35e0d3bffca9af1a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attribute_listitems
    ADD CONSTRAINT fk35e0d3bffca9af1a FOREIGN KEY (attribute_id) REFERENCES attribute(id);


--
-- TOC entry 2297 (class 2606 OID 23429)
-- Name: fk39271b684ba508c4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY message_readbyuserids
    ADD CONSTRAINT fk39271b684ba508c4 FOREIGN KEY (message_pk) REFERENCES message(pk);


--
-- TOC entry 2284 (class 2606 OID 23364)
-- Name: fk4b088a743a40528a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY linktype
    ADD CONSTRAINT fk4b088a743a40528a FOREIGN KEY (style_id) REFERENCES style(id);


--
-- TOC entry 2285 (class 2606 OID 23369)
-- Name: fk4b088a74b1335d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY linktype
    ADD CONSTRAINT fk4b088a74b1335d FOREIGN KEY (pk) REFERENCES managedobject(pk);


--
-- TOC entry 2307 (class 2606 OID 23479)
-- Name: fk4e4a3c9d6a61aa6d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY decision_row_decision_cell
    ADD CONSTRAINT fk4e4a3c9d6a61aa6d FOREIGN KEY (decision_row_id) REFERENCES decision_row(id);


--
-- TOC entry 2308 (class 2606 OID 23484)
-- Name: fk4e4a3c9de7072efb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY decision_row_decision_cell
    ADD CONSTRAINT fk4e4a3c9de7072efb FOREIGN KEY (cells_id) REFERENCES decision_cell(id);


--
-- TOC entry 2292 (class 2606 OID 23404)
-- Name: fk4fc8dcbd6f7ccb9e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY managedobject_managedobject
    ADD CONSTRAINT fk4fc8dcbd6f7ccb9e FOREIGN KEY (managedobject_pk) REFERENCES managedobject(pk);


--
-- TOC entry 2293 (class 2606 OID 23409)
-- Name: fk4fc8dcbd8bdcc072; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY managedobject_managedobject
    ADD CONSTRAINT fk4fc8dcbd8bdcc072 FOREIGN KEY (embeddedobjects_pk) REFERENCES managedobject(pk);


--
-- TOC entry 2299 (class 2606 OID 23439)
-- Name: fk54357141c1fc4a34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY signature_signatureentry
    ADD CONSTRAINT fk54357141c1fc4a34 FOREIGN KEY (entries_pk) REFERENCES signatureentry(pk);


--
-- TOC entry 2298 (class 2606 OID 23434)
-- Name: fk54357141dc42ea0a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY signature_signatureentry
    ADD CONSTRAINT fk54357141dc42ea0a FOREIGN KEY (signature_pk) REFERENCES signature(pk);


--
-- TOC entry 2300 (class 2606 OID 23444)
-- Name: fk567a8783b1335d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY treeview
    ADD CONSTRAINT fk567a8783b1335d FOREIGN KEY (pk) REFERENCES managedobject(pk);


--
-- TOC entry 2282 (class 2606 OID 23354)
-- Name: fk5ea55c1b7553eb61; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY expression_linktype
    ADD CONSTRAINT fk5ea55c1b7553eb61 FOREIGN KEY (searchablelinktypes_pk) REFERENCES linktype(pk);


--
-- TOC entry 2281 (class 2606 OID 23349)
-- Name: fk5ea55c1b7f28f53d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY expression_linktype
    ADD CONSTRAINT fk5ea55c1b7f28f53d FOREIGN KEY (expression_id) REFERENCES expression(id);


--
-- TOC entry 2283 (class 2606 OID 23359)
-- Name: fk74f8778eb1335d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fileartifact
    ADD CONSTRAINT fk74f8778eb1335d FOREIGN KEY (pk) REFERENCES managedobject(pk);


--
-- TOC entry 2288 (class 2606 OID 23384)
-- Name: fk7970b31b6f7ccb9e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY managedobject_attribute
    ADD CONSTRAINT fk7970b31b6f7ccb9e FOREIGN KEY (managedobject_pk) REFERENCES managedobject(pk);


--
-- TOC entry 2289 (class 2606 OID 23389)
-- Name: fk7970b31b9e6b320f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY managedobject_attribute
    ADD CONSTRAINT fk7970b31b9e6b320f FOREIGN KEY (attributes_id) REFERENCES attribute(id);


--
-- TOC entry 2302 (class 2606 OID 23454)
-- Name: fk96369e7729bc7e90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY treeview_treeviewconfiguration
    ADD CONSTRAINT fk96369e7729bc7e90 FOREIGN KEY (configurations_pk) REFERENCES treeviewconfiguration(pk);


--
-- TOC entry 2301 (class 2606 OID 23449)
-- Name: fk96369e77b07afada; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY treeview_treeviewconfiguration
    ADD CONSTRAINT fk96369e77b07afada FOREIGN KEY (treeview_pk) REFERENCES treeview(pk);


--
-- TOC entry 2305 (class 2606 OID 23469)
-- Name: fk97a46544b1335d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cndition
    ADD CONSTRAINT fk97a46544b1335d FOREIGN KEY (pk) REFERENCES managedobject(pk);


--
-- TOC entry 2304 (class 2606 OID 23464)
-- Name: fk97a46544c75353dc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cndition
    ADD CONSTRAINT fk97a46544c75353dc FOREIGN KEY (rootexpression_id) REFERENCES expression(id);


--
-- TOC entry 2280 (class 2606 OID 23344)
-- Name: fkab7c729fbeccd57e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY expression_expression
    ADD CONSTRAINT fkab7c729fbeccd57e FOREIGN KEY (expression_id) REFERENCES expression(id);


--
-- TOC entry 2279 (class 2606 OID 23339)
-- Name: fkab7c729fe8d57c1a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY expression_expression
    ADD CONSTRAINT fkab7c729fe8d57c1a FOREIGN KEY (expressions_id) REFERENCES expression(id);


--
-- TOC entry 2276 (class 2606 OID 23324)
-- Name: fkabef59199aa09e6a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY decisionmatrix_decision_row
    ADD CONSTRAINT fkabef59199aa09e6a FOREIGN KEY (decisionmatrix_pk) REFERENCES decisionmatrix(pk);


--
-- TOC entry 2277 (class 2606 OID 23329)
-- Name: fkabef5919b6c0f04b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY decisionmatrix_decision_row
    ADD CONSTRAINT fkabef5919b6c0f04b FOREIGN KEY (rows_id) REFERENCES decision_row(id);


--
-- TOC entry 2287 (class 2606 OID 23379)
-- Name: fkb855b9e3818f812; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY managedobject
    ADD CONSTRAINT fkb855b9e3818f812 FOREIGN KEY (templatereference_id) REFERENCES mor(id);


--
-- TOC entry 2291 (class 2606 OID 23399)
-- Name: fkbb98141b2c7bf2eb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY managedobject_link
    ADD CONSTRAINT fkbb98141b2c7bf2eb FOREIGN KEY (links_id) REFERENCES link(id);


--
-- TOC entry 2290 (class 2606 OID 23394)
-- Name: fkbb98141b6f7ccb9e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY managedobject_link
    ADD CONSTRAINT fkbb98141b6f7ccb9e FOREIGN KEY (managedobject_pk) REFERENCES managedobject(pk);


--
-- TOC entry 2278 (class 2606 OID 23334)
-- Name: fkbcd6eb8b824eeaa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY expression
    ADD CONSTRAINT fkbcd6eb8b824eeaa FOREIGN KEY (attribute_id) REFERENCES attribute(id);


--
-- TOC entry 2270 (class 2606 OID 23294)
-- Name: fkbd629b6bfb772ecf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attribute_selecteddns
    ADD CONSTRAINT fkbd629b6bfb772ecf FOREIGN KEY (attribute_id) REFERENCES attribute(id);


--
-- TOC entry 2294 (class 2606 OID 23414)
-- Name: fkd5e48dbf6f7ccb9e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY managedobject_templatecontexts
    ADD CONSTRAINT fkd5e48dbf6f7ccb9e FOREIGN KEY (managedobject_pk) REFERENCES managedobject(pk);


--
-- TOC entry 2266 (class 2606 OID 23274)
-- Name: fkd94464e6a643fb1c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attribute_dns
    ADD CONSTRAINT fkd94464e6a643fb1c FOREIGN KEY (attribute_id) REFERENCES attribute(id);


--
-- TOC entry 2267 (class 2606 OID 23279)
-- Name: fkd94464e6fb772ecf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attribute_dns
    ADD CONSTRAINT fkd94464e6fb772ecf FOREIGN KEY (attribute_id) REFERENCES attribute(id);


--
-- TOC entry 2272 (class 2606 OID 23304)
-- Name: fkdc7eaed31edc9ca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY childhistory_childhistoryentry
    ADD CONSTRAINT fkdc7eaed31edc9ca FOREIGN KEY (childhistory_managedobjectid) REFERENCES childhistory(managedobjectid);


--
-- TOC entry 2273 (class 2606 OID 23309)
-- Name: fkdc7eaed3266d3484; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY childhistory_childhistoryentry
    ADD CONSTRAINT fkdc7eaed3266d3484 FOREIGN KEY (entries_pk) REFERENCES childhistoryentry(pk);


--
-- TOC entry 2274 (class 2606 OID 23314)
-- Name: fke98aff23b1335d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY consequence
    ADD CONSTRAINT fke98aff23b1335d FOREIGN KEY (pk) REFERENCES managedobject(pk);


--
-- TOC entry 2271 (class 2606 OID 23299)
-- Name: fkef8101623afc3dc7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attribute_selecteditems
    ADD CONSTRAINT fkef8101623afc3dc7 FOREIGN KEY (attribute_id) REFERENCES attribute(id);


--
-- TOC entry 2306 (class 2606 OID 23474)
-- Name: fkf2acf16b84841661; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cndition_sortdescriptors
    ADD CONSTRAINT fkf2acf16b84841661 FOREIGN KEY (cndition_pk) REFERENCES cndition(pk);


--
-- TOC entry 2275 (class 2606 OID 23319)
-- Name: fkffad2addb1335d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY decisionmatrix
    ADD CONSTRAINT fkffad2addb1335d FOREIGN KEY (pk) REFERENCES managedobject(pk);


--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-09-17 00:04:50

--
-- PostgreSQL database dump complete
--

