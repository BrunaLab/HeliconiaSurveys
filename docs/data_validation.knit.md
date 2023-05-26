---
title: "Data Validation: _Heliconia_ Demography Project"
author: Eric R. Scott & Emilio M. Bruna
date: "26 May, 2023"
output: html_document
---

We use the R package [`pointblank`](https://rich-iannone.github.io/pointblank/) to review and validate the demographic data set (`HDP_1997_2009.csv`) and plot-level descriptors (`HDP_plots.csv`) published in Bruna et al. (2023) and archived in the Dryad online data repository. The report below includes:

1. the different validation tests that were conducted, 
1. the date of the most recent test, 
1. each test's criteria for 'pass', 'warn' and 'stop', 
1. the number of 'units' (i.e., rows or columns) assessed in each test, 
1. how many of these units passed or failed, and
1. a button for downloading a .csv file of the records flagged by a particular validation test. _Note that these are not necessarily errors_. For instance, the validation procedure for 'plant size - height' returns as 'stop' all plants >2 m tall. _Heliconia_ plants can exceed this threshold; this test is simply designed to flag any such individuals. In contrast, the data set should not have any duplicated rows. A notification of 'fail' for this test indicates an error that can be corrected by downloading the csv file, reviewing the duplicated rows, and uploading the necessary corrections. 












-----

# Dataset Structure: _Data types_

Tests to determine if columns are correctly coded as integer, character, etc.   
**Test criteria**: Strict ('stop' if *any* rows fail).


```{=html}
<div id="pb_agent" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>@import url("https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");
@import url("https://unpkg.com/balloon-css/balloon.min.css");
#pb_agent table {
  font-family: 'IBM Plex Sans', system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#pb_agent thead, #pb_agent tbody, #pb_agent tfoot, #pb_agent tr, #pb_agent td, #pb_agent th {
  border-style: none;
}

#pb_agent p {
  margin: 0;
  padding: 0;
}

#pb_agent .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 90%;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#pb_agent .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#pb_agent .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#pb_agent .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#pb_agent .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#pb_agent .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#pb_agent .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#pb_agent .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#pb_agent .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#pb_agent .gt_spanner_row {
  border-bottom-style: hidden;
}

#pb_agent .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#pb_agent .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#pb_agent .gt_from_md > :first-child {
  margin-top: 0;
}

#pb_agent .gt_from_md > :last-child {
  margin-bottom: 0;
}

#pb_agent .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#pb_agent .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#pb_agent .gt_row_group_first td {
  border-top-width: 2px;
}

#pb_agent .gt_row_group_first th {
  border-top-width: 2px;
}

#pb_agent .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#pb_agent .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#pb_agent .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#pb_agent .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#pb_agent .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_left {
  text-align: left;
}

#pb_agent .gt_center {
  text-align: center;
}

#pb_agent .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#pb_agent .gt_font_normal {
  font-weight: normal;
}

#pb_agent .gt_font_bold {
  font-weight: bold;
}

#pb_agent .gt_font_italic {
  font-style: italic;
}

#pb_agent .gt_super {
  font-size: 65%;
}

#pb_agent .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#pb_agent .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#pb_agent .gt_indent_1 {
  text-indent: 5px;
}

#pb_agent .gt_indent_2 {
  text-indent: 10px;
}

#pb_agent .gt_indent_3 {
  text-indent: 15px;
}

#pb_agent .gt_indent_4 {
  text-indent: 20px;
}

#pb_agent .gt_indent_5 {
  text-indent: 25px;
}

#pb_agent {
  -webkit-font-smoothing: antialiased;
}

#pb_agent .gt_row {
  overflow: visible;
}

#pb_agent .gt_sourcenote {
  height: 35px;
  padding: 0;
}

#pb_agent code {
  font-family: 'IBM Plex Mono', monospace, courier;
  background-color: transparent;
  padding: 0;
}
</style>
<table class="gt_table" style="table-layout: fixed;; width: 0px" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <colgroup>
    <col style="width:6px;"/>
    <col style="width:35px;"/>
    <col style="width:190px;"/>
    <col style="width:120px;"/>
    <col style="width:120px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:30px;"/>
    <col style="width:30px;"/>
    <col style="width:30px;"/>
    <col style="width:65px;"/>
  </colgroup>
  <thead>
    <tr class="gt_heading">
      <td colspan="14" class="gt_heading gt_title gt_font_normal" style="color: #444444; font-size: 28px; text-align: left; font-weight: 500;">Pointblank Validation</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="14" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="font-size: 12px; text-align: left;"><span style="text-decoration-style:solid;text-decoration-color:#ADD8E6;text-decoration-line:underline;text-underline-position:under;color:#333333;font-variant-numeric:tabular-nums;padding-left:4px;margin-right:5px;padding-right:2px;">Data Validation</span></p>
<div style="height:25px;"><span style="background-color: #F1D35A;color: #222222;padding: 0.5em 0.5em;position: inherit;text-transform: uppercase;margin: 5px 1px 5px 4px;font-weight: bold;border: solid 1px #F1D35A;padding: 2px 10px 2px 10px;font-size: smaller;">tibble</span><span style="background-color:#E5AB00;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 5px;font-weight:bold;border:solid 1px #E5AB00;padding:2px 15px 2px 15px;font-size:smaller;">WARN</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #E5AB00;padding:2px 15px 2px 15px;font-size:smaller;">1</span>
<span style="background-color:#D0182F;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 1px;font-weight:bold;border:solid 1px #D0182F;padding:2px 15px 2px 15px;font-size:smaller;">STOP</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #D0182F;padding:2px 15px 2px 15px;font-size:smaller;">0.02</span>
<span style="background-color:#499FFE;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 1px;font-weight:bold;border:solid 1px #499FFE;padding:2px 15px 2px 15px;font-size:smaller;">NOTIFY</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #499FFE;padding:2px 15px 2px 15px;font-size:smaller;">&mdash;</span></div>
</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="STEP">STEP</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="COLUMNS">COLUMNS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="VALUES">VALUES</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="TBL">TBL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="EVAL">EVAL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="UNITS">UNITS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="PASS">PASS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="FAIL">FAIL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="W">W</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="S">S</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="N">N</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="EXT">EXT</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">1</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect that values should agree with the given R expression. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 66" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>col_vals_expr</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_expr" transform="translate(0.000000, 0.000000)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <path d="M22.1682701,14.6021863 L22.1682701,17.9472433 L25.5133271,17.9472433 C26.8395904,17.9472433 28.0482531,18.7508414 28.544785,19.9856375 L31.2103774,26.623485 L20.4957415,51.3978137 L24.1543977,51.3978137 L32.9351724,31.0138724 L39.4684869,47.2687589 C40.4680837,49.7644859 42.8984767,51.3978137 45.5836693,51.3978137 L48.9287264,51.3978137 L48.9287264,48.0527567 L45.5836693,48.0527567 C44.2508732,48.0527567 43.0487433,47.2491586 42.5522114,46.0143625 L31.6285095,18.7312411 C30.6289128,16.2355157 28.1985198,14.6021863 25.5133271,14.6021863 L22.1682701,14.6021863 Z" id="lambda" fill="#000000" fill-rule="nonzero"></path>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">Height is measured to nearest cm</p>
    <p style="margin:0;">
      <code style="font-size:11px;">col_vals_expr()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="ht%%1 == 0" data-balloon-pos="left"><p style="margin-top: 0px; margin-bottom: 0px; font-size: 11px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><code>ht%%1 == 0</code></p></div>
</div></td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>57K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>57K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">2</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect that values should agree with the given R expression. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 66" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>col_vals_expr</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_expr" transform="translate(0.000000, 0.000000)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <path d="M22.1682701,14.6021863 L22.1682701,17.9472433 L25.5133271,17.9472433 C26.8395904,17.9472433 28.0482531,18.7508414 28.544785,19.9856375 L31.2103774,26.623485 L20.4957415,51.3978137 L24.1543977,51.3978137 L32.9351724,31.0138724 L39.4684869,47.2687589 C40.4680837,49.7644859 42.8984767,51.3978137 45.5836693,51.3978137 L48.9287264,51.3978137 L48.9287264,48.0527567 L45.5836693,48.0527567 C44.2508732,48.0527567 43.0487433,47.2491586 42.5522114,46.0143625 L31.6285095,18.7312411 C30.6289128,16.2355157 28.1985198,14.6021863 25.5133271,14.6021863 L22.1682701,14.6021863 Z" id="lambda" fill="#000000" fill-rule="nonzero"></path>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">Shoots is interger</p>
    <p style="margin:0;">
      <code style="font-size:11px;">col_vals_expr()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="shts%%1 == 0" data-balloon-pos="left"><p style="margin-top: 0px; margin-bottom: 0px; font-size: 11px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><code>shts%%1 == 0</code></p></div>
</div></td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>57K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>57K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">3</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect that values should agree with the given R expression. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 66" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>col_vals_expr</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_expr" transform="translate(0.000000, 0.000000)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <path d="M22.1682701,14.6021863 L22.1682701,17.9472433 L25.5133271,17.9472433 C26.8395904,17.9472433 28.0482531,18.7508414 28.544785,19.9856375 L31.2103774,26.623485 L20.4957415,51.3978137 L24.1543977,51.3978137 L32.9351724,31.0138724 L39.4684869,47.2687589 C40.4680837,49.7644859 42.8984767,51.3978137 45.5836693,51.3978137 L48.9287264,51.3978137 L48.9287264,48.0527567 L45.5836693,48.0527567 C44.2508732,48.0527567 43.0487433,47.2491586 42.5522114,46.0143625 L31.6285095,18.7312411 C30.6289128,16.2355157 28.1985198,14.6021863 25.5133271,14.6021863 L22.1682701,14.6021863 Z" id="lambda" fill="#000000" fill-rule="nonzero"></path>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">Number of inflorescences is integer</p>
    <p style="margin:0;">
      <code style="font-size:11px;">col_vals_expr()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="infl%%1 == 0" data-balloon-pos="left"><p style="margin-top: 0px; margin-bottom: 0px; font-size: 11px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><code>infl%%1 == 0</code></p></div>
</div></td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>2K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>2K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="14"><span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin-left:10px;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;padding:2px 10px 2px 10px;">2023-05-26 09:59:28 EDT</span>
<span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;margin:5px 1px 5px 0;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;">&lt; 1 s</span>
<span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 1px 5px -1px;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;">2023-05-26 09:59:28 EDT</span></td>
    </tr>
  </tfoot>
  
</table>
</div>
```


-----

# Dataset Structure: _Plot & Subplot IDs_

Test for any nonexistent values of `plot_id` (e.g., 'FF-10', 'CF-23') or `subplot` (e.g., 'H23', 'A11').  
**Test criteria**: Strict ('stop' if *any* rows fail).



```{=html}
<div id="pb_agent" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>@import url("https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");
@import url("https://unpkg.com/balloon-css/balloon.min.css");
#pb_agent table {
  font-family: 'IBM Plex Sans', system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#pb_agent thead, #pb_agent tbody, #pb_agent tfoot, #pb_agent tr, #pb_agent td, #pb_agent th {
  border-style: none;
}

#pb_agent p {
  margin: 0;
  padding: 0;
}

#pb_agent .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 90%;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#pb_agent .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#pb_agent .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#pb_agent .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#pb_agent .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#pb_agent .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#pb_agent .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#pb_agent .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#pb_agent .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#pb_agent .gt_spanner_row {
  border-bottom-style: hidden;
}

#pb_agent .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#pb_agent .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#pb_agent .gt_from_md > :first-child {
  margin-top: 0;
}

#pb_agent .gt_from_md > :last-child {
  margin-bottom: 0;
}

#pb_agent .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#pb_agent .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#pb_agent .gt_row_group_first td {
  border-top-width: 2px;
}

#pb_agent .gt_row_group_first th {
  border-top-width: 2px;
}

#pb_agent .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#pb_agent .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#pb_agent .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#pb_agent .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#pb_agent .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_left {
  text-align: left;
}

#pb_agent .gt_center {
  text-align: center;
}

#pb_agent .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#pb_agent .gt_font_normal {
  font-weight: normal;
}

#pb_agent .gt_font_bold {
  font-weight: bold;
}

#pb_agent .gt_font_italic {
  font-style: italic;
}

#pb_agent .gt_super {
  font-size: 65%;
}

#pb_agent .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#pb_agent .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#pb_agent .gt_indent_1 {
  text-indent: 5px;
}

#pb_agent .gt_indent_2 {
  text-indent: 10px;
}

#pb_agent .gt_indent_3 {
  text-indent: 15px;
}

#pb_agent .gt_indent_4 {
  text-indent: 20px;
}

#pb_agent .gt_indent_5 {
  text-indent: 25px;
}

#pb_agent {
  -webkit-font-smoothing: antialiased;
}

#pb_agent .gt_row {
  overflow: visible;
}

#pb_agent .gt_sourcenote {
  height: 35px;
  padding: 0;
}

#pb_agent code {
  font-family: 'IBM Plex Mono', monospace, courier;
  background-color: transparent;
  padding: 0;
}
</style>
<table class="gt_table" style="table-layout: fixed;; width: 0px" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <colgroup>
    <col style="width:6px;"/>
    <col style="width:35px;"/>
    <col style="width:190px;"/>
    <col style="width:120px;"/>
    <col style="width:120px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:30px;"/>
    <col style="width:30px;"/>
    <col style="width:30px;"/>
    <col style="width:65px;"/>
  </colgroup>
  <thead>
    <tr class="gt_heading">
      <td colspan="14" class="gt_heading gt_title gt_font_normal" style="color: #444444; font-size: 28px; text-align: left; font-weight: 500;">Pointblank Validation</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="14" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="font-size: 12px; text-align: left;"><span style="text-decoration-style:solid;text-decoration-color:#ADD8E6;text-decoration-line:underline;text-underline-position:under;color:#333333;font-variant-numeric:tabular-nums;padding-left:4px;margin-right:5px;padding-right:2px;">Data Validation</span></p>
<div style="height:25px;"><span style="background-color: #F1D35A;color: #222222;padding: 0.5em 0.5em;position: inherit;text-transform: uppercase;margin: 5px 1px 5px 4px;font-weight: bold;border: solid 1px #F1D35A;padding: 2px 10px 2px 10px;font-size: smaller;">tibble</span><span style="background-color:#E5AB00;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 5px;font-weight:bold;border:solid 1px #E5AB00;padding:2px 15px 2px 15px;font-size:smaller;">WARN</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #E5AB00;padding:2px 15px 2px 15px;font-size:smaller;">1</span>
<span style="background-color:#D0182F;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 1px;font-weight:bold;border:solid 1px #D0182F;padding:2px 15px 2px 15px;font-size:smaller;">STOP</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #D0182F;padding:2px 15px 2px 15px;font-size:smaller;">0.02</span>
<span style="background-color:#499FFE;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 1px;font-weight:bold;border:solid 1px #499FFE;padding:2px 15px 2px 15px;font-size:smaller;">NOTIFY</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #499FFE;padding:2px 15px 2px 15px;font-size:smaller;">&mdash;</span></div>
</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="STEP">STEP</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="COLUMNS">COLUMNS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="VALUES">VALUES</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="TBL">TBL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="EVAL">EVAL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="UNITS">UNITS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="PASS">PASS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="FAIL">FAIL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="W">W</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="S">S</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="N">N</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="EXT">EXT</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">1</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect that values in `plot_id` should be in the set of `CF-1`, `CF-2`, `CF-3` (and 10 more). " data-balloon-pos="right" style="width:fit-content;">
  <div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>col_vals_in_set</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_in_set" transform="translate(0.000000, 0.172414)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <path d="M44.127969,41.1538382 L31.0814568,41.1538382 C29.9510748,41.1536429 28.8827052,40.9256134 27.9079888,40.5136953 C26.4467442,39.8960136 25.19849,38.8599685 24.3189894,37.5577099 C23.8792391,36.906727 23.5314818,36.1899233 23.2936866,35.4252675 C23.2130217,35.16589 23.1460289,34.9005554 23.0913409,34.6307286 L44.1278714,34.6307286 C45.028466,34.6306309 45.7586488,33.9004481 45.7586488,32.9998535 C45.7586488,32.0992589 45.028466,31.3690761 44.1278714,31.3690761 L23.0905596,31.3690761 C23.1990567,30.8337194 23.3597028,30.3180894 23.5675173,29.8264831 C24.185199,28.3652386 25.2212442,27.1169844 26.5236004,26.2374838 C27.1745833,25.7977334 27.891387,25.4499762 28.6560428,25.2122786 C29.4208939,24.9744833 30.2334994,24.8459665 31.0813591,24.8459665 L44.1277737,24.8459665 C45.0283683,24.8459665 45.7586488,24.1157837 45.7586488,23.2151891 C45.7586488,22.3145945 45.0283683,21.5844117 44.1277737,21.5844117 L31.0813591,21.5844117 C29.5096643,21.5844117 28.0039858,21.9038483 26.6373711,22.4820765 C24.5866678,23.3498583 22.8469049,24.7950871 21.6163267,26.616296 C20.3856508,28.4362354 19.665136,30.6413347 19.6658191,33.0000488 C19.6658191,34.5717436 19.9852563,36.0774222 20.5635822,37.4440369 C21.4312663,39.4947402 22.8765927,41.2345031 24.697704,42.4650813 C26.5176434,43.6957572 28.7227427,44.4155883 31.0814568,44.4155883 L44.1278714,44.4155883 C45.028466,44.4155883 45.7586488,43.6854055 45.7586488,42.7848109 C45.7586488,41.8842163 45.0285636,41.1538382 44.127969,41.1538382 Z" id="set_of" fill="#000000" fill-rule="nonzero"></path>        </g>    </g></svg></div>
  <code style="font-size:11px;">&nbsp;col_vals_in_set()</code>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="plot_id" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>plot_id</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="CF-1, CF-2, CF-3, CF-4, CF-5, CF-6, FF-1, FF-2, FF-3, FF-4, FF-5, FF-6, FF-7" data-balloon-pos="left"><p style="margin-top: 0px; margin-bottom: 0px; font-size: 11px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><code>CF-1, CF-2, CF-3, CF-4, CF-5, CF-6, FF-1, FF-2, FF-3, FF-4, FF-5, FF-6, FF-7</code></p></div>
</div></td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>67K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>67K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">2</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect that values in `subplot` should be in the set of `A1`, `A2`, `A3` (and 97 more). " data-balloon-pos="right" style="width:fit-content;">
  <div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>col_vals_in_set</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_in_set" transform="translate(0.000000, 0.172414)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <path d="M44.127969,41.1538382 L31.0814568,41.1538382 C29.9510748,41.1536429 28.8827052,40.9256134 27.9079888,40.5136953 C26.4467442,39.8960136 25.19849,38.8599685 24.3189894,37.5577099 C23.8792391,36.906727 23.5314818,36.1899233 23.2936866,35.4252675 C23.2130217,35.16589 23.1460289,34.9005554 23.0913409,34.6307286 L44.1278714,34.6307286 C45.028466,34.6306309 45.7586488,33.9004481 45.7586488,32.9998535 C45.7586488,32.0992589 45.028466,31.3690761 44.1278714,31.3690761 L23.0905596,31.3690761 C23.1990567,30.8337194 23.3597028,30.3180894 23.5675173,29.8264831 C24.185199,28.3652386 25.2212442,27.1169844 26.5236004,26.2374838 C27.1745833,25.7977334 27.891387,25.4499762 28.6560428,25.2122786 C29.4208939,24.9744833 30.2334994,24.8459665 31.0813591,24.8459665 L44.1277737,24.8459665 C45.0283683,24.8459665 45.7586488,24.1157837 45.7586488,23.2151891 C45.7586488,22.3145945 45.0283683,21.5844117 44.1277737,21.5844117 L31.0813591,21.5844117 C29.5096643,21.5844117 28.0039858,21.9038483 26.6373711,22.4820765 C24.5866678,23.3498583 22.8469049,24.7950871 21.6163267,26.616296 C20.3856508,28.4362354 19.665136,30.6413347 19.6658191,33.0000488 C19.6658191,34.5717436 19.9852563,36.0774222 20.5635822,37.4440369 C21.4312663,39.4947402 22.8765927,41.2345031 24.697704,42.4650813 C26.5176434,43.6957572 28.7227427,44.4155883 31.0814568,44.4155883 L44.1278714,44.4155883 C45.028466,44.4155883 45.7586488,43.6854055 45.7586488,42.7848109 C45.7586488,41.8842163 45.0285636,41.1538382 44.127969,41.1538382 Z" id="set_of" fill="#000000" fill-rule="nonzero"></path>        </g>    </g></svg></div>
  <code style="font-size:11px;">&nbsp;col_vals_in_set()</code>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="subplot" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>subplot</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, G1, G2, G3, G4, G5, G6, G7, G8, G9, G10, H1, H2, H3, H4, H5, H6, H7, H8, H9, H10, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, J1, J2, J3, J4, J5, J6, J7, J8, J9, J10" data-balloon-pos="left"><p style="margin-top: 0px; margin-bottom: 0px; font-size: 11px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><code>A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, G1, G2, G3, G4, G5, G6, G7, G8, G9, G10, H1, H2, H3, H4, H5, H6, H7, H8, H9, H10, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, J1, J2, J3, J4, J5, J6, J7, J8, J9, J10</code></p></div>
</div></td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>67K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>67K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="14"><span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin-left:10px;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;padding:2px 10px 2px 10px;">2023-05-26 09:59:29 EDT</span>
<span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;margin:5px 1px 5px 0;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;">&lt; 1 s</span>
<span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 1px 5px -1px;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;">2023-05-26 09:59:29 EDT</span></td>
    </tr>
  </tfoot>
  
</table>
</div>
```


# Dataset Structure: _Duplicated or Missing Values_

Tests for duplicated rows, missing `plant_ID` numbers, or duplicate `plant_id` numbers (test is done for every survey year).  
**Test criteria**: Strict ('stop' if *any* rows fail).


```{=html}
<div id="pb_agent" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>@import url("https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");
@import url("https://unpkg.com/balloon-css/balloon.min.css");
#pb_agent table {
  font-family: 'IBM Plex Sans', system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#pb_agent thead, #pb_agent tbody, #pb_agent tfoot, #pb_agent tr, #pb_agent td, #pb_agent th {
  border-style: none;
}

#pb_agent p {
  margin: 0;
  padding: 0;
}

#pb_agent .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 90%;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#pb_agent .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#pb_agent .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#pb_agent .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#pb_agent .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#pb_agent .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#pb_agent .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#pb_agent .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#pb_agent .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#pb_agent .gt_spanner_row {
  border-bottom-style: hidden;
}

#pb_agent .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#pb_agent .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#pb_agent .gt_from_md > :first-child {
  margin-top: 0;
}

#pb_agent .gt_from_md > :last-child {
  margin-bottom: 0;
}

#pb_agent .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#pb_agent .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#pb_agent .gt_row_group_first td {
  border-top-width: 2px;
}

#pb_agent .gt_row_group_first th {
  border-top-width: 2px;
}

#pb_agent .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#pb_agent .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#pb_agent .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#pb_agent .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#pb_agent .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_left {
  text-align: left;
}

#pb_agent .gt_center {
  text-align: center;
}

#pb_agent .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#pb_agent .gt_font_normal {
  font-weight: normal;
}

#pb_agent .gt_font_bold {
  font-weight: bold;
}

#pb_agent .gt_font_italic {
  font-style: italic;
}

#pb_agent .gt_super {
  font-size: 65%;
}

#pb_agent .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#pb_agent .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#pb_agent .gt_indent_1 {
  text-indent: 5px;
}

#pb_agent .gt_indent_2 {
  text-indent: 10px;
}

#pb_agent .gt_indent_3 {
  text-indent: 15px;
}

#pb_agent .gt_indent_4 {
  text-indent: 20px;
}

#pb_agent .gt_indent_5 {
  text-indent: 25px;
}

#pb_agent {
  -webkit-font-smoothing: antialiased;
}

#pb_agent .gt_row {
  overflow: visible;
}

#pb_agent .gt_sourcenote {
  height: 35px;
  padding: 0;
}

#pb_agent code {
  font-family: 'IBM Plex Mono', monospace, courier;
  background-color: transparent;
  padding: 0;
}
</style>
<table class="gt_table" style="table-layout: fixed;; width: 0px" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <colgroup>
    <col style="width:6px;"/>
    <col style="width:35px;"/>
    <col style="width:190px;"/>
    <col style="width:120px;"/>
    <col style="width:120px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:30px;"/>
    <col style="width:30px;"/>
    <col style="width:30px;"/>
    <col style="width:65px;"/>
  </colgroup>
  <thead>
    <tr class="gt_heading">
      <td colspan="14" class="gt_heading gt_title gt_font_normal" style="color: #444444; font-size: 28px; text-align: left; font-weight: 500;">Pointblank Validation</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="14" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="font-size: 12px; text-align: left;"><span style="text-decoration-style:solid;text-decoration-color:#ADD8E6;text-decoration-line:underline;text-underline-position:under;color:#333333;font-variant-numeric:tabular-nums;padding-left:4px;margin-right:5px;padding-right:2px;">Data Validation</span></p>
<div style="height:25px;"><span style="background-color: #F1D35A;color: #222222;padding: 0.5em 0.5em;position: inherit;text-transform: uppercase;margin: 5px 1px 5px 4px;font-weight: bold;border: solid 1px #F1D35A;padding: 2px 10px 2px 10px;font-size: smaller;">tibble</span><span style="background-color:#E5AB00;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 5px;font-weight:bold;border:solid 1px #E5AB00;padding:2px 15px 2px 15px;font-size:smaller;">WARN</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #E5AB00;padding:2px 15px 2px 15px;font-size:smaller;">1</span>
<span style="background-color:#D0182F;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 1px;font-weight:bold;border:solid 1px #D0182F;padding:2px 15px 2px 15px;font-size:smaller;">STOP</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #D0182F;padding:2px 15px 2px 15px;font-size:smaller;">0.02</span>
<span style="background-color:#499FFE;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 1px;font-weight:bold;border:solid 1px #499FFE;padding:2px 15px 2px 15px;font-size:smaller;">NOTIFY</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #499FFE;padding:2px 15px 2px 15px;font-size:smaller;">&mdash;</span></div>
</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="STEP">STEP</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="COLUMNS">COLUMNS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="VALUES">VALUES</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="TBL">TBL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="EVAL">EVAL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="UNITS">UNITS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="PASS">PASS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="FAIL">FAIL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="W">W</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="S">S</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="N">N</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="EXT">EXT</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">1</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect entirely distinct rows across all columns. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>rows_distinct</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="rows_distinct" transform="translate(0.000000, 0.482759)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <g id="no_gemini" transform="translate(17.000000, 13.000000)">                <path d="M3.66705619,6.62107508 C3.12510104,6.64066386 2.67455974,7.04767444 2.60273432,7.58527682 C2.52873228,8.1228792 2.85303526,8.6343627 3.37104848,8.79760239 C4.40489909,9.15455286 6.70113553,9.87063021 9.86580595,10.364702 L9.86580595,30.7369976 C6.65978137,31.2332458 4.37225104,31.964559 3.37104848,32.3215095 C2.78991555,32.5282797 2.48520173,33.1681784 2.69197196,33.7493114 C2.8987422,34.3304443 3.53864094,34.6351581 4.11977387,34.4283879 C5.54975217,33.9190808 10.2031678,32.4608072 16.5172734,32.4608072 C22.7943781,32.4608072 27.5500901,33.8907855 29.0540706,34.4109757 C29.6352036,34.6133926 30.2707495,34.304326 30.4731664,33.7231931 C30.6755833,33.1420601 30.3665167,32.5065142 29.7853838,32.3040973 C28.7493568,31.9449704 26.4313554,31.2441283 23.2383897,30.7544098 L23.2383897,10.3821143 C26.4444143,9.88804243 28.745004,9.16108259 29.7679716,8.79760239 C30.3491045,8.59083215 30.6538184,7.95093341 30.4470481,7.36980048 C30.2402779,6.78866755 29.6003791,6.48395373 29.0192462,6.69072396 C27.5587963,7.20873774 22.9162637,8.65830464 16.6391589,8.65830464 C10.3707603,8.65830464 5.61287188,7.21309051 4.10236166,6.69072396 C3.96306391,6.6384873 3.81506005,6.61454548 3.66705619,6.62107508 Z M12.0945699,10.6432975 C13.4940771,10.789125 15.0198226,10.8870686 16.6391589,10.8870686 C18.1997289,10.8870686 19.6623552,10.7978311 21.0096257,10.6607098 L21.0096257,30.4584021 C19.623178,30.316928 18.1191975,30.2320433 16.5172734,30.2320433 C14.9327615,30.2320433 13.4570763,30.3191044 12.0945699,30.4584021 L12.0945699,10.6432975 Z" id="gemini" stroke="#000000" stroke-width="2" fill="#000000" fill-rule="nonzero"></path>                <path d="M16.6605354,-5.05929499 C16.9366778,-5.05929499 17.1605354,-4.83543737 17.1605354,-4.55929499 L17.1605354,44.5687509 C17.1605354,44.8448933 16.9366778,45.0687509 16.6605354,45.0687509 C16.384393,45.0687509 16.1605354,44.8448933 16.1605354,44.5687509 L16.1605354,-4.55929499 C16.1605354,-4.83543737 16.384393,-5.05929499 16.6605354,-5.05929499 Z" id="line_black" fill="#000000" transform="translate(16.660535, 20.004728) rotate(-320.000000) translate(-16.660535, -20.004728) "></path>                <polygon id="line_white" fill="#FFFFFF" transform="translate(18.560032, 19.158031) rotate(-320.000000) translate(-18.560032, -19.158031) " points="18.0600316 -4.45366735 19.0600316 -4.45366735 19.0600316 42.7697299 18.0600316 42.7697299"></polygon>            </g>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">duplicated rows</p>
    <p style="margin:0;">
      <code style="font-size:11px;">rows_distinct()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>67K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>67K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">2</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect that all values in `plant_id` should not be NULL. " data-balloon-pos="right" style="width:fit-content;">
  <div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>col_vals_not_null</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_not_null" transform="translate(0.000000, 0.551724)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <path d="M40.6120805,47.037834 C37.4692348,47.037834 35.0126139,45.9348613 33.712234,44.0140597 C32.4118541,45.9348613 29.9552331,47.037834 26.8123883,47.037834 C22.6574397,47.037834 16.0646712,43.4437723 16.0646712,33.8021619 C16.0646712,29.3401361 17.4715879,18.962166 30.5035862,18.962166 C30.9454018,18.962166 31.3057481,19.3225124 31.3057481,19.7643279 L31.3057481,21.3686518 C31.3057481,21.8104674 30.9454018,22.1708138 30.5035862,22.1708138 C26.6400486,22.1708138 22.4819668,25.8118774 22.4819668,33.8021619 C22.4819668,37.5090277 23.7635456,43.0270243 27.2949384,43.0270243 C29.795428,43.0270243 31.224279,40.4231312 32.0985095,38.2861221 C30.5067194,35.6101596 29.7014243,33.1034035 29.7014243,30.8347892 C29.7014243,25.6238707 31.8603677,23.7751377 33.712234,23.7751377 C35.5641002,23.7751377 37.7230437,25.6238707 37.7230437,30.8347892 C37.7230437,33.1347383 36.9396828,35.5788255 35.3290916,38.2861221 C36.6294715,41.4321009 38.243196,43.0270243 40.1295295,43.0270243 C43.6609223,43.0270243 44.9425012,37.5090277 44.9425012,33.8021619 C44.9425012,25.8118774 40.7844193,22.1708138 36.9208817,22.1708138 C36.4759329,22.1708138 36.1187198,21.8104674 36.1187198,21.3686518 L36.1187198,19.7643279 C36.1187198,19.3225124 36.4759329,18.962166 36.9208817,18.962166 C49.9528801,18.962166 51.3597967,29.3401361 51.3597967,33.8021619 C51.3597967,43.4437723 44.7670282,47.037834 40.6120805,47.037834 Z" id="omega" fill="#000000" fill-rule="nonzero"></path>            <path d="M33,7.93597705 C33.2761424,7.93597705 33.5,8.15983467 33.5,8.43597705 L33.5,57.564023 C33.5,57.8401653 33.2761424,58.064023 33,58.064023 C32.7238576,58.064023 32.5,57.8401653 32.5,57.564023 L32.5,8.43597705 C32.5,8.15983467 32.7238576,7.93597705 33,7.93597705 Z" id="line_black" fill="#000000" transform="translate(33.000000, 33.000000) rotate(-320.000000) translate(-33.000000, -33.000000) "></path>            <polygon id="line_white" fill="#FFFFFF" transform="translate(34.899496, 32.153303) rotate(-320.000000) translate(-34.899496, -32.153303) " points="34.3994962 8.54160469 35.3994962 8.54160469 35.3994962 55.7650019 34.3994962 55.7650019"></polygon>        </g>    </g></svg></div>
  <code style="font-size:10px;">&nbsp;col_vals_not_null()</code>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="plant_id" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>plant_id</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>67K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>67K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">3</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect entirely distinct rows across `plant_id`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>rows_distinct</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="rows_distinct" transform="translate(0.000000, 0.482759)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <g id="no_gemini" transform="translate(17.000000, 13.000000)">                <path d="M3.66705619,6.62107508 C3.12510104,6.64066386 2.67455974,7.04767444 2.60273432,7.58527682 C2.52873228,8.1228792 2.85303526,8.6343627 3.37104848,8.79760239 C4.40489909,9.15455286 6.70113553,9.87063021 9.86580595,10.364702 L9.86580595,30.7369976 C6.65978137,31.2332458 4.37225104,31.964559 3.37104848,32.3215095 C2.78991555,32.5282797 2.48520173,33.1681784 2.69197196,33.7493114 C2.8987422,34.3304443 3.53864094,34.6351581 4.11977387,34.4283879 C5.54975217,33.9190808 10.2031678,32.4608072 16.5172734,32.4608072 C22.7943781,32.4608072 27.5500901,33.8907855 29.0540706,34.4109757 C29.6352036,34.6133926 30.2707495,34.304326 30.4731664,33.7231931 C30.6755833,33.1420601 30.3665167,32.5065142 29.7853838,32.3040973 C28.7493568,31.9449704 26.4313554,31.2441283 23.2383897,30.7544098 L23.2383897,10.3821143 C26.4444143,9.88804243 28.745004,9.16108259 29.7679716,8.79760239 C30.3491045,8.59083215 30.6538184,7.95093341 30.4470481,7.36980048 C30.2402779,6.78866755 29.6003791,6.48395373 29.0192462,6.69072396 C27.5587963,7.20873774 22.9162637,8.65830464 16.6391589,8.65830464 C10.3707603,8.65830464 5.61287188,7.21309051 4.10236166,6.69072396 C3.96306391,6.6384873 3.81506005,6.61454548 3.66705619,6.62107508 Z M12.0945699,10.6432975 C13.4940771,10.789125 15.0198226,10.8870686 16.6391589,10.8870686 C18.1997289,10.8870686 19.6623552,10.7978311 21.0096257,10.6607098 L21.0096257,30.4584021 C19.623178,30.316928 18.1191975,30.2320433 16.5172734,30.2320433 C14.9327615,30.2320433 13.4570763,30.3191044 12.0945699,30.4584021 L12.0945699,10.6432975 Z" id="gemini" stroke="#000000" stroke-width="2" fill="#000000" fill-rule="nonzero"></path>                <path d="M16.6605354,-5.05929499 C16.9366778,-5.05929499 17.1605354,-4.83543737 17.1605354,-4.55929499 L17.1605354,44.5687509 C17.1605354,44.8448933 16.9366778,45.0687509 16.6605354,45.0687509 C16.384393,45.0687509 16.1605354,44.8448933 16.1605354,44.5687509 L16.1605354,-4.55929499 C16.1605354,-4.83543737 16.384393,-5.05929499 16.6605354,-5.05929499 Z" id="line_black" fill="#000000" transform="translate(16.660535, 20.004728) rotate(-320.000000) translate(-16.660535, -20.004728) "></path>                <polygon id="line_white" fill="#FFFFFF" transform="translate(18.560032, 19.158031) rotate(-320.000000) translate(-18.560032, -19.158031) " points="18.0600316 -4.45366735 19.0600316 -4.45366735 19.0600316 42.7697299 18.0600316 42.7697299"></polygon>            </g>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">Check for duplicate ID's within each year</p>
    <p style="margin:0;">
      <code style="font-size:11px;">rows_distinct()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="plant_id" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>plant_id</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#3C898A;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="Using segment associated with value '1998' from column 'year'." data-balloon-pos="left"><svg width="24px" height="25px" viewBox="0 0 24 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="segmented" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="segmented" transform="translate(0.000000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M18.4051095,14.3518889 C20.4405142,14.3518889 22.0905358,16.0019105 22.0905358,18.0373152 C22.0905358,20.07272 20.4405142,21.7227416 18.4051095,21.7227416 C16.3697047,21.7227416 14.7196831,20.07272 14.7196831,18.0373152 C14.7196831,16.0019105 16.3697047,14.3518889 18.4051095,14.3518889 Z M18.4051095,14.9787621 C16.7159172,14.9787621 15.3465563,16.348123 15.3465563,18.0373152 C15.3465563,18.7697385 15.604001,19.4420322 16.0333357,19.9686419 L20.3364361,15.6655415 C19.8098264,15.2362068 19.1375327,14.9787621 18.4051095,14.9787621 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M4.40094816,14.3498527 C2.36911602,14.3498527 0.715948163,16.0028586 0.715948163,18.0348527 C0.715948163,20.0668467 2.36911602,21.7198527 4.40094816,21.7198527 C6.43278031,21.7198527 8.08594816,20.0668467 8.08594816,18.0348527 C8.08594816,16.0028586 6.43272633,14.3498527 4.40094816,14.3498527 Z M4.40094816,20.9828203 C2.77541767,20.9828203 1.45298055,19.6603831 1.45298055,18.0348527 C1.45298055,16.4093222 2.77541767,15.086885 4.40094816,15.086885 C6.02647865,15.086885 7.34891578,16.4093222 7.34891578,18.0348527 C7.34891578,19.6603831 6.02647865,20.9828203 4.40094816,20.9828203 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M18.4333601,-0.640287588 L18.4333601,14.5882952 L9.52131131,14.5882952 L11.3716151,15.980997 C11.6576165,16.1948765 11.7148169,16.6002518 11.5009374,16.8862532 C11.2870585,17.1722546 10.8816827,17.229455 10.5956813,17.0155755 L10.5956813,17.0155755 L7.23330126,14.4689208 C7.06667429,14.3495464 6.96719559,14.1555632 6.96719559,13.9516316 C6.96719559,13.7477006 7.06667429,13.5537168 7.23330126,13.4343424 L7.23330126,13.4343424 L10.5956813,10.8876877 C10.677751,10.8255137 10.7722561,10.7857222 10.8742216,10.7683132 C10.8990916,10.7608522 10.9264478,10.7533918 10.9538046,10.7484175 C11.2522407,10.708626 11.5382421,10.8827141 11.6377208,11.166228 C11.7396863,11.4497426 11.6277729,11.765587 11.3716151,11.9222661 L11.3716151,11.9222661 L9.52131131,13.3149679 L17.1593533,13.3147124 L17.1594577,0.633614828 L6.9283533,0.633614828 L6.9283533,-0.640287588 L18.4333601,-0.640287588 Z" id="arrow" fill="#000000" transform="translate(12.680857, 8.252286) rotate(-90.000000) translate(-12.680857, -8.252286) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>3K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>3K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">4</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect entirely distinct rows across `plant_id`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>rows_distinct</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="rows_distinct" transform="translate(0.000000, 0.482759)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <g id="no_gemini" transform="translate(17.000000, 13.000000)">                <path d="M3.66705619,6.62107508 C3.12510104,6.64066386 2.67455974,7.04767444 2.60273432,7.58527682 C2.52873228,8.1228792 2.85303526,8.6343627 3.37104848,8.79760239 C4.40489909,9.15455286 6.70113553,9.87063021 9.86580595,10.364702 L9.86580595,30.7369976 C6.65978137,31.2332458 4.37225104,31.964559 3.37104848,32.3215095 C2.78991555,32.5282797 2.48520173,33.1681784 2.69197196,33.7493114 C2.8987422,34.3304443 3.53864094,34.6351581 4.11977387,34.4283879 C5.54975217,33.9190808 10.2031678,32.4608072 16.5172734,32.4608072 C22.7943781,32.4608072 27.5500901,33.8907855 29.0540706,34.4109757 C29.6352036,34.6133926 30.2707495,34.304326 30.4731664,33.7231931 C30.6755833,33.1420601 30.3665167,32.5065142 29.7853838,32.3040973 C28.7493568,31.9449704 26.4313554,31.2441283 23.2383897,30.7544098 L23.2383897,10.3821143 C26.4444143,9.88804243 28.745004,9.16108259 29.7679716,8.79760239 C30.3491045,8.59083215 30.6538184,7.95093341 30.4470481,7.36980048 C30.2402779,6.78866755 29.6003791,6.48395373 29.0192462,6.69072396 C27.5587963,7.20873774 22.9162637,8.65830464 16.6391589,8.65830464 C10.3707603,8.65830464 5.61287188,7.21309051 4.10236166,6.69072396 C3.96306391,6.6384873 3.81506005,6.61454548 3.66705619,6.62107508 Z M12.0945699,10.6432975 C13.4940771,10.789125 15.0198226,10.8870686 16.6391589,10.8870686 C18.1997289,10.8870686 19.6623552,10.7978311 21.0096257,10.6607098 L21.0096257,30.4584021 C19.623178,30.316928 18.1191975,30.2320433 16.5172734,30.2320433 C14.9327615,30.2320433 13.4570763,30.3191044 12.0945699,30.4584021 L12.0945699,10.6432975 Z" id="gemini" stroke="#000000" stroke-width="2" fill="#000000" fill-rule="nonzero"></path>                <path d="M16.6605354,-5.05929499 C16.9366778,-5.05929499 17.1605354,-4.83543737 17.1605354,-4.55929499 L17.1605354,44.5687509 C17.1605354,44.8448933 16.9366778,45.0687509 16.6605354,45.0687509 C16.384393,45.0687509 16.1605354,44.8448933 16.1605354,44.5687509 L16.1605354,-4.55929499 C16.1605354,-4.83543737 16.384393,-5.05929499 16.6605354,-5.05929499 Z" id="line_black" fill="#000000" transform="translate(16.660535, 20.004728) rotate(-320.000000) translate(-16.660535, -20.004728) "></path>                <polygon id="line_white" fill="#FFFFFF" transform="translate(18.560032, 19.158031) rotate(-320.000000) translate(-18.560032, -19.158031) " points="18.0600316 -4.45366735 19.0600316 -4.45366735 19.0600316 42.7697299 18.0600316 42.7697299"></polygon>            </g>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">Check for duplicate ID's within each year</p>
    <p style="margin:0;">
      <code style="font-size:11px;">rows_distinct()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="plant_id" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>plant_id</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#3C898A;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="Using segment associated with value '1999' from column 'year'." data-balloon-pos="left"><svg width="24px" height="25px" viewBox="0 0 24 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="segmented" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="segmented" transform="translate(0.000000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M18.4051095,14.3518889 C20.4405142,14.3518889 22.0905358,16.0019105 22.0905358,18.0373152 C22.0905358,20.07272 20.4405142,21.7227416 18.4051095,21.7227416 C16.3697047,21.7227416 14.7196831,20.07272 14.7196831,18.0373152 C14.7196831,16.0019105 16.3697047,14.3518889 18.4051095,14.3518889 Z M18.4051095,14.9787621 C16.7159172,14.9787621 15.3465563,16.348123 15.3465563,18.0373152 C15.3465563,18.7697385 15.604001,19.4420322 16.0333357,19.9686419 L20.3364361,15.6655415 C19.8098264,15.2362068 19.1375327,14.9787621 18.4051095,14.9787621 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M4.40094816,14.3498527 C2.36911602,14.3498527 0.715948163,16.0028586 0.715948163,18.0348527 C0.715948163,20.0668467 2.36911602,21.7198527 4.40094816,21.7198527 C6.43278031,21.7198527 8.08594816,20.0668467 8.08594816,18.0348527 C8.08594816,16.0028586 6.43272633,14.3498527 4.40094816,14.3498527 Z M4.40094816,20.9828203 C2.77541767,20.9828203 1.45298055,19.6603831 1.45298055,18.0348527 C1.45298055,16.4093222 2.77541767,15.086885 4.40094816,15.086885 C6.02647865,15.086885 7.34891578,16.4093222 7.34891578,18.0348527 C7.34891578,19.6603831 6.02647865,20.9828203 4.40094816,20.9828203 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M18.4333601,-0.640287588 L18.4333601,14.5882952 L9.52131131,14.5882952 L11.3716151,15.980997 C11.6576165,16.1948765 11.7148169,16.6002518 11.5009374,16.8862532 C11.2870585,17.1722546 10.8816827,17.229455 10.5956813,17.0155755 L10.5956813,17.0155755 L7.23330126,14.4689208 C7.06667429,14.3495464 6.96719559,14.1555632 6.96719559,13.9516316 C6.96719559,13.7477006 7.06667429,13.5537168 7.23330126,13.4343424 L7.23330126,13.4343424 L10.5956813,10.8876877 C10.677751,10.8255137 10.7722561,10.7857222 10.8742216,10.7683132 C10.8990916,10.7608522 10.9264478,10.7533918 10.9538046,10.7484175 C11.2522407,10.708626 11.5382421,10.8827141 11.6377208,11.166228 C11.7396863,11.4497426 11.6277729,11.765587 11.3716151,11.9222661 L11.3716151,11.9222661 L9.52131131,13.3149679 L17.1593533,13.3147124 L17.1594577,0.633614828 L6.9283533,0.633614828 L6.9283533,-0.640287588 L18.4333601,-0.640287588 Z" id="arrow" fill="#000000" transform="translate(12.680857, 8.252286) rotate(-90.000000) translate(-12.680857, -8.252286) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>4K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>4K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">5</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect entirely distinct rows across `plant_id`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>rows_distinct</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="rows_distinct" transform="translate(0.000000, 0.482759)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <g id="no_gemini" transform="translate(17.000000, 13.000000)">                <path d="M3.66705619,6.62107508 C3.12510104,6.64066386 2.67455974,7.04767444 2.60273432,7.58527682 C2.52873228,8.1228792 2.85303526,8.6343627 3.37104848,8.79760239 C4.40489909,9.15455286 6.70113553,9.87063021 9.86580595,10.364702 L9.86580595,30.7369976 C6.65978137,31.2332458 4.37225104,31.964559 3.37104848,32.3215095 C2.78991555,32.5282797 2.48520173,33.1681784 2.69197196,33.7493114 C2.8987422,34.3304443 3.53864094,34.6351581 4.11977387,34.4283879 C5.54975217,33.9190808 10.2031678,32.4608072 16.5172734,32.4608072 C22.7943781,32.4608072 27.5500901,33.8907855 29.0540706,34.4109757 C29.6352036,34.6133926 30.2707495,34.304326 30.4731664,33.7231931 C30.6755833,33.1420601 30.3665167,32.5065142 29.7853838,32.3040973 C28.7493568,31.9449704 26.4313554,31.2441283 23.2383897,30.7544098 L23.2383897,10.3821143 C26.4444143,9.88804243 28.745004,9.16108259 29.7679716,8.79760239 C30.3491045,8.59083215 30.6538184,7.95093341 30.4470481,7.36980048 C30.2402779,6.78866755 29.6003791,6.48395373 29.0192462,6.69072396 C27.5587963,7.20873774 22.9162637,8.65830464 16.6391589,8.65830464 C10.3707603,8.65830464 5.61287188,7.21309051 4.10236166,6.69072396 C3.96306391,6.6384873 3.81506005,6.61454548 3.66705619,6.62107508 Z M12.0945699,10.6432975 C13.4940771,10.789125 15.0198226,10.8870686 16.6391589,10.8870686 C18.1997289,10.8870686 19.6623552,10.7978311 21.0096257,10.6607098 L21.0096257,30.4584021 C19.623178,30.316928 18.1191975,30.2320433 16.5172734,30.2320433 C14.9327615,30.2320433 13.4570763,30.3191044 12.0945699,30.4584021 L12.0945699,10.6432975 Z" id="gemini" stroke="#000000" stroke-width="2" fill="#000000" fill-rule="nonzero"></path>                <path d="M16.6605354,-5.05929499 C16.9366778,-5.05929499 17.1605354,-4.83543737 17.1605354,-4.55929499 L17.1605354,44.5687509 C17.1605354,44.8448933 16.9366778,45.0687509 16.6605354,45.0687509 C16.384393,45.0687509 16.1605354,44.8448933 16.1605354,44.5687509 L16.1605354,-4.55929499 C16.1605354,-4.83543737 16.384393,-5.05929499 16.6605354,-5.05929499 Z" id="line_black" fill="#000000" transform="translate(16.660535, 20.004728) rotate(-320.000000) translate(-16.660535, -20.004728) "></path>                <polygon id="line_white" fill="#FFFFFF" transform="translate(18.560032, 19.158031) rotate(-320.000000) translate(-18.560032, -19.158031) " points="18.0600316 -4.45366735 19.0600316 -4.45366735 19.0600316 42.7697299 18.0600316 42.7697299"></polygon>            </g>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">Check for duplicate ID's within each year</p>
    <p style="margin:0;">
      <code style="font-size:11px;">rows_distinct()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="plant_id" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>plant_id</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#3C898A;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="Using segment associated with value '2000' from column 'year'." data-balloon-pos="left"><svg width="24px" height="25px" viewBox="0 0 24 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="segmented" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="segmented" transform="translate(0.000000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M18.4051095,14.3518889 C20.4405142,14.3518889 22.0905358,16.0019105 22.0905358,18.0373152 C22.0905358,20.07272 20.4405142,21.7227416 18.4051095,21.7227416 C16.3697047,21.7227416 14.7196831,20.07272 14.7196831,18.0373152 C14.7196831,16.0019105 16.3697047,14.3518889 18.4051095,14.3518889 Z M18.4051095,14.9787621 C16.7159172,14.9787621 15.3465563,16.348123 15.3465563,18.0373152 C15.3465563,18.7697385 15.604001,19.4420322 16.0333357,19.9686419 L20.3364361,15.6655415 C19.8098264,15.2362068 19.1375327,14.9787621 18.4051095,14.9787621 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M4.40094816,14.3498527 C2.36911602,14.3498527 0.715948163,16.0028586 0.715948163,18.0348527 C0.715948163,20.0668467 2.36911602,21.7198527 4.40094816,21.7198527 C6.43278031,21.7198527 8.08594816,20.0668467 8.08594816,18.0348527 C8.08594816,16.0028586 6.43272633,14.3498527 4.40094816,14.3498527 Z M4.40094816,20.9828203 C2.77541767,20.9828203 1.45298055,19.6603831 1.45298055,18.0348527 C1.45298055,16.4093222 2.77541767,15.086885 4.40094816,15.086885 C6.02647865,15.086885 7.34891578,16.4093222 7.34891578,18.0348527 C7.34891578,19.6603831 6.02647865,20.9828203 4.40094816,20.9828203 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M18.4333601,-0.640287588 L18.4333601,14.5882952 L9.52131131,14.5882952 L11.3716151,15.980997 C11.6576165,16.1948765 11.7148169,16.6002518 11.5009374,16.8862532 C11.2870585,17.1722546 10.8816827,17.229455 10.5956813,17.0155755 L10.5956813,17.0155755 L7.23330126,14.4689208 C7.06667429,14.3495464 6.96719559,14.1555632 6.96719559,13.9516316 C6.96719559,13.7477006 7.06667429,13.5537168 7.23330126,13.4343424 L7.23330126,13.4343424 L10.5956813,10.8876877 C10.677751,10.8255137 10.7722561,10.7857222 10.8742216,10.7683132 C10.8990916,10.7608522 10.9264478,10.7533918 10.9538046,10.7484175 C11.2522407,10.708626 11.5382421,10.8827141 11.6377208,11.166228 C11.7396863,11.4497426 11.6277729,11.765587 11.3716151,11.9222661 L11.3716151,11.9222661 L9.52131131,13.3149679 L17.1593533,13.3147124 L17.1594577,0.633614828 L6.9283533,0.633614828 L6.9283533,-0.640287588 L18.4333601,-0.640287588 Z" id="arrow" fill="#000000" transform="translate(12.680857, 8.252286) rotate(-90.000000) translate(-12.680857, -8.252286) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>5K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>5K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">6</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect entirely distinct rows across `plant_id`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>rows_distinct</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="rows_distinct" transform="translate(0.000000, 0.482759)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <g id="no_gemini" transform="translate(17.000000, 13.000000)">                <path d="M3.66705619,6.62107508 C3.12510104,6.64066386 2.67455974,7.04767444 2.60273432,7.58527682 C2.52873228,8.1228792 2.85303526,8.6343627 3.37104848,8.79760239 C4.40489909,9.15455286 6.70113553,9.87063021 9.86580595,10.364702 L9.86580595,30.7369976 C6.65978137,31.2332458 4.37225104,31.964559 3.37104848,32.3215095 C2.78991555,32.5282797 2.48520173,33.1681784 2.69197196,33.7493114 C2.8987422,34.3304443 3.53864094,34.6351581 4.11977387,34.4283879 C5.54975217,33.9190808 10.2031678,32.4608072 16.5172734,32.4608072 C22.7943781,32.4608072 27.5500901,33.8907855 29.0540706,34.4109757 C29.6352036,34.6133926 30.2707495,34.304326 30.4731664,33.7231931 C30.6755833,33.1420601 30.3665167,32.5065142 29.7853838,32.3040973 C28.7493568,31.9449704 26.4313554,31.2441283 23.2383897,30.7544098 L23.2383897,10.3821143 C26.4444143,9.88804243 28.745004,9.16108259 29.7679716,8.79760239 C30.3491045,8.59083215 30.6538184,7.95093341 30.4470481,7.36980048 C30.2402779,6.78866755 29.6003791,6.48395373 29.0192462,6.69072396 C27.5587963,7.20873774 22.9162637,8.65830464 16.6391589,8.65830464 C10.3707603,8.65830464 5.61287188,7.21309051 4.10236166,6.69072396 C3.96306391,6.6384873 3.81506005,6.61454548 3.66705619,6.62107508 Z M12.0945699,10.6432975 C13.4940771,10.789125 15.0198226,10.8870686 16.6391589,10.8870686 C18.1997289,10.8870686 19.6623552,10.7978311 21.0096257,10.6607098 L21.0096257,30.4584021 C19.623178,30.316928 18.1191975,30.2320433 16.5172734,30.2320433 C14.9327615,30.2320433 13.4570763,30.3191044 12.0945699,30.4584021 L12.0945699,10.6432975 Z" id="gemini" stroke="#000000" stroke-width="2" fill="#000000" fill-rule="nonzero"></path>                <path d="M16.6605354,-5.05929499 C16.9366778,-5.05929499 17.1605354,-4.83543737 17.1605354,-4.55929499 L17.1605354,44.5687509 C17.1605354,44.8448933 16.9366778,45.0687509 16.6605354,45.0687509 C16.384393,45.0687509 16.1605354,44.8448933 16.1605354,44.5687509 L16.1605354,-4.55929499 C16.1605354,-4.83543737 16.384393,-5.05929499 16.6605354,-5.05929499 Z" id="line_black" fill="#000000" transform="translate(16.660535, 20.004728) rotate(-320.000000) translate(-16.660535, -20.004728) "></path>                <polygon id="line_white" fill="#FFFFFF" transform="translate(18.560032, 19.158031) rotate(-320.000000) translate(-18.560032, -19.158031) " points="18.0600316 -4.45366735 19.0600316 -4.45366735 19.0600316 42.7697299 18.0600316 42.7697299"></polygon>            </g>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">Check for duplicate ID's within each year</p>
    <p style="margin:0;">
      <code style="font-size:11px;">rows_distinct()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="plant_id" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>plant_id</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#3C898A;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="Using segment associated with value '2001' from column 'year'." data-balloon-pos="left"><svg width="24px" height="25px" viewBox="0 0 24 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="segmented" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="segmented" transform="translate(0.000000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M18.4051095,14.3518889 C20.4405142,14.3518889 22.0905358,16.0019105 22.0905358,18.0373152 C22.0905358,20.07272 20.4405142,21.7227416 18.4051095,21.7227416 C16.3697047,21.7227416 14.7196831,20.07272 14.7196831,18.0373152 C14.7196831,16.0019105 16.3697047,14.3518889 18.4051095,14.3518889 Z M18.4051095,14.9787621 C16.7159172,14.9787621 15.3465563,16.348123 15.3465563,18.0373152 C15.3465563,18.7697385 15.604001,19.4420322 16.0333357,19.9686419 L20.3364361,15.6655415 C19.8098264,15.2362068 19.1375327,14.9787621 18.4051095,14.9787621 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M4.40094816,14.3498527 C2.36911602,14.3498527 0.715948163,16.0028586 0.715948163,18.0348527 C0.715948163,20.0668467 2.36911602,21.7198527 4.40094816,21.7198527 C6.43278031,21.7198527 8.08594816,20.0668467 8.08594816,18.0348527 C8.08594816,16.0028586 6.43272633,14.3498527 4.40094816,14.3498527 Z M4.40094816,20.9828203 C2.77541767,20.9828203 1.45298055,19.6603831 1.45298055,18.0348527 C1.45298055,16.4093222 2.77541767,15.086885 4.40094816,15.086885 C6.02647865,15.086885 7.34891578,16.4093222 7.34891578,18.0348527 C7.34891578,19.6603831 6.02647865,20.9828203 4.40094816,20.9828203 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M18.4333601,-0.640287588 L18.4333601,14.5882952 L9.52131131,14.5882952 L11.3716151,15.980997 C11.6576165,16.1948765 11.7148169,16.6002518 11.5009374,16.8862532 C11.2870585,17.1722546 10.8816827,17.229455 10.5956813,17.0155755 L10.5956813,17.0155755 L7.23330126,14.4689208 C7.06667429,14.3495464 6.96719559,14.1555632 6.96719559,13.9516316 C6.96719559,13.7477006 7.06667429,13.5537168 7.23330126,13.4343424 L7.23330126,13.4343424 L10.5956813,10.8876877 C10.677751,10.8255137 10.7722561,10.7857222 10.8742216,10.7683132 C10.8990916,10.7608522 10.9264478,10.7533918 10.9538046,10.7484175 C11.2522407,10.708626 11.5382421,10.8827141 11.6377208,11.166228 C11.7396863,11.4497426 11.6277729,11.765587 11.3716151,11.9222661 L11.3716151,11.9222661 L9.52131131,13.3149679 L17.1593533,13.3147124 L17.1594577,0.633614828 L6.9283533,0.633614828 L6.9283533,-0.640287588 L18.4333601,-0.640287588 Z" id="arrow" fill="#000000" transform="translate(12.680857, 8.252286) rotate(-90.000000) translate(-12.680857, -8.252286) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>6K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>6K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">7</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect entirely distinct rows across `plant_id`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>rows_distinct</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="rows_distinct" transform="translate(0.000000, 0.482759)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <g id="no_gemini" transform="translate(17.000000, 13.000000)">                <path d="M3.66705619,6.62107508 C3.12510104,6.64066386 2.67455974,7.04767444 2.60273432,7.58527682 C2.52873228,8.1228792 2.85303526,8.6343627 3.37104848,8.79760239 C4.40489909,9.15455286 6.70113553,9.87063021 9.86580595,10.364702 L9.86580595,30.7369976 C6.65978137,31.2332458 4.37225104,31.964559 3.37104848,32.3215095 C2.78991555,32.5282797 2.48520173,33.1681784 2.69197196,33.7493114 C2.8987422,34.3304443 3.53864094,34.6351581 4.11977387,34.4283879 C5.54975217,33.9190808 10.2031678,32.4608072 16.5172734,32.4608072 C22.7943781,32.4608072 27.5500901,33.8907855 29.0540706,34.4109757 C29.6352036,34.6133926 30.2707495,34.304326 30.4731664,33.7231931 C30.6755833,33.1420601 30.3665167,32.5065142 29.7853838,32.3040973 C28.7493568,31.9449704 26.4313554,31.2441283 23.2383897,30.7544098 L23.2383897,10.3821143 C26.4444143,9.88804243 28.745004,9.16108259 29.7679716,8.79760239 C30.3491045,8.59083215 30.6538184,7.95093341 30.4470481,7.36980048 C30.2402779,6.78866755 29.6003791,6.48395373 29.0192462,6.69072396 C27.5587963,7.20873774 22.9162637,8.65830464 16.6391589,8.65830464 C10.3707603,8.65830464 5.61287188,7.21309051 4.10236166,6.69072396 C3.96306391,6.6384873 3.81506005,6.61454548 3.66705619,6.62107508 Z M12.0945699,10.6432975 C13.4940771,10.789125 15.0198226,10.8870686 16.6391589,10.8870686 C18.1997289,10.8870686 19.6623552,10.7978311 21.0096257,10.6607098 L21.0096257,30.4584021 C19.623178,30.316928 18.1191975,30.2320433 16.5172734,30.2320433 C14.9327615,30.2320433 13.4570763,30.3191044 12.0945699,30.4584021 L12.0945699,10.6432975 Z" id="gemini" stroke="#000000" stroke-width="2" fill="#000000" fill-rule="nonzero"></path>                <path d="M16.6605354,-5.05929499 C16.9366778,-5.05929499 17.1605354,-4.83543737 17.1605354,-4.55929499 L17.1605354,44.5687509 C17.1605354,44.8448933 16.9366778,45.0687509 16.6605354,45.0687509 C16.384393,45.0687509 16.1605354,44.8448933 16.1605354,44.5687509 L16.1605354,-4.55929499 C16.1605354,-4.83543737 16.384393,-5.05929499 16.6605354,-5.05929499 Z" id="line_black" fill="#000000" transform="translate(16.660535, 20.004728) rotate(-320.000000) translate(-16.660535, -20.004728) "></path>                <polygon id="line_white" fill="#FFFFFF" transform="translate(18.560032, 19.158031) rotate(-320.000000) translate(-18.560032, -19.158031) " points="18.0600316 -4.45366735 19.0600316 -4.45366735 19.0600316 42.7697299 18.0600316 42.7697299"></polygon>            </g>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">Check for duplicate ID's within each year</p>
    <p style="margin:0;">
      <code style="font-size:11px;">rows_distinct()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="plant_id" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>plant_id</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#3C898A;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="Using segment associated with value '2002' from column 'year'." data-balloon-pos="left"><svg width="24px" height="25px" viewBox="0 0 24 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="segmented" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="segmented" transform="translate(0.000000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M18.4051095,14.3518889 C20.4405142,14.3518889 22.0905358,16.0019105 22.0905358,18.0373152 C22.0905358,20.07272 20.4405142,21.7227416 18.4051095,21.7227416 C16.3697047,21.7227416 14.7196831,20.07272 14.7196831,18.0373152 C14.7196831,16.0019105 16.3697047,14.3518889 18.4051095,14.3518889 Z M18.4051095,14.9787621 C16.7159172,14.9787621 15.3465563,16.348123 15.3465563,18.0373152 C15.3465563,18.7697385 15.604001,19.4420322 16.0333357,19.9686419 L20.3364361,15.6655415 C19.8098264,15.2362068 19.1375327,14.9787621 18.4051095,14.9787621 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M4.40094816,14.3498527 C2.36911602,14.3498527 0.715948163,16.0028586 0.715948163,18.0348527 C0.715948163,20.0668467 2.36911602,21.7198527 4.40094816,21.7198527 C6.43278031,21.7198527 8.08594816,20.0668467 8.08594816,18.0348527 C8.08594816,16.0028586 6.43272633,14.3498527 4.40094816,14.3498527 Z M4.40094816,20.9828203 C2.77541767,20.9828203 1.45298055,19.6603831 1.45298055,18.0348527 C1.45298055,16.4093222 2.77541767,15.086885 4.40094816,15.086885 C6.02647865,15.086885 7.34891578,16.4093222 7.34891578,18.0348527 C7.34891578,19.6603831 6.02647865,20.9828203 4.40094816,20.9828203 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M18.4333601,-0.640287588 L18.4333601,14.5882952 L9.52131131,14.5882952 L11.3716151,15.980997 C11.6576165,16.1948765 11.7148169,16.6002518 11.5009374,16.8862532 C11.2870585,17.1722546 10.8816827,17.229455 10.5956813,17.0155755 L10.5956813,17.0155755 L7.23330126,14.4689208 C7.06667429,14.3495464 6.96719559,14.1555632 6.96719559,13.9516316 C6.96719559,13.7477006 7.06667429,13.5537168 7.23330126,13.4343424 L7.23330126,13.4343424 L10.5956813,10.8876877 C10.677751,10.8255137 10.7722561,10.7857222 10.8742216,10.7683132 C10.8990916,10.7608522 10.9264478,10.7533918 10.9538046,10.7484175 C11.2522407,10.708626 11.5382421,10.8827141 11.6377208,11.166228 C11.7396863,11.4497426 11.6277729,11.765587 11.3716151,11.9222661 L11.3716151,11.9222661 L9.52131131,13.3149679 L17.1593533,13.3147124 L17.1594577,0.633614828 L6.9283533,0.633614828 L6.9283533,-0.640287588 L18.4333601,-0.640287588 Z" id="arrow" fill="#000000" transform="translate(12.680857, 8.252286) rotate(-90.000000) translate(-12.680857, -8.252286) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>6K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>6K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">8</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect entirely distinct rows across `plant_id`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>rows_distinct</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="rows_distinct" transform="translate(0.000000, 0.482759)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <g id="no_gemini" transform="translate(17.000000, 13.000000)">                <path d="M3.66705619,6.62107508 C3.12510104,6.64066386 2.67455974,7.04767444 2.60273432,7.58527682 C2.52873228,8.1228792 2.85303526,8.6343627 3.37104848,8.79760239 C4.40489909,9.15455286 6.70113553,9.87063021 9.86580595,10.364702 L9.86580595,30.7369976 C6.65978137,31.2332458 4.37225104,31.964559 3.37104848,32.3215095 C2.78991555,32.5282797 2.48520173,33.1681784 2.69197196,33.7493114 C2.8987422,34.3304443 3.53864094,34.6351581 4.11977387,34.4283879 C5.54975217,33.9190808 10.2031678,32.4608072 16.5172734,32.4608072 C22.7943781,32.4608072 27.5500901,33.8907855 29.0540706,34.4109757 C29.6352036,34.6133926 30.2707495,34.304326 30.4731664,33.7231931 C30.6755833,33.1420601 30.3665167,32.5065142 29.7853838,32.3040973 C28.7493568,31.9449704 26.4313554,31.2441283 23.2383897,30.7544098 L23.2383897,10.3821143 C26.4444143,9.88804243 28.745004,9.16108259 29.7679716,8.79760239 C30.3491045,8.59083215 30.6538184,7.95093341 30.4470481,7.36980048 C30.2402779,6.78866755 29.6003791,6.48395373 29.0192462,6.69072396 C27.5587963,7.20873774 22.9162637,8.65830464 16.6391589,8.65830464 C10.3707603,8.65830464 5.61287188,7.21309051 4.10236166,6.69072396 C3.96306391,6.6384873 3.81506005,6.61454548 3.66705619,6.62107508 Z M12.0945699,10.6432975 C13.4940771,10.789125 15.0198226,10.8870686 16.6391589,10.8870686 C18.1997289,10.8870686 19.6623552,10.7978311 21.0096257,10.6607098 L21.0096257,30.4584021 C19.623178,30.316928 18.1191975,30.2320433 16.5172734,30.2320433 C14.9327615,30.2320433 13.4570763,30.3191044 12.0945699,30.4584021 L12.0945699,10.6432975 Z" id="gemini" stroke="#000000" stroke-width="2" fill="#000000" fill-rule="nonzero"></path>                <path d="M16.6605354,-5.05929499 C16.9366778,-5.05929499 17.1605354,-4.83543737 17.1605354,-4.55929499 L17.1605354,44.5687509 C17.1605354,44.8448933 16.9366778,45.0687509 16.6605354,45.0687509 C16.384393,45.0687509 16.1605354,44.8448933 16.1605354,44.5687509 L16.1605354,-4.55929499 C16.1605354,-4.83543737 16.384393,-5.05929499 16.6605354,-5.05929499 Z" id="line_black" fill="#000000" transform="translate(16.660535, 20.004728) rotate(-320.000000) translate(-16.660535, -20.004728) "></path>                <polygon id="line_white" fill="#FFFFFF" transform="translate(18.560032, 19.158031) rotate(-320.000000) translate(-18.560032, -19.158031) " points="18.0600316 -4.45366735 19.0600316 -4.45366735 19.0600316 42.7697299 18.0600316 42.7697299"></polygon>            </g>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">Check for duplicate ID's within each year</p>
    <p style="margin:0;">
      <code style="font-size:11px;">rows_distinct()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="plant_id" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>plant_id</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#3C898A;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="Using segment associated with value '2003' from column 'year'." data-balloon-pos="left"><svg width="24px" height="25px" viewBox="0 0 24 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="segmented" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="segmented" transform="translate(0.000000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M18.4051095,14.3518889 C20.4405142,14.3518889 22.0905358,16.0019105 22.0905358,18.0373152 C22.0905358,20.07272 20.4405142,21.7227416 18.4051095,21.7227416 C16.3697047,21.7227416 14.7196831,20.07272 14.7196831,18.0373152 C14.7196831,16.0019105 16.3697047,14.3518889 18.4051095,14.3518889 Z M18.4051095,14.9787621 C16.7159172,14.9787621 15.3465563,16.348123 15.3465563,18.0373152 C15.3465563,18.7697385 15.604001,19.4420322 16.0333357,19.9686419 L20.3364361,15.6655415 C19.8098264,15.2362068 19.1375327,14.9787621 18.4051095,14.9787621 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M4.40094816,14.3498527 C2.36911602,14.3498527 0.715948163,16.0028586 0.715948163,18.0348527 C0.715948163,20.0668467 2.36911602,21.7198527 4.40094816,21.7198527 C6.43278031,21.7198527 8.08594816,20.0668467 8.08594816,18.0348527 C8.08594816,16.0028586 6.43272633,14.3498527 4.40094816,14.3498527 Z M4.40094816,20.9828203 C2.77541767,20.9828203 1.45298055,19.6603831 1.45298055,18.0348527 C1.45298055,16.4093222 2.77541767,15.086885 4.40094816,15.086885 C6.02647865,15.086885 7.34891578,16.4093222 7.34891578,18.0348527 C7.34891578,19.6603831 6.02647865,20.9828203 4.40094816,20.9828203 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M18.4333601,-0.640287588 L18.4333601,14.5882952 L9.52131131,14.5882952 L11.3716151,15.980997 C11.6576165,16.1948765 11.7148169,16.6002518 11.5009374,16.8862532 C11.2870585,17.1722546 10.8816827,17.229455 10.5956813,17.0155755 L10.5956813,17.0155755 L7.23330126,14.4689208 C7.06667429,14.3495464 6.96719559,14.1555632 6.96719559,13.9516316 C6.96719559,13.7477006 7.06667429,13.5537168 7.23330126,13.4343424 L7.23330126,13.4343424 L10.5956813,10.8876877 C10.677751,10.8255137 10.7722561,10.7857222 10.8742216,10.7683132 C10.8990916,10.7608522 10.9264478,10.7533918 10.9538046,10.7484175 C11.2522407,10.708626 11.5382421,10.8827141 11.6377208,11.166228 C11.7396863,11.4497426 11.6277729,11.765587 11.3716151,11.9222661 L11.3716151,11.9222661 L9.52131131,13.3149679 L17.1593533,13.3147124 L17.1594577,0.633614828 L6.9283533,0.633614828 L6.9283533,-0.640287588 L18.4333601,-0.640287588 Z" id="arrow" fill="#000000" transform="translate(12.680857, 8.252286) rotate(-90.000000) translate(-12.680857, -8.252286) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>6K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>6K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">9</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect entirely distinct rows across `plant_id`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>rows_distinct</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="rows_distinct" transform="translate(0.000000, 0.482759)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <g id="no_gemini" transform="translate(17.000000, 13.000000)">                <path d="M3.66705619,6.62107508 C3.12510104,6.64066386 2.67455974,7.04767444 2.60273432,7.58527682 C2.52873228,8.1228792 2.85303526,8.6343627 3.37104848,8.79760239 C4.40489909,9.15455286 6.70113553,9.87063021 9.86580595,10.364702 L9.86580595,30.7369976 C6.65978137,31.2332458 4.37225104,31.964559 3.37104848,32.3215095 C2.78991555,32.5282797 2.48520173,33.1681784 2.69197196,33.7493114 C2.8987422,34.3304443 3.53864094,34.6351581 4.11977387,34.4283879 C5.54975217,33.9190808 10.2031678,32.4608072 16.5172734,32.4608072 C22.7943781,32.4608072 27.5500901,33.8907855 29.0540706,34.4109757 C29.6352036,34.6133926 30.2707495,34.304326 30.4731664,33.7231931 C30.6755833,33.1420601 30.3665167,32.5065142 29.7853838,32.3040973 C28.7493568,31.9449704 26.4313554,31.2441283 23.2383897,30.7544098 L23.2383897,10.3821143 C26.4444143,9.88804243 28.745004,9.16108259 29.7679716,8.79760239 C30.3491045,8.59083215 30.6538184,7.95093341 30.4470481,7.36980048 C30.2402779,6.78866755 29.6003791,6.48395373 29.0192462,6.69072396 C27.5587963,7.20873774 22.9162637,8.65830464 16.6391589,8.65830464 C10.3707603,8.65830464 5.61287188,7.21309051 4.10236166,6.69072396 C3.96306391,6.6384873 3.81506005,6.61454548 3.66705619,6.62107508 Z M12.0945699,10.6432975 C13.4940771,10.789125 15.0198226,10.8870686 16.6391589,10.8870686 C18.1997289,10.8870686 19.6623552,10.7978311 21.0096257,10.6607098 L21.0096257,30.4584021 C19.623178,30.316928 18.1191975,30.2320433 16.5172734,30.2320433 C14.9327615,30.2320433 13.4570763,30.3191044 12.0945699,30.4584021 L12.0945699,10.6432975 Z" id="gemini" stroke="#000000" stroke-width="2" fill="#000000" fill-rule="nonzero"></path>                <path d="M16.6605354,-5.05929499 C16.9366778,-5.05929499 17.1605354,-4.83543737 17.1605354,-4.55929499 L17.1605354,44.5687509 C17.1605354,44.8448933 16.9366778,45.0687509 16.6605354,45.0687509 C16.384393,45.0687509 16.1605354,44.8448933 16.1605354,44.5687509 L16.1605354,-4.55929499 C16.1605354,-4.83543737 16.384393,-5.05929499 16.6605354,-5.05929499 Z" id="line_black" fill="#000000" transform="translate(16.660535, 20.004728) rotate(-320.000000) translate(-16.660535, -20.004728) "></path>                <polygon id="line_white" fill="#FFFFFF" transform="translate(18.560032, 19.158031) rotate(-320.000000) translate(-18.560032, -19.158031) " points="18.0600316 -4.45366735 19.0600316 -4.45366735 19.0600316 42.7697299 18.0600316 42.7697299"></polygon>            </g>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">Check for duplicate ID's within each year</p>
    <p style="margin:0;">
      <code style="font-size:11px;">rows_distinct()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="plant_id" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>plant_id</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#3C898A;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="Using segment associated with value '2004' from column 'year'." data-balloon-pos="left"><svg width="24px" height="25px" viewBox="0 0 24 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="segmented" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="segmented" transform="translate(0.000000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M18.4051095,14.3518889 C20.4405142,14.3518889 22.0905358,16.0019105 22.0905358,18.0373152 C22.0905358,20.07272 20.4405142,21.7227416 18.4051095,21.7227416 C16.3697047,21.7227416 14.7196831,20.07272 14.7196831,18.0373152 C14.7196831,16.0019105 16.3697047,14.3518889 18.4051095,14.3518889 Z M18.4051095,14.9787621 C16.7159172,14.9787621 15.3465563,16.348123 15.3465563,18.0373152 C15.3465563,18.7697385 15.604001,19.4420322 16.0333357,19.9686419 L20.3364361,15.6655415 C19.8098264,15.2362068 19.1375327,14.9787621 18.4051095,14.9787621 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M4.40094816,14.3498527 C2.36911602,14.3498527 0.715948163,16.0028586 0.715948163,18.0348527 C0.715948163,20.0668467 2.36911602,21.7198527 4.40094816,21.7198527 C6.43278031,21.7198527 8.08594816,20.0668467 8.08594816,18.0348527 C8.08594816,16.0028586 6.43272633,14.3498527 4.40094816,14.3498527 Z M4.40094816,20.9828203 C2.77541767,20.9828203 1.45298055,19.6603831 1.45298055,18.0348527 C1.45298055,16.4093222 2.77541767,15.086885 4.40094816,15.086885 C6.02647865,15.086885 7.34891578,16.4093222 7.34891578,18.0348527 C7.34891578,19.6603831 6.02647865,20.9828203 4.40094816,20.9828203 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M18.4333601,-0.640287588 L18.4333601,14.5882952 L9.52131131,14.5882952 L11.3716151,15.980997 C11.6576165,16.1948765 11.7148169,16.6002518 11.5009374,16.8862532 C11.2870585,17.1722546 10.8816827,17.229455 10.5956813,17.0155755 L10.5956813,17.0155755 L7.23330126,14.4689208 C7.06667429,14.3495464 6.96719559,14.1555632 6.96719559,13.9516316 C6.96719559,13.7477006 7.06667429,13.5537168 7.23330126,13.4343424 L7.23330126,13.4343424 L10.5956813,10.8876877 C10.677751,10.8255137 10.7722561,10.7857222 10.8742216,10.7683132 C10.8990916,10.7608522 10.9264478,10.7533918 10.9538046,10.7484175 C11.2522407,10.708626 11.5382421,10.8827141 11.6377208,11.166228 C11.7396863,11.4497426 11.6277729,11.765587 11.3716151,11.9222661 L11.3716151,11.9222661 L9.52131131,13.3149679 L17.1593533,13.3147124 L17.1594577,0.633614828 L6.9283533,0.633614828 L6.9283533,-0.640287588 L18.4333601,-0.640287588 Z" id="arrow" fill="#000000" transform="translate(12.680857, 8.252286) rotate(-90.000000) translate(-12.680857, -8.252286) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>6K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>6K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">10</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect entirely distinct rows across `plant_id`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>rows_distinct</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="rows_distinct" transform="translate(0.000000, 0.482759)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <g id="no_gemini" transform="translate(17.000000, 13.000000)">                <path d="M3.66705619,6.62107508 C3.12510104,6.64066386 2.67455974,7.04767444 2.60273432,7.58527682 C2.52873228,8.1228792 2.85303526,8.6343627 3.37104848,8.79760239 C4.40489909,9.15455286 6.70113553,9.87063021 9.86580595,10.364702 L9.86580595,30.7369976 C6.65978137,31.2332458 4.37225104,31.964559 3.37104848,32.3215095 C2.78991555,32.5282797 2.48520173,33.1681784 2.69197196,33.7493114 C2.8987422,34.3304443 3.53864094,34.6351581 4.11977387,34.4283879 C5.54975217,33.9190808 10.2031678,32.4608072 16.5172734,32.4608072 C22.7943781,32.4608072 27.5500901,33.8907855 29.0540706,34.4109757 C29.6352036,34.6133926 30.2707495,34.304326 30.4731664,33.7231931 C30.6755833,33.1420601 30.3665167,32.5065142 29.7853838,32.3040973 C28.7493568,31.9449704 26.4313554,31.2441283 23.2383897,30.7544098 L23.2383897,10.3821143 C26.4444143,9.88804243 28.745004,9.16108259 29.7679716,8.79760239 C30.3491045,8.59083215 30.6538184,7.95093341 30.4470481,7.36980048 C30.2402779,6.78866755 29.6003791,6.48395373 29.0192462,6.69072396 C27.5587963,7.20873774 22.9162637,8.65830464 16.6391589,8.65830464 C10.3707603,8.65830464 5.61287188,7.21309051 4.10236166,6.69072396 C3.96306391,6.6384873 3.81506005,6.61454548 3.66705619,6.62107508 Z M12.0945699,10.6432975 C13.4940771,10.789125 15.0198226,10.8870686 16.6391589,10.8870686 C18.1997289,10.8870686 19.6623552,10.7978311 21.0096257,10.6607098 L21.0096257,30.4584021 C19.623178,30.316928 18.1191975,30.2320433 16.5172734,30.2320433 C14.9327615,30.2320433 13.4570763,30.3191044 12.0945699,30.4584021 L12.0945699,10.6432975 Z" id="gemini" stroke="#000000" stroke-width="2" fill="#000000" fill-rule="nonzero"></path>                <path d="M16.6605354,-5.05929499 C16.9366778,-5.05929499 17.1605354,-4.83543737 17.1605354,-4.55929499 L17.1605354,44.5687509 C17.1605354,44.8448933 16.9366778,45.0687509 16.6605354,45.0687509 C16.384393,45.0687509 16.1605354,44.8448933 16.1605354,44.5687509 L16.1605354,-4.55929499 C16.1605354,-4.83543737 16.384393,-5.05929499 16.6605354,-5.05929499 Z" id="line_black" fill="#000000" transform="translate(16.660535, 20.004728) rotate(-320.000000) translate(-16.660535, -20.004728) "></path>                <polygon id="line_white" fill="#FFFFFF" transform="translate(18.560032, 19.158031) rotate(-320.000000) translate(-18.560032, -19.158031) " points="18.0600316 -4.45366735 19.0600316 -4.45366735 19.0600316 42.7697299 18.0600316 42.7697299"></polygon>            </g>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">Check for duplicate ID's within each year</p>
    <p style="margin:0;">
      <code style="font-size:11px;">rows_distinct()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="plant_id" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>plant_id</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#3C898A;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="Using segment associated with value '2005' from column 'year'." data-balloon-pos="left"><svg width="24px" height="25px" viewBox="0 0 24 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="segmented" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="segmented" transform="translate(0.000000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M18.4051095,14.3518889 C20.4405142,14.3518889 22.0905358,16.0019105 22.0905358,18.0373152 C22.0905358,20.07272 20.4405142,21.7227416 18.4051095,21.7227416 C16.3697047,21.7227416 14.7196831,20.07272 14.7196831,18.0373152 C14.7196831,16.0019105 16.3697047,14.3518889 18.4051095,14.3518889 Z M18.4051095,14.9787621 C16.7159172,14.9787621 15.3465563,16.348123 15.3465563,18.0373152 C15.3465563,18.7697385 15.604001,19.4420322 16.0333357,19.9686419 L20.3364361,15.6655415 C19.8098264,15.2362068 19.1375327,14.9787621 18.4051095,14.9787621 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M4.40094816,14.3498527 C2.36911602,14.3498527 0.715948163,16.0028586 0.715948163,18.0348527 C0.715948163,20.0668467 2.36911602,21.7198527 4.40094816,21.7198527 C6.43278031,21.7198527 8.08594816,20.0668467 8.08594816,18.0348527 C8.08594816,16.0028586 6.43272633,14.3498527 4.40094816,14.3498527 Z M4.40094816,20.9828203 C2.77541767,20.9828203 1.45298055,19.6603831 1.45298055,18.0348527 C1.45298055,16.4093222 2.77541767,15.086885 4.40094816,15.086885 C6.02647865,15.086885 7.34891578,16.4093222 7.34891578,18.0348527 C7.34891578,19.6603831 6.02647865,20.9828203 4.40094816,20.9828203 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M18.4333601,-0.640287588 L18.4333601,14.5882952 L9.52131131,14.5882952 L11.3716151,15.980997 C11.6576165,16.1948765 11.7148169,16.6002518 11.5009374,16.8862532 C11.2870585,17.1722546 10.8816827,17.229455 10.5956813,17.0155755 L10.5956813,17.0155755 L7.23330126,14.4689208 C7.06667429,14.3495464 6.96719559,14.1555632 6.96719559,13.9516316 C6.96719559,13.7477006 7.06667429,13.5537168 7.23330126,13.4343424 L7.23330126,13.4343424 L10.5956813,10.8876877 C10.677751,10.8255137 10.7722561,10.7857222 10.8742216,10.7683132 C10.8990916,10.7608522 10.9264478,10.7533918 10.9538046,10.7484175 C11.2522407,10.708626 11.5382421,10.8827141 11.6377208,11.166228 C11.7396863,11.4497426 11.6277729,11.765587 11.3716151,11.9222661 L11.3716151,11.9222661 L9.52131131,13.3149679 L17.1593533,13.3147124 L17.1594577,0.633614828 L6.9283533,0.633614828 L6.9283533,-0.640287588 L18.4333601,-0.640287588 Z" id="arrow" fill="#000000" transform="translate(12.680857, 8.252286) rotate(-90.000000) translate(-12.680857, -8.252286) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>6K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>6K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">11</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect entirely distinct rows across `plant_id`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>rows_distinct</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="rows_distinct" transform="translate(0.000000, 0.482759)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <g id="no_gemini" transform="translate(17.000000, 13.000000)">                <path d="M3.66705619,6.62107508 C3.12510104,6.64066386 2.67455974,7.04767444 2.60273432,7.58527682 C2.52873228,8.1228792 2.85303526,8.6343627 3.37104848,8.79760239 C4.40489909,9.15455286 6.70113553,9.87063021 9.86580595,10.364702 L9.86580595,30.7369976 C6.65978137,31.2332458 4.37225104,31.964559 3.37104848,32.3215095 C2.78991555,32.5282797 2.48520173,33.1681784 2.69197196,33.7493114 C2.8987422,34.3304443 3.53864094,34.6351581 4.11977387,34.4283879 C5.54975217,33.9190808 10.2031678,32.4608072 16.5172734,32.4608072 C22.7943781,32.4608072 27.5500901,33.8907855 29.0540706,34.4109757 C29.6352036,34.6133926 30.2707495,34.304326 30.4731664,33.7231931 C30.6755833,33.1420601 30.3665167,32.5065142 29.7853838,32.3040973 C28.7493568,31.9449704 26.4313554,31.2441283 23.2383897,30.7544098 L23.2383897,10.3821143 C26.4444143,9.88804243 28.745004,9.16108259 29.7679716,8.79760239 C30.3491045,8.59083215 30.6538184,7.95093341 30.4470481,7.36980048 C30.2402779,6.78866755 29.6003791,6.48395373 29.0192462,6.69072396 C27.5587963,7.20873774 22.9162637,8.65830464 16.6391589,8.65830464 C10.3707603,8.65830464 5.61287188,7.21309051 4.10236166,6.69072396 C3.96306391,6.6384873 3.81506005,6.61454548 3.66705619,6.62107508 Z M12.0945699,10.6432975 C13.4940771,10.789125 15.0198226,10.8870686 16.6391589,10.8870686 C18.1997289,10.8870686 19.6623552,10.7978311 21.0096257,10.6607098 L21.0096257,30.4584021 C19.623178,30.316928 18.1191975,30.2320433 16.5172734,30.2320433 C14.9327615,30.2320433 13.4570763,30.3191044 12.0945699,30.4584021 L12.0945699,10.6432975 Z" id="gemini" stroke="#000000" stroke-width="2" fill="#000000" fill-rule="nonzero"></path>                <path d="M16.6605354,-5.05929499 C16.9366778,-5.05929499 17.1605354,-4.83543737 17.1605354,-4.55929499 L17.1605354,44.5687509 C17.1605354,44.8448933 16.9366778,45.0687509 16.6605354,45.0687509 C16.384393,45.0687509 16.1605354,44.8448933 16.1605354,44.5687509 L16.1605354,-4.55929499 C16.1605354,-4.83543737 16.384393,-5.05929499 16.6605354,-5.05929499 Z" id="line_black" fill="#000000" transform="translate(16.660535, 20.004728) rotate(-320.000000) translate(-16.660535, -20.004728) "></path>                <polygon id="line_white" fill="#FFFFFF" transform="translate(18.560032, 19.158031) rotate(-320.000000) translate(-18.560032, -19.158031) " points="18.0600316 -4.45366735 19.0600316 -4.45366735 19.0600316 42.7697299 18.0600316 42.7697299"></polygon>            </g>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">Check for duplicate ID's within each year</p>
    <p style="margin:0;">
      <code style="font-size:11px;">rows_distinct()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="plant_id" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>plant_id</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#3C898A;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="Using segment associated with value '2006' from column 'year'." data-balloon-pos="left"><svg width="24px" height="25px" viewBox="0 0 24 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="segmented" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="segmented" transform="translate(0.000000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M18.4051095,14.3518889 C20.4405142,14.3518889 22.0905358,16.0019105 22.0905358,18.0373152 C22.0905358,20.07272 20.4405142,21.7227416 18.4051095,21.7227416 C16.3697047,21.7227416 14.7196831,20.07272 14.7196831,18.0373152 C14.7196831,16.0019105 16.3697047,14.3518889 18.4051095,14.3518889 Z M18.4051095,14.9787621 C16.7159172,14.9787621 15.3465563,16.348123 15.3465563,18.0373152 C15.3465563,18.7697385 15.604001,19.4420322 16.0333357,19.9686419 L20.3364361,15.6655415 C19.8098264,15.2362068 19.1375327,14.9787621 18.4051095,14.9787621 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M4.40094816,14.3498527 C2.36911602,14.3498527 0.715948163,16.0028586 0.715948163,18.0348527 C0.715948163,20.0668467 2.36911602,21.7198527 4.40094816,21.7198527 C6.43278031,21.7198527 8.08594816,20.0668467 8.08594816,18.0348527 C8.08594816,16.0028586 6.43272633,14.3498527 4.40094816,14.3498527 Z M4.40094816,20.9828203 C2.77541767,20.9828203 1.45298055,19.6603831 1.45298055,18.0348527 C1.45298055,16.4093222 2.77541767,15.086885 4.40094816,15.086885 C6.02647865,15.086885 7.34891578,16.4093222 7.34891578,18.0348527 C7.34891578,19.6603831 6.02647865,20.9828203 4.40094816,20.9828203 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M18.4333601,-0.640287588 L18.4333601,14.5882952 L9.52131131,14.5882952 L11.3716151,15.980997 C11.6576165,16.1948765 11.7148169,16.6002518 11.5009374,16.8862532 C11.2870585,17.1722546 10.8816827,17.229455 10.5956813,17.0155755 L10.5956813,17.0155755 L7.23330126,14.4689208 C7.06667429,14.3495464 6.96719559,14.1555632 6.96719559,13.9516316 C6.96719559,13.7477006 7.06667429,13.5537168 7.23330126,13.4343424 L7.23330126,13.4343424 L10.5956813,10.8876877 C10.677751,10.8255137 10.7722561,10.7857222 10.8742216,10.7683132 C10.8990916,10.7608522 10.9264478,10.7533918 10.9538046,10.7484175 C11.2522407,10.708626 11.5382421,10.8827141 11.6377208,11.166228 C11.7396863,11.4497426 11.6277729,11.765587 11.3716151,11.9222661 L11.3716151,11.9222661 L9.52131131,13.3149679 L17.1593533,13.3147124 L17.1594577,0.633614828 L6.9283533,0.633614828 L6.9283533,-0.640287588 L18.4333601,-0.640287588 Z" id="arrow" fill="#000000" transform="translate(12.680857, 8.252286) rotate(-90.000000) translate(-12.680857, -8.252286) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>7K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>7K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">12</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect entirely distinct rows across `plant_id`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>rows_distinct</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="rows_distinct" transform="translate(0.000000, 0.482759)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <g id="no_gemini" transform="translate(17.000000, 13.000000)">                <path d="M3.66705619,6.62107508 C3.12510104,6.64066386 2.67455974,7.04767444 2.60273432,7.58527682 C2.52873228,8.1228792 2.85303526,8.6343627 3.37104848,8.79760239 C4.40489909,9.15455286 6.70113553,9.87063021 9.86580595,10.364702 L9.86580595,30.7369976 C6.65978137,31.2332458 4.37225104,31.964559 3.37104848,32.3215095 C2.78991555,32.5282797 2.48520173,33.1681784 2.69197196,33.7493114 C2.8987422,34.3304443 3.53864094,34.6351581 4.11977387,34.4283879 C5.54975217,33.9190808 10.2031678,32.4608072 16.5172734,32.4608072 C22.7943781,32.4608072 27.5500901,33.8907855 29.0540706,34.4109757 C29.6352036,34.6133926 30.2707495,34.304326 30.4731664,33.7231931 C30.6755833,33.1420601 30.3665167,32.5065142 29.7853838,32.3040973 C28.7493568,31.9449704 26.4313554,31.2441283 23.2383897,30.7544098 L23.2383897,10.3821143 C26.4444143,9.88804243 28.745004,9.16108259 29.7679716,8.79760239 C30.3491045,8.59083215 30.6538184,7.95093341 30.4470481,7.36980048 C30.2402779,6.78866755 29.6003791,6.48395373 29.0192462,6.69072396 C27.5587963,7.20873774 22.9162637,8.65830464 16.6391589,8.65830464 C10.3707603,8.65830464 5.61287188,7.21309051 4.10236166,6.69072396 C3.96306391,6.6384873 3.81506005,6.61454548 3.66705619,6.62107508 Z M12.0945699,10.6432975 C13.4940771,10.789125 15.0198226,10.8870686 16.6391589,10.8870686 C18.1997289,10.8870686 19.6623552,10.7978311 21.0096257,10.6607098 L21.0096257,30.4584021 C19.623178,30.316928 18.1191975,30.2320433 16.5172734,30.2320433 C14.9327615,30.2320433 13.4570763,30.3191044 12.0945699,30.4584021 L12.0945699,10.6432975 Z" id="gemini" stroke="#000000" stroke-width="2" fill="#000000" fill-rule="nonzero"></path>                <path d="M16.6605354,-5.05929499 C16.9366778,-5.05929499 17.1605354,-4.83543737 17.1605354,-4.55929499 L17.1605354,44.5687509 C17.1605354,44.8448933 16.9366778,45.0687509 16.6605354,45.0687509 C16.384393,45.0687509 16.1605354,44.8448933 16.1605354,44.5687509 L16.1605354,-4.55929499 C16.1605354,-4.83543737 16.384393,-5.05929499 16.6605354,-5.05929499 Z" id="line_black" fill="#000000" transform="translate(16.660535, 20.004728) rotate(-320.000000) translate(-16.660535, -20.004728) "></path>                <polygon id="line_white" fill="#FFFFFF" transform="translate(18.560032, 19.158031) rotate(-320.000000) translate(-18.560032, -19.158031) " points="18.0600316 -4.45366735 19.0600316 -4.45366735 19.0600316 42.7697299 18.0600316 42.7697299"></polygon>            </g>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">Check for duplicate ID's within each year</p>
    <p style="margin:0;">
      <code style="font-size:11px;">rows_distinct()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="plant_id" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>plant_id</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#3C898A;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="Using segment associated with value '2007' from column 'year'." data-balloon-pos="left"><svg width="24px" height="25px" viewBox="0 0 24 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="segmented" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="segmented" transform="translate(0.000000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M18.4051095,14.3518889 C20.4405142,14.3518889 22.0905358,16.0019105 22.0905358,18.0373152 C22.0905358,20.07272 20.4405142,21.7227416 18.4051095,21.7227416 C16.3697047,21.7227416 14.7196831,20.07272 14.7196831,18.0373152 C14.7196831,16.0019105 16.3697047,14.3518889 18.4051095,14.3518889 Z M18.4051095,14.9787621 C16.7159172,14.9787621 15.3465563,16.348123 15.3465563,18.0373152 C15.3465563,18.7697385 15.604001,19.4420322 16.0333357,19.9686419 L20.3364361,15.6655415 C19.8098264,15.2362068 19.1375327,14.9787621 18.4051095,14.9787621 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M4.40094816,14.3498527 C2.36911602,14.3498527 0.715948163,16.0028586 0.715948163,18.0348527 C0.715948163,20.0668467 2.36911602,21.7198527 4.40094816,21.7198527 C6.43278031,21.7198527 8.08594816,20.0668467 8.08594816,18.0348527 C8.08594816,16.0028586 6.43272633,14.3498527 4.40094816,14.3498527 Z M4.40094816,20.9828203 C2.77541767,20.9828203 1.45298055,19.6603831 1.45298055,18.0348527 C1.45298055,16.4093222 2.77541767,15.086885 4.40094816,15.086885 C6.02647865,15.086885 7.34891578,16.4093222 7.34891578,18.0348527 C7.34891578,19.6603831 6.02647865,20.9828203 4.40094816,20.9828203 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M18.4333601,-0.640287588 L18.4333601,14.5882952 L9.52131131,14.5882952 L11.3716151,15.980997 C11.6576165,16.1948765 11.7148169,16.6002518 11.5009374,16.8862532 C11.2870585,17.1722546 10.8816827,17.229455 10.5956813,17.0155755 L10.5956813,17.0155755 L7.23330126,14.4689208 C7.06667429,14.3495464 6.96719559,14.1555632 6.96719559,13.9516316 C6.96719559,13.7477006 7.06667429,13.5537168 7.23330126,13.4343424 L7.23330126,13.4343424 L10.5956813,10.8876877 C10.677751,10.8255137 10.7722561,10.7857222 10.8742216,10.7683132 C10.8990916,10.7608522 10.9264478,10.7533918 10.9538046,10.7484175 C11.2522407,10.708626 11.5382421,10.8827141 11.6377208,11.166228 C11.7396863,11.4497426 11.6277729,11.765587 11.3716151,11.9222661 L11.3716151,11.9222661 L9.52131131,13.3149679 L17.1593533,13.3147124 L17.1594577,0.633614828 L6.9283533,0.633614828 L6.9283533,-0.640287588 L18.4333601,-0.640287588 Z" id="arrow" fill="#000000" transform="translate(12.680857, 8.252286) rotate(-90.000000) translate(-12.680857, -8.252286) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>5K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>5K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">13</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect entirely distinct rows across `plant_id`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>rows_distinct</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="rows_distinct" transform="translate(0.000000, 0.482759)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <g id="no_gemini" transform="translate(17.000000, 13.000000)">                <path d="M3.66705619,6.62107508 C3.12510104,6.64066386 2.67455974,7.04767444 2.60273432,7.58527682 C2.52873228,8.1228792 2.85303526,8.6343627 3.37104848,8.79760239 C4.40489909,9.15455286 6.70113553,9.87063021 9.86580595,10.364702 L9.86580595,30.7369976 C6.65978137,31.2332458 4.37225104,31.964559 3.37104848,32.3215095 C2.78991555,32.5282797 2.48520173,33.1681784 2.69197196,33.7493114 C2.8987422,34.3304443 3.53864094,34.6351581 4.11977387,34.4283879 C5.54975217,33.9190808 10.2031678,32.4608072 16.5172734,32.4608072 C22.7943781,32.4608072 27.5500901,33.8907855 29.0540706,34.4109757 C29.6352036,34.6133926 30.2707495,34.304326 30.4731664,33.7231931 C30.6755833,33.1420601 30.3665167,32.5065142 29.7853838,32.3040973 C28.7493568,31.9449704 26.4313554,31.2441283 23.2383897,30.7544098 L23.2383897,10.3821143 C26.4444143,9.88804243 28.745004,9.16108259 29.7679716,8.79760239 C30.3491045,8.59083215 30.6538184,7.95093341 30.4470481,7.36980048 C30.2402779,6.78866755 29.6003791,6.48395373 29.0192462,6.69072396 C27.5587963,7.20873774 22.9162637,8.65830464 16.6391589,8.65830464 C10.3707603,8.65830464 5.61287188,7.21309051 4.10236166,6.69072396 C3.96306391,6.6384873 3.81506005,6.61454548 3.66705619,6.62107508 Z M12.0945699,10.6432975 C13.4940771,10.789125 15.0198226,10.8870686 16.6391589,10.8870686 C18.1997289,10.8870686 19.6623552,10.7978311 21.0096257,10.6607098 L21.0096257,30.4584021 C19.623178,30.316928 18.1191975,30.2320433 16.5172734,30.2320433 C14.9327615,30.2320433 13.4570763,30.3191044 12.0945699,30.4584021 L12.0945699,10.6432975 Z" id="gemini" stroke="#000000" stroke-width="2" fill="#000000" fill-rule="nonzero"></path>                <path d="M16.6605354,-5.05929499 C16.9366778,-5.05929499 17.1605354,-4.83543737 17.1605354,-4.55929499 L17.1605354,44.5687509 C17.1605354,44.8448933 16.9366778,45.0687509 16.6605354,45.0687509 C16.384393,45.0687509 16.1605354,44.8448933 16.1605354,44.5687509 L16.1605354,-4.55929499 C16.1605354,-4.83543737 16.384393,-5.05929499 16.6605354,-5.05929499 Z" id="line_black" fill="#000000" transform="translate(16.660535, 20.004728) rotate(-320.000000) translate(-16.660535, -20.004728) "></path>                <polygon id="line_white" fill="#FFFFFF" transform="translate(18.560032, 19.158031) rotate(-320.000000) translate(-18.560032, -19.158031) " points="18.0600316 -4.45366735 19.0600316 -4.45366735 19.0600316 42.7697299 18.0600316 42.7697299"></polygon>            </g>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">Check for duplicate ID's within each year</p>
    <p style="margin:0;">
      <code style="font-size:11px;">rows_distinct()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="plant_id" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>plant_id</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#3C898A;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="Using segment associated with value '2008' from column 'year'." data-balloon-pos="left"><svg width="24px" height="25px" viewBox="0 0 24 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="segmented" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="segmented" transform="translate(0.000000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M18.4051095,14.3518889 C20.4405142,14.3518889 22.0905358,16.0019105 22.0905358,18.0373152 C22.0905358,20.07272 20.4405142,21.7227416 18.4051095,21.7227416 C16.3697047,21.7227416 14.7196831,20.07272 14.7196831,18.0373152 C14.7196831,16.0019105 16.3697047,14.3518889 18.4051095,14.3518889 Z M18.4051095,14.9787621 C16.7159172,14.9787621 15.3465563,16.348123 15.3465563,18.0373152 C15.3465563,18.7697385 15.604001,19.4420322 16.0333357,19.9686419 L20.3364361,15.6655415 C19.8098264,15.2362068 19.1375327,14.9787621 18.4051095,14.9787621 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M4.40094816,14.3498527 C2.36911602,14.3498527 0.715948163,16.0028586 0.715948163,18.0348527 C0.715948163,20.0668467 2.36911602,21.7198527 4.40094816,21.7198527 C6.43278031,21.7198527 8.08594816,20.0668467 8.08594816,18.0348527 C8.08594816,16.0028586 6.43272633,14.3498527 4.40094816,14.3498527 Z M4.40094816,20.9828203 C2.77541767,20.9828203 1.45298055,19.6603831 1.45298055,18.0348527 C1.45298055,16.4093222 2.77541767,15.086885 4.40094816,15.086885 C6.02647865,15.086885 7.34891578,16.4093222 7.34891578,18.0348527 C7.34891578,19.6603831 6.02647865,20.9828203 4.40094816,20.9828203 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M18.4333601,-0.640287588 L18.4333601,14.5882952 L9.52131131,14.5882952 L11.3716151,15.980997 C11.6576165,16.1948765 11.7148169,16.6002518 11.5009374,16.8862532 C11.2870585,17.1722546 10.8816827,17.229455 10.5956813,17.0155755 L10.5956813,17.0155755 L7.23330126,14.4689208 C7.06667429,14.3495464 6.96719559,14.1555632 6.96719559,13.9516316 C6.96719559,13.7477006 7.06667429,13.5537168 7.23330126,13.4343424 L7.23330126,13.4343424 L10.5956813,10.8876877 C10.677751,10.8255137 10.7722561,10.7857222 10.8742216,10.7683132 C10.8990916,10.7608522 10.9264478,10.7533918 10.9538046,10.7484175 C11.2522407,10.708626 11.5382421,10.8827141 11.6377208,11.166228 C11.7396863,11.4497426 11.6277729,11.765587 11.3716151,11.9222661 L11.3716151,11.9222661 L9.52131131,13.3149679 L17.1593533,13.3147124 L17.1594577,0.633614828 L6.9283533,0.633614828 L6.9283533,-0.640287588 L18.4333601,-0.640287588 Z" id="arrow" fill="#000000" transform="translate(12.680857, 8.252286) rotate(-90.000000) translate(-12.680857, -8.252286) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>6K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>6K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #4CA64C; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">14</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect entirely distinct rows across `plant_id`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>rows_distinct</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="rows_distinct" transform="translate(0.000000, 0.482759)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <g id="no_gemini" transform="translate(17.000000, 13.000000)">                <path d="M3.66705619,6.62107508 C3.12510104,6.64066386 2.67455974,7.04767444 2.60273432,7.58527682 C2.52873228,8.1228792 2.85303526,8.6343627 3.37104848,8.79760239 C4.40489909,9.15455286 6.70113553,9.87063021 9.86580595,10.364702 L9.86580595,30.7369976 C6.65978137,31.2332458 4.37225104,31.964559 3.37104848,32.3215095 C2.78991555,32.5282797 2.48520173,33.1681784 2.69197196,33.7493114 C2.8987422,34.3304443 3.53864094,34.6351581 4.11977387,34.4283879 C5.54975217,33.9190808 10.2031678,32.4608072 16.5172734,32.4608072 C22.7943781,32.4608072 27.5500901,33.8907855 29.0540706,34.4109757 C29.6352036,34.6133926 30.2707495,34.304326 30.4731664,33.7231931 C30.6755833,33.1420601 30.3665167,32.5065142 29.7853838,32.3040973 C28.7493568,31.9449704 26.4313554,31.2441283 23.2383897,30.7544098 L23.2383897,10.3821143 C26.4444143,9.88804243 28.745004,9.16108259 29.7679716,8.79760239 C30.3491045,8.59083215 30.6538184,7.95093341 30.4470481,7.36980048 C30.2402779,6.78866755 29.6003791,6.48395373 29.0192462,6.69072396 C27.5587963,7.20873774 22.9162637,8.65830464 16.6391589,8.65830464 C10.3707603,8.65830464 5.61287188,7.21309051 4.10236166,6.69072396 C3.96306391,6.6384873 3.81506005,6.61454548 3.66705619,6.62107508 Z M12.0945699,10.6432975 C13.4940771,10.789125 15.0198226,10.8870686 16.6391589,10.8870686 C18.1997289,10.8870686 19.6623552,10.7978311 21.0096257,10.6607098 L21.0096257,30.4584021 C19.623178,30.316928 18.1191975,30.2320433 16.5172734,30.2320433 C14.9327615,30.2320433 13.4570763,30.3191044 12.0945699,30.4584021 L12.0945699,10.6432975 Z" id="gemini" stroke="#000000" stroke-width="2" fill="#000000" fill-rule="nonzero"></path>                <path d="M16.6605354,-5.05929499 C16.9366778,-5.05929499 17.1605354,-4.83543737 17.1605354,-4.55929499 L17.1605354,44.5687509 C17.1605354,44.8448933 16.9366778,45.0687509 16.6605354,45.0687509 C16.384393,45.0687509 16.1605354,44.8448933 16.1605354,44.5687509 L16.1605354,-4.55929499 C16.1605354,-4.83543737 16.384393,-5.05929499 16.6605354,-5.05929499 Z" id="line_black" fill="#000000" transform="translate(16.660535, 20.004728) rotate(-320.000000) translate(-16.660535, -20.004728) "></path>                <polygon id="line_white" fill="#FFFFFF" transform="translate(18.560032, 19.158031) rotate(-320.000000) translate(-18.560032, -19.158031) " points="18.0600316 -4.45366735 19.0600316 -4.45366735 19.0600316 42.7697299 18.0600316 42.7697299"></polygon>            </g>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">Check for duplicate ID's within each year</p>
    <p style="margin:0;">
      <code style="font-size:11px;">rows_distinct()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="plant_id" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>plant_id</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px">—</td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#3C898A;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="Using segment associated with value '2009' from column 'year'." data-balloon-pos="left"><svg width="24px" height="25px" viewBox="0 0 24 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="segmented" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="segmented" transform="translate(0.000000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M18.4051095,14.3518889 C20.4405142,14.3518889 22.0905358,16.0019105 22.0905358,18.0373152 C22.0905358,20.07272 20.4405142,21.7227416 18.4051095,21.7227416 C16.3697047,21.7227416 14.7196831,20.07272 14.7196831,18.0373152 C14.7196831,16.0019105 16.3697047,14.3518889 18.4051095,14.3518889 Z M18.4051095,14.9787621 C16.7159172,14.9787621 15.3465563,16.348123 15.3465563,18.0373152 C15.3465563,18.7697385 15.604001,19.4420322 16.0333357,19.9686419 L20.3364361,15.6655415 C19.8098264,15.2362068 19.1375327,14.9787621 18.4051095,14.9787621 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M4.40094816,14.3498527 C2.36911602,14.3498527 0.715948163,16.0028586 0.715948163,18.0348527 C0.715948163,20.0668467 2.36911602,21.7198527 4.40094816,21.7198527 C6.43278031,21.7198527 8.08594816,20.0668467 8.08594816,18.0348527 C8.08594816,16.0028586 6.43272633,14.3498527 4.40094816,14.3498527 Z M4.40094816,20.9828203 C2.77541767,20.9828203 1.45298055,19.6603831 1.45298055,18.0348527 C1.45298055,16.4093222 2.77541767,15.086885 4.40094816,15.086885 C6.02647865,15.086885 7.34891578,16.4093222 7.34891578,18.0348527 C7.34891578,19.6603831 6.02647865,20.9828203 4.40094816,20.9828203 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M18.4333601,-0.640287588 L18.4333601,14.5882952 L9.52131131,14.5882952 L11.3716151,15.980997 C11.6576165,16.1948765 11.7148169,16.6002518 11.5009374,16.8862532 C11.2870585,17.1722546 10.8816827,17.229455 10.5956813,17.0155755 L10.5956813,17.0155755 L7.23330126,14.4689208 C7.06667429,14.3495464 6.96719559,14.1555632 6.96719559,13.9516316 C6.96719559,13.7477006 7.06667429,13.5537168 7.23330126,13.4343424 L7.23330126,13.4343424 L10.5956813,10.8876877 C10.677751,10.8255137 10.7722561,10.7857222 10.8742216,10.7683132 C10.8990916,10.7608522 10.9264478,10.7533918 10.9538046,10.7484175 C11.2522407,10.708626 11.5382421,10.8827141 11.6377208,11.166228 C11.7396863,11.4497426 11.6277729,11.765587 11.3716151,11.9222661 L11.3716151,11.9222661 L9.52131131,13.3149679 L17.1593533,13.3147124 L17.1594577,0.633614828 L6.9283533,0.633614828 L6.9283533,-0.640287588 L18.4333601,-0.640287588 Z" id="arrow" fill="#000000" transform="translate(12.680857, 8.252286) rotate(-90.000000) translate(-12.680857, -8.252286) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>6K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>6K</code><br><code>1.00</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>0</code><br><code>0.00</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><p>—</p>
</div></td></tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="14"><span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin-left:10px;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;padding:2px 10px 2px 10px;">2023-05-26 09:59:30 EDT</span>
<span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;margin:5px 1px 5px 0;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;">3.3 s</span>
<span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 1px 5px -1px;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;">2023-05-26 09:59:33 EDT</span></td>
    </tr>
  </tfoot>
  
</table>
</div>
```


# Plant Characteristics: _Size & Flowering_

Tests to determine how many values of plant size (`shts`, `ht`) or infloresence number (`infl`) are outside the range of most values.  
**Test criteria**: 'warn' if $\geq$ 1 rows fail conditions, 'stop' if $\geq$ 2% of rows fail conditions.  


```{=html}
<div id="pb_agent" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>@import url("https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");
@import url("https://unpkg.com/balloon-css/balloon.min.css");
#pb_agent table {
  font-family: 'IBM Plex Sans', system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#pb_agent thead, #pb_agent tbody, #pb_agent tfoot, #pb_agent tr, #pb_agent td, #pb_agent th {
  border-style: none;
}

#pb_agent p {
  margin: 0;
  padding: 0;
}

#pb_agent .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 90%;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#pb_agent .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#pb_agent .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#pb_agent .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#pb_agent .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#pb_agent .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#pb_agent .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#pb_agent .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#pb_agent .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#pb_agent .gt_spanner_row {
  border-bottom-style: hidden;
}

#pb_agent .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#pb_agent .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#pb_agent .gt_from_md > :first-child {
  margin-top: 0;
}

#pb_agent .gt_from_md > :last-child {
  margin-bottom: 0;
}

#pb_agent .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#pb_agent .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#pb_agent .gt_row_group_first td {
  border-top-width: 2px;
}

#pb_agent .gt_row_group_first th {
  border-top-width: 2px;
}

#pb_agent .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#pb_agent .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#pb_agent .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#pb_agent .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#pb_agent .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_left {
  text-align: left;
}

#pb_agent .gt_center {
  text-align: center;
}

#pb_agent .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#pb_agent .gt_font_normal {
  font-weight: normal;
}

#pb_agent .gt_font_bold {
  font-weight: bold;
}

#pb_agent .gt_font_italic {
  font-style: italic;
}

#pb_agent .gt_super {
  font-size: 65%;
}

#pb_agent .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#pb_agent .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#pb_agent .gt_indent_1 {
  text-indent: 5px;
}

#pb_agent .gt_indent_2 {
  text-indent: 10px;
}

#pb_agent .gt_indent_3 {
  text-indent: 15px;
}

#pb_agent .gt_indent_4 {
  text-indent: 20px;
}

#pb_agent .gt_indent_5 {
  text-indent: 25px;
}

#pb_agent {
  -webkit-font-smoothing: antialiased;
}

#pb_agent .gt_row {
  overflow: visible;
}

#pb_agent .gt_sourcenote {
  height: 35px;
  padding: 0;
}

#pb_agent code {
  font-family: 'IBM Plex Mono', monospace, courier;
  background-color: transparent;
  padding: 0;
}
</style>
<table class="gt_table" style="table-layout: fixed;; width: 0px" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <colgroup>
    <col style="width:6px;"/>
    <col style="width:35px;"/>
    <col style="width:190px;"/>
    <col style="width:120px;"/>
    <col style="width:120px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:30px;"/>
    <col style="width:30px;"/>
    <col style="width:30px;"/>
    <col style="width:65px;"/>
  </colgroup>
  <thead>
    <tr class="gt_heading">
      <td colspan="14" class="gt_heading gt_title gt_font_normal" style="color: #444444; font-size: 28px; text-align: left; font-weight: 500;">Pointblank Validation</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="14" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="font-size: 12px; text-align: left;"><span style="text-decoration-style:solid;text-decoration-color:#ADD8E6;text-decoration-line:underline;text-underline-position:under;color:#333333;font-variant-numeric:tabular-nums;padding-left:4px;margin-right:5px;padding-right:2px;">Data Validation</span></p>
<div style="height:25px;"><span style="background-color: #F1D35A;color: #222222;padding: 0.5em 0.5em;position: inherit;text-transform: uppercase;margin: 5px 1px 5px 4px;font-weight: bold;border: solid 1px #F1D35A;padding: 2px 10px 2px 10px;font-size: smaller;">tibble</span><span style="background-color:#E5AB00;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 5px;font-weight:bold;border:solid 1px #E5AB00;padding:2px 15px 2px 15px;font-size:smaller;">WARN</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #E5AB00;padding:2px 15px 2px 15px;font-size:smaller;">1</span>
<span style="background-color:#D0182F;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 1px;font-weight:bold;border:solid 1px #D0182F;padding:2px 15px 2px 15px;font-size:smaller;">STOP</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #D0182F;padding:2px 15px 2px 15px;font-size:smaller;">0.02</span>
<span style="background-color:#499FFE;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 1px;font-weight:bold;border:solid 1px #499FFE;padding:2px 15px 2px 15px;font-size:smaller;">NOTIFY</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #499FFE;padding:2px 15px 2px 15px;font-size:smaller;">&mdash;</span></div>
</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="STEP">STEP</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="COLUMNS">COLUMNS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="VALUES">VALUES</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="TBL">TBL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="EVAL">EVAL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="UNITS">UNITS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="PASS">PASS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="FAIL">FAIL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="W">W</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="S">S</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="N">N</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="EXT">EXT</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #FFBF00; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">1</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect that values in `shts` should be between `0` and `20`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>col_vals_between</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_between" transform="translate(0.000000, 0.206897)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <path d="M11.993484,21.96875 C10.962234,22.082031 10.188797,22.964844 10.212234,24 L10.212234,42 C10.200515,42.722656 10.579422,43.390625 11.204422,43.753906 C11.825515,44.121094 12.598953,44.121094 13.220047,43.753906 C13.845047,43.390625 14.223953,42.722656 14.212234,42 L14.212234,24 C14.220047,23.457031 14.009109,22.9375 13.626297,22.554688 C13.243484,22.171875 12.723953,21.960938 12.180984,21.96875 C12.118484,21.964844 12.055984,21.964844 11.993484,21.96875 Z M55.993484,21.96875 C54.962234,22.082031 54.188797,22.964844 54.212234,24 L54.212234,42 C54.200515,42.722656 54.579422,43.390625 55.204422,43.753906 C55.825515,44.121094 56.598953,44.121094 57.220047,43.753906 C57.845047,43.390625 58.223953,42.722656 58.212234,42 L58.212234,24 C58.220047,23.457031 58.009109,22.9375 57.626297,22.554688 C57.243484,22.171875 56.723953,21.960938 56.180984,21.96875 C56.118484,21.964844 56.055984,21.964844 55.993484,21.96875 Z M16.212234,22 C15.661453,22 15.212234,22.449219 15.212234,23 C15.212234,23.550781 15.661453,24 16.212234,24 C16.763015,24 17.212234,23.550781 17.212234,23 C17.212234,22.449219 16.763015,22 16.212234,22 Z M20.212234,22 C19.661453,22 19.212234,22.449219 19.212234,23 C19.212234,23.550781 19.661453,24 20.212234,24 C20.763015,24 21.212234,23.550781 21.212234,23 C21.212234,22.449219 20.763015,22 20.212234,22 Z M24.212234,22 C23.661453,22 23.212234,22.449219 23.212234,23 C23.212234,23.550781 23.661453,24 24.212234,24 C24.763015,24 25.212234,23.550781 25.212234,23 C25.212234,22.449219 24.763015,22 24.212234,22 Z M28.212234,22 C27.661453,22 27.212234,22.449219 27.212234,23 C27.212234,23.550781 27.661453,24 28.212234,24 C28.763015,24 29.212234,23.550781 29.212234,23 C29.212234,22.449219 28.763015,22 28.212234,22 Z M32.212234,22 C31.661453,22 31.212234,22.449219 31.212234,23 C31.212234,23.550781 31.661453,24 32.212234,24 C32.763015,24 33.212234,23.550781 33.212234,23 C33.212234,22.449219 32.763015,22 32.212234,22 Z M36.212234,22 C35.661453,22 35.212234,22.449219 35.212234,23 C35.212234,23.550781 35.661453,24 36.212234,24 C36.763015,24 37.212234,23.550781 37.212234,23 C37.212234,22.449219 36.763015,22 36.212234,22 Z M40.212234,22 C39.661453,22 39.212234,22.449219 39.212234,23 C39.212234,23.550781 39.661453,24 40.212234,24 C40.763015,24 41.212234,23.550781 41.212234,23 C41.212234,22.449219 40.763015,22 40.212234,22 Z M44.212234,22 C43.661453,22 43.212234,22.449219 43.212234,23 C43.212234,23.550781 43.661453,24 44.212234,24 C44.763015,24 45.212234,23.550781 45.212234,23 C45.212234,22.449219 44.763015,22 44.212234,22 Z M48.212234,22 C47.661453,22 47.212234,22.449219 47.212234,23 C47.212234,23.550781 47.661453,24 48.212234,24 C48.763015,24 49.212234,23.550781 49.212234,23 C49.212234,22.449219 48.763015,22 48.212234,22 Z M52.212234,22 C51.661453,22 51.212234,22.449219 51.212234,23 C51.212234,23.550781 51.661453,24 52.212234,24 C52.763015,24 53.212234,23.550781 53.212234,23 C53.212234,22.449219 52.763015,22 52.212234,22 Z M21.462234,27.96875 C21.419265,27.976563 21.376297,27.988281 21.337234,28 C21.177078,28.027344 21.02864,28.089844 20.899734,28.1875 L15.618484,32.1875 C15.356765,32.375 15.200515,32.679688 15.200515,33 C15.200515,33.320313 15.356765,33.625 15.618484,33.8125 L20.899734,37.8125 C21.348953,38.148438 21.985672,38.058594 22.321609,37.609375 C22.657547,37.160156 22.567703,36.523438 22.118484,36.1875 L19.212234,34 L49.212234,34 L46.305984,36.1875 C45.856765,36.523438 45.766922,37.160156 46.102859,37.609375 C46.438797,38.058594 47.075515,38.148438 47.524734,37.8125 L52.805984,33.8125 C53.067703,33.625 53.223953,33.320313 53.223953,33 C53.223953,32.679688 53.067703,32.375 52.805984,32.1875 L47.524734,28.1875 C47.30989,28.027344 47.040359,27.960938 46.774734,28 C46.743484,28 46.712234,28 46.680984,28 C46.282547,28.074219 45.96614,28.382813 45.884109,28.78125 C45.802078,29.179688 45.970047,29.585938 46.305984,29.8125 L49.212234,32 L19.212234,32 L22.118484,29.8125 C22.520828,29.566406 22.696609,29.070313 22.536453,28.625 C22.380203,28.179688 21.930984,27.90625 21.462234,27.96875 Z M16.212234,42 C15.661453,42 15.212234,42.449219 15.212234,43 C15.212234,43.550781 15.661453,44 16.212234,44 C16.763015,44 17.212234,43.550781 17.212234,43 C17.212234,42.449219 16.763015,42 16.212234,42 Z M20.212234,42 C19.661453,42 19.212234,42.449219 19.212234,43 C19.212234,43.550781 19.661453,44 20.212234,44 C20.763015,44 21.212234,43.550781 21.212234,43 C21.212234,42.449219 20.763015,42 20.212234,42 Z M24.212234,42 C23.661453,42 23.212234,42.449219 23.212234,43 C23.212234,43.550781 23.661453,44 24.212234,44 C24.763015,44 25.212234,43.550781 25.212234,43 C25.212234,42.449219 24.763015,42 24.212234,42 Z M28.212234,42 C27.661453,42 27.212234,42.449219 27.212234,43 C27.212234,43.550781 27.661453,44 28.212234,44 C28.763015,44 29.212234,43.550781 29.212234,43 C29.212234,42.449219 28.763015,42 28.212234,42 Z M32.212234,42 C31.661453,42 31.212234,42.449219 31.212234,43 C31.212234,43.550781 31.661453,44 32.212234,44 C32.763015,44 33.212234,43.550781 33.212234,43 C33.212234,42.449219 32.763015,42 32.212234,42 Z M36.212234,42 C35.661453,42 35.212234,42.449219 35.212234,43 C35.212234,43.550781 35.661453,44 36.212234,44 C36.763015,44 37.212234,43.550781 37.212234,43 C37.212234,42.449219 36.763015,42 36.212234,42 Z M40.212234,42 C39.661453,42 39.212234,42.449219 39.212234,43 C39.212234,43.550781 39.661453,44 40.212234,44 C40.763015,44 41.212234,43.550781 41.212234,43 C41.212234,42.449219 40.763015,42 40.212234,42 Z M44.212234,42 C43.661453,42 43.212234,42.449219 43.212234,43 C43.212234,43.550781 43.661453,44 44.212234,44 C44.763015,44 45.212234,43.550781 45.212234,43 C45.212234,42.449219 44.763015,42 44.212234,42 Z M48.212234,42 C47.661453,42 47.212234,42.449219 47.212234,43 C47.212234,43.550781 47.661453,44 48.212234,44 C48.763015,44 49.212234,43.550781 49.212234,43 C49.212234,42.449219 48.763015,42 48.212234,42 Z M52.212234,42 C51.661453,42 51.212234,42.449219 51.212234,43 C51.212234,43.550781 51.661453,44 52.212234,44 C52.763015,44 53.212234,43.550781 53.212234,43 C53.212234,42.449219 52.763015,42 52.212234,42 Z" id="inside_range" fill="#000000" fill-rule="nonzero"></path>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">shoots between 0 and 20</p>
    <p style="margin:0;">
      <code style="font-size:11px;">col_vals_between()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="shts" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>shts</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="[0, 20]" data-balloon-pos="left"><p style="margin-top: 0px; margin-bottom: 0px; font-size: 11px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><code>[0, 20]</code></p></div>
</div></td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>67K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>67K</code><br><code>0.99</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>8</code><br><code>0.01</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #E5AB00;">●</span></p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><a href="data:text/csv;base64,InBsb3RfaWQiLCJzdWJwbG90IiwicGxhbnRfaWQiLCJ5ZWFyIiwic2h0cyIsImh0IiwiaW5mbCIsInJlY29yZGVkX3NkbGciLCJhZHVsdF9ub190YWciLCJ0cmVlZmFsbF9zdGF0dXMiLCJjb25kaXRpb24iLCJjZW5zdXNfc3RhdHVzIiwidGFnX251bWJlciIKIkNGLTEiLCJBMyIsNjk1MywyMDA2LDI0LDExMSwxLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTY0CiJDRi0xIiwiQTMiLDY5NTMsMjAwNywyMiwxMzgsMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDk2NAoiRkYtNyIsIkI4Iiw0MjMyLDIwMDEsMjEsOTMsMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE5NwoiRkYtNyIsIkI4Iiw0MjMyLDIwMDIsMjQsOTIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxOTcKIkZGLTciLCJDNCIsNDMxOCwyMDAwLDIyLDEyMSwxLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzQ4CiJDRi0xIiwiRDMiLDc4NTksMjAwMywyMSwxMzUsNCxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEwMDMKIkNGLTEiLCJEMyIsNzg1OSwyMDA0LDIxLDEzNyw0LEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTAwMwoiRkYtNyIsIkU4Iiw0NzM5LDIwMDMsMjMsNzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1NQo=" download="extract_0001.csv">
  <button aria-label="There are 8 'fail' rows available as a CSV file." data-balloon-pos="left" style="background-color:#67C2DC;color:#FFFFFF;border:none;padding:5px;font-weight:bold;cursor:pointer;border-radius:4px;">CSV</button>
</a>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #FFBF00; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">2</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect that values in `ht` should be between `0` and `200`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>col_vals_between</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_between" transform="translate(0.000000, 0.206897)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <path d="M11.993484,21.96875 C10.962234,22.082031 10.188797,22.964844 10.212234,24 L10.212234,42 C10.200515,42.722656 10.579422,43.390625 11.204422,43.753906 C11.825515,44.121094 12.598953,44.121094 13.220047,43.753906 C13.845047,43.390625 14.223953,42.722656 14.212234,42 L14.212234,24 C14.220047,23.457031 14.009109,22.9375 13.626297,22.554688 C13.243484,22.171875 12.723953,21.960938 12.180984,21.96875 C12.118484,21.964844 12.055984,21.964844 11.993484,21.96875 Z M55.993484,21.96875 C54.962234,22.082031 54.188797,22.964844 54.212234,24 L54.212234,42 C54.200515,42.722656 54.579422,43.390625 55.204422,43.753906 C55.825515,44.121094 56.598953,44.121094 57.220047,43.753906 C57.845047,43.390625 58.223953,42.722656 58.212234,42 L58.212234,24 C58.220047,23.457031 58.009109,22.9375 57.626297,22.554688 C57.243484,22.171875 56.723953,21.960938 56.180984,21.96875 C56.118484,21.964844 56.055984,21.964844 55.993484,21.96875 Z M16.212234,22 C15.661453,22 15.212234,22.449219 15.212234,23 C15.212234,23.550781 15.661453,24 16.212234,24 C16.763015,24 17.212234,23.550781 17.212234,23 C17.212234,22.449219 16.763015,22 16.212234,22 Z M20.212234,22 C19.661453,22 19.212234,22.449219 19.212234,23 C19.212234,23.550781 19.661453,24 20.212234,24 C20.763015,24 21.212234,23.550781 21.212234,23 C21.212234,22.449219 20.763015,22 20.212234,22 Z M24.212234,22 C23.661453,22 23.212234,22.449219 23.212234,23 C23.212234,23.550781 23.661453,24 24.212234,24 C24.763015,24 25.212234,23.550781 25.212234,23 C25.212234,22.449219 24.763015,22 24.212234,22 Z M28.212234,22 C27.661453,22 27.212234,22.449219 27.212234,23 C27.212234,23.550781 27.661453,24 28.212234,24 C28.763015,24 29.212234,23.550781 29.212234,23 C29.212234,22.449219 28.763015,22 28.212234,22 Z M32.212234,22 C31.661453,22 31.212234,22.449219 31.212234,23 C31.212234,23.550781 31.661453,24 32.212234,24 C32.763015,24 33.212234,23.550781 33.212234,23 C33.212234,22.449219 32.763015,22 32.212234,22 Z M36.212234,22 C35.661453,22 35.212234,22.449219 35.212234,23 C35.212234,23.550781 35.661453,24 36.212234,24 C36.763015,24 37.212234,23.550781 37.212234,23 C37.212234,22.449219 36.763015,22 36.212234,22 Z M40.212234,22 C39.661453,22 39.212234,22.449219 39.212234,23 C39.212234,23.550781 39.661453,24 40.212234,24 C40.763015,24 41.212234,23.550781 41.212234,23 C41.212234,22.449219 40.763015,22 40.212234,22 Z M44.212234,22 C43.661453,22 43.212234,22.449219 43.212234,23 C43.212234,23.550781 43.661453,24 44.212234,24 C44.763015,24 45.212234,23.550781 45.212234,23 C45.212234,22.449219 44.763015,22 44.212234,22 Z M48.212234,22 C47.661453,22 47.212234,22.449219 47.212234,23 C47.212234,23.550781 47.661453,24 48.212234,24 C48.763015,24 49.212234,23.550781 49.212234,23 C49.212234,22.449219 48.763015,22 48.212234,22 Z M52.212234,22 C51.661453,22 51.212234,22.449219 51.212234,23 C51.212234,23.550781 51.661453,24 52.212234,24 C52.763015,24 53.212234,23.550781 53.212234,23 C53.212234,22.449219 52.763015,22 52.212234,22 Z M21.462234,27.96875 C21.419265,27.976563 21.376297,27.988281 21.337234,28 C21.177078,28.027344 21.02864,28.089844 20.899734,28.1875 L15.618484,32.1875 C15.356765,32.375 15.200515,32.679688 15.200515,33 C15.200515,33.320313 15.356765,33.625 15.618484,33.8125 L20.899734,37.8125 C21.348953,38.148438 21.985672,38.058594 22.321609,37.609375 C22.657547,37.160156 22.567703,36.523438 22.118484,36.1875 L19.212234,34 L49.212234,34 L46.305984,36.1875 C45.856765,36.523438 45.766922,37.160156 46.102859,37.609375 C46.438797,38.058594 47.075515,38.148438 47.524734,37.8125 L52.805984,33.8125 C53.067703,33.625 53.223953,33.320313 53.223953,33 C53.223953,32.679688 53.067703,32.375 52.805984,32.1875 L47.524734,28.1875 C47.30989,28.027344 47.040359,27.960938 46.774734,28 C46.743484,28 46.712234,28 46.680984,28 C46.282547,28.074219 45.96614,28.382813 45.884109,28.78125 C45.802078,29.179688 45.970047,29.585938 46.305984,29.8125 L49.212234,32 L19.212234,32 L22.118484,29.8125 C22.520828,29.566406 22.696609,29.070313 22.536453,28.625 C22.380203,28.179688 21.930984,27.90625 21.462234,27.96875 Z M16.212234,42 C15.661453,42 15.212234,42.449219 15.212234,43 C15.212234,43.550781 15.661453,44 16.212234,44 C16.763015,44 17.212234,43.550781 17.212234,43 C17.212234,42.449219 16.763015,42 16.212234,42 Z M20.212234,42 C19.661453,42 19.212234,42.449219 19.212234,43 C19.212234,43.550781 19.661453,44 20.212234,44 C20.763015,44 21.212234,43.550781 21.212234,43 C21.212234,42.449219 20.763015,42 20.212234,42 Z M24.212234,42 C23.661453,42 23.212234,42.449219 23.212234,43 C23.212234,43.550781 23.661453,44 24.212234,44 C24.763015,44 25.212234,43.550781 25.212234,43 C25.212234,42.449219 24.763015,42 24.212234,42 Z M28.212234,42 C27.661453,42 27.212234,42.449219 27.212234,43 C27.212234,43.550781 27.661453,44 28.212234,44 C28.763015,44 29.212234,43.550781 29.212234,43 C29.212234,42.449219 28.763015,42 28.212234,42 Z M32.212234,42 C31.661453,42 31.212234,42.449219 31.212234,43 C31.212234,43.550781 31.661453,44 32.212234,44 C32.763015,44 33.212234,43.550781 33.212234,43 C33.212234,42.449219 32.763015,42 32.212234,42 Z M36.212234,42 C35.661453,42 35.212234,42.449219 35.212234,43 C35.212234,43.550781 35.661453,44 36.212234,44 C36.763015,44 37.212234,43.550781 37.212234,43 C37.212234,42.449219 36.763015,42 36.212234,42 Z M40.212234,42 C39.661453,42 39.212234,42.449219 39.212234,43 C39.212234,43.550781 39.661453,44 40.212234,44 C40.763015,44 41.212234,43.550781 41.212234,43 C41.212234,42.449219 40.763015,42 40.212234,42 Z M44.212234,42 C43.661453,42 43.212234,42.449219 43.212234,43 C43.212234,43.550781 43.661453,44 44.212234,44 C44.763015,44 45.212234,43.550781 45.212234,43 C45.212234,42.449219 44.763015,42 44.212234,42 Z M48.212234,42 C47.661453,42 47.212234,42.449219 47.212234,43 C47.212234,43.550781 47.661453,44 48.212234,44 C48.763015,44 49.212234,43.550781 49.212234,43 C49.212234,42.449219 48.763015,42 48.212234,42 Z M52.212234,42 C51.661453,42 51.212234,42.449219 51.212234,43 C51.212234,43.550781 51.661453,44 52.212234,44 C52.763015,44 53.212234,43.550781 53.212234,43 C53.212234,42.449219 52.763015,42 52.212234,42 Z" id="inside_range" fill="#000000" fill-rule="nonzero"></path>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">height between 0 and 200cm</p>
    <p style="margin:0;">
      <code style="font-size:11px;">col_vals_between()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="ht" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>ht</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="[0, 200]" data-balloon-pos="left"><p style="margin-top: 0px; margin-bottom: 0px; font-size: 11px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><code>[0, 200]</code></p></div>
</div></td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>67K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>67K</code><br><code>0.99</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>2</code><br><code>0.01</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #E5AB00;">●</span></p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><a href="data:text/csv;base64,InBsb3RfaWQiLCJzdWJwbG90IiwicGxhbnRfaWQiLCJ5ZWFyIiwic2h0cyIsImh0IiwiaW5mbCIsInJlY29yZGVkX3NkbGciLCJhZHVsdF9ub190YWciLCJ0cmVlZmFsbF9zdGF0dXMiLCJjb25kaXRpb24iLCJjZW5zdXNfc3RhdHVzIiwidGFnX251bWJlciIKIkZGLTYiLCJBMyIsMjYwNywyMDA1LDUsMjA1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjMKIkZGLTMiLCJFNiIsMjU0MSwyMDA4LDksMjI2LE5BLEZBTFNFLFRSVUUsTkEsTkEsIm1lYXN1cmVkIiwzOTQK" download="extract_0002.csv">
  <button aria-label="There are 2 'fail' rows available as a CSV file." data-balloon-pos="left" style="background-color:#67C2DC;color:#FFFFFF;border:none;padding:5px;font-weight:bold;cursor:pointer;border-radius:4px;">CSV</button>
</a>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #FFBF00; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">3</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect that values in `infl` should be between `0` and `3`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>col_vals_between</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_between" transform="translate(0.000000, 0.206897)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <path d="M11.993484,21.96875 C10.962234,22.082031 10.188797,22.964844 10.212234,24 L10.212234,42 C10.200515,42.722656 10.579422,43.390625 11.204422,43.753906 C11.825515,44.121094 12.598953,44.121094 13.220047,43.753906 C13.845047,43.390625 14.223953,42.722656 14.212234,42 L14.212234,24 C14.220047,23.457031 14.009109,22.9375 13.626297,22.554688 C13.243484,22.171875 12.723953,21.960938 12.180984,21.96875 C12.118484,21.964844 12.055984,21.964844 11.993484,21.96875 Z M55.993484,21.96875 C54.962234,22.082031 54.188797,22.964844 54.212234,24 L54.212234,42 C54.200515,42.722656 54.579422,43.390625 55.204422,43.753906 C55.825515,44.121094 56.598953,44.121094 57.220047,43.753906 C57.845047,43.390625 58.223953,42.722656 58.212234,42 L58.212234,24 C58.220047,23.457031 58.009109,22.9375 57.626297,22.554688 C57.243484,22.171875 56.723953,21.960938 56.180984,21.96875 C56.118484,21.964844 56.055984,21.964844 55.993484,21.96875 Z M16.212234,22 C15.661453,22 15.212234,22.449219 15.212234,23 C15.212234,23.550781 15.661453,24 16.212234,24 C16.763015,24 17.212234,23.550781 17.212234,23 C17.212234,22.449219 16.763015,22 16.212234,22 Z M20.212234,22 C19.661453,22 19.212234,22.449219 19.212234,23 C19.212234,23.550781 19.661453,24 20.212234,24 C20.763015,24 21.212234,23.550781 21.212234,23 C21.212234,22.449219 20.763015,22 20.212234,22 Z M24.212234,22 C23.661453,22 23.212234,22.449219 23.212234,23 C23.212234,23.550781 23.661453,24 24.212234,24 C24.763015,24 25.212234,23.550781 25.212234,23 C25.212234,22.449219 24.763015,22 24.212234,22 Z M28.212234,22 C27.661453,22 27.212234,22.449219 27.212234,23 C27.212234,23.550781 27.661453,24 28.212234,24 C28.763015,24 29.212234,23.550781 29.212234,23 C29.212234,22.449219 28.763015,22 28.212234,22 Z M32.212234,22 C31.661453,22 31.212234,22.449219 31.212234,23 C31.212234,23.550781 31.661453,24 32.212234,24 C32.763015,24 33.212234,23.550781 33.212234,23 C33.212234,22.449219 32.763015,22 32.212234,22 Z M36.212234,22 C35.661453,22 35.212234,22.449219 35.212234,23 C35.212234,23.550781 35.661453,24 36.212234,24 C36.763015,24 37.212234,23.550781 37.212234,23 C37.212234,22.449219 36.763015,22 36.212234,22 Z M40.212234,22 C39.661453,22 39.212234,22.449219 39.212234,23 C39.212234,23.550781 39.661453,24 40.212234,24 C40.763015,24 41.212234,23.550781 41.212234,23 C41.212234,22.449219 40.763015,22 40.212234,22 Z M44.212234,22 C43.661453,22 43.212234,22.449219 43.212234,23 C43.212234,23.550781 43.661453,24 44.212234,24 C44.763015,24 45.212234,23.550781 45.212234,23 C45.212234,22.449219 44.763015,22 44.212234,22 Z M48.212234,22 C47.661453,22 47.212234,22.449219 47.212234,23 C47.212234,23.550781 47.661453,24 48.212234,24 C48.763015,24 49.212234,23.550781 49.212234,23 C49.212234,22.449219 48.763015,22 48.212234,22 Z M52.212234,22 C51.661453,22 51.212234,22.449219 51.212234,23 C51.212234,23.550781 51.661453,24 52.212234,24 C52.763015,24 53.212234,23.550781 53.212234,23 C53.212234,22.449219 52.763015,22 52.212234,22 Z M21.462234,27.96875 C21.419265,27.976563 21.376297,27.988281 21.337234,28 C21.177078,28.027344 21.02864,28.089844 20.899734,28.1875 L15.618484,32.1875 C15.356765,32.375 15.200515,32.679688 15.200515,33 C15.200515,33.320313 15.356765,33.625 15.618484,33.8125 L20.899734,37.8125 C21.348953,38.148438 21.985672,38.058594 22.321609,37.609375 C22.657547,37.160156 22.567703,36.523438 22.118484,36.1875 L19.212234,34 L49.212234,34 L46.305984,36.1875 C45.856765,36.523438 45.766922,37.160156 46.102859,37.609375 C46.438797,38.058594 47.075515,38.148438 47.524734,37.8125 L52.805984,33.8125 C53.067703,33.625 53.223953,33.320313 53.223953,33 C53.223953,32.679688 53.067703,32.375 52.805984,32.1875 L47.524734,28.1875 C47.30989,28.027344 47.040359,27.960938 46.774734,28 C46.743484,28 46.712234,28 46.680984,28 C46.282547,28.074219 45.96614,28.382813 45.884109,28.78125 C45.802078,29.179688 45.970047,29.585938 46.305984,29.8125 L49.212234,32 L19.212234,32 L22.118484,29.8125 C22.520828,29.566406 22.696609,29.070313 22.536453,28.625 C22.380203,28.179688 21.930984,27.90625 21.462234,27.96875 Z M16.212234,42 C15.661453,42 15.212234,42.449219 15.212234,43 C15.212234,43.550781 15.661453,44 16.212234,44 C16.763015,44 17.212234,43.550781 17.212234,43 C17.212234,42.449219 16.763015,42 16.212234,42 Z M20.212234,42 C19.661453,42 19.212234,42.449219 19.212234,43 C19.212234,43.550781 19.661453,44 20.212234,44 C20.763015,44 21.212234,43.550781 21.212234,43 C21.212234,42.449219 20.763015,42 20.212234,42 Z M24.212234,42 C23.661453,42 23.212234,42.449219 23.212234,43 C23.212234,43.550781 23.661453,44 24.212234,44 C24.763015,44 25.212234,43.550781 25.212234,43 C25.212234,42.449219 24.763015,42 24.212234,42 Z M28.212234,42 C27.661453,42 27.212234,42.449219 27.212234,43 C27.212234,43.550781 27.661453,44 28.212234,44 C28.763015,44 29.212234,43.550781 29.212234,43 C29.212234,42.449219 28.763015,42 28.212234,42 Z M32.212234,42 C31.661453,42 31.212234,42.449219 31.212234,43 C31.212234,43.550781 31.661453,44 32.212234,44 C32.763015,44 33.212234,43.550781 33.212234,43 C33.212234,42.449219 32.763015,42 32.212234,42 Z M36.212234,42 C35.661453,42 35.212234,42.449219 35.212234,43 C35.212234,43.550781 35.661453,44 36.212234,44 C36.763015,44 37.212234,43.550781 37.212234,43 C37.212234,42.449219 36.763015,42 36.212234,42 Z M40.212234,42 C39.661453,42 39.212234,42.449219 39.212234,43 C39.212234,43.550781 39.661453,44 40.212234,44 C40.763015,44 41.212234,43.550781 41.212234,43 C41.212234,42.449219 40.763015,42 40.212234,42 Z M44.212234,42 C43.661453,42 43.212234,42.449219 43.212234,43 C43.212234,43.550781 43.661453,44 44.212234,44 C44.763015,44 45.212234,43.550781 45.212234,43 C45.212234,42.449219 44.763015,42 44.212234,42 Z M48.212234,42 C47.661453,42 47.212234,42.449219 47.212234,43 C47.212234,43.550781 47.661453,44 48.212234,44 C48.763015,44 49.212234,43.550781 49.212234,43 C49.212234,42.449219 48.763015,42 48.212234,42 Z M52.212234,42 C51.661453,42 51.212234,42.449219 51.212234,43 C51.212234,43.550781 51.661453,44 52.212234,44 C52.763015,44 53.212234,43.550781 53.212234,43 C53.212234,42.449219 52.763015,42 52.212234,42 Z" id="inside_range" fill="#000000" fill-rule="nonzero"></path>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">infloresences between 0 and 3</p>
    <p style="margin:0;">
      <code style="font-size:11px;">col_vals_between()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="infl" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>infl</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="[0, 3]" data-balloon-pos="left"><p style="margin-top: 0px; margin-bottom: 0px; font-size: 11px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><code>[0, 3]</code></p></div>
</div></td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>67K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>67K</code><br><code>0.99</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>15</code><br><code>0.01</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #E5AB00;">●</span></p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><a href="data:text/csv;base64,InBsb3RfaWQiLCJzdWJwbG90IiwicGxhbnRfaWQiLCJ5ZWFyIiwic2h0cyIsImh0IiwiaW5mbCIsInJlY29yZGVkX3NkbGciLCJhZHVsdF9ub190YWciLCJ0cmVlZmFsbF9zdGF0dXMiLCJjb25kaXRpb24iLCJjZW5zdXNfc3RhdHVzIiwidGFnX251bWJlciIKIkNGLTEiLCJBMiIsNjg1NywyMDAzLDksOTEsNCxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEzCiJGRi01IiwiQTQiLDY3NCwyMDA1LDUsMTYyLDQsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyNTEKIkZGLTciLCJBNSIsMzg3NywyMDA1LDEzLDg3LDQsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzMTYKIkNGLTEiLCJCMiIsNzIyNSwyMDAxLDIwLDk2LDcsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzMwoiRkYtNyIsIkI3Iiw0MjAyLDIwMDMsMTIsMTA1LDUsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNzEKIkNGLTUiLCJEMSIsODUyOSwxOTk5LDEzLDEwNyw1LEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTQ5CiJGRi0yIiwiRDMiLDU0NiwyMDA1LDcsOTcsNSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEzOAoiQ0YtMSIsIkQzIiw3ODU5LDIwMDIsMTcsMTAwLDQsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMDAzCiJDRi0xIiwiRDMiLDc4NTksMjAwMywyMSwxMzUsNCxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEwMDMKIkNGLTEiLCJEMyIsNzg1OSwyMDA0LDIxLDEzNyw0LEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTAwMwoiQ0YtMSIsIkQzIiw3ODU5LDIwMDUsMTMsMTMyLDYsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMDAzCiJDRi01IiwiRDEwIiw4NTM1LDIwMDUsMTAsMTUwLDYsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyNzAKIkZGLTIiLCJFMTAiLDYwOSwyMDA2LDYsODAsNCxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE4NgoiQ0YtMiIsIkk5IiwxOTQ2LDIwMDUsOSwxNDUsNCxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDY4OAoiQ0YtMiIsIkoxMCIsMTk2OSwyMDA3LDMsNTAsNCxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDM5Ngo=" download="extract_0003.csv">
  <button aria-label="There are 15 'fail' rows available as a CSV file." data-balloon-pos="left" style="background-color:#67C2DC;color:#FFFFFF;border:none;padding:5px;font-weight:bold;cursor:pointer;border-radius:4px;">CSV</button>
</a>
</div></td></tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="14"><span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin-left:10px;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;padding:2px 10px 2px 10px;">2023-05-26 09:59:34 EDT</span>
<span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;margin:5px 1px 5px 0;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;">&lt; 1 s</span>
<span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 1px 5px -1px;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;">2023-05-26 09:59:34 EDT</span></td>
    </tr>
  </tfoot>
  
</table>
</div>
```


# Plant Characteristics: Growth

Tests for unusual changes in plant size from $$Year_{t}$$ to $$Year_{t+1}$$. Conducted for both height and shoot number. 
**Test criteria**: 'warn' if $\geq$ 1 rows fail conditions, 'stop' if $\geq$ 2% of rows fail conditions.  



```{=html}
<div id="pb_agent" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>@import url("https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");
@import url("https://unpkg.com/balloon-css/balloon.min.css");
#pb_agent table {
  font-family: 'IBM Plex Sans', system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#pb_agent thead, #pb_agent tbody, #pb_agent tfoot, #pb_agent tr, #pb_agent td, #pb_agent th {
  border-style: none;
}

#pb_agent p {
  margin: 0;
  padding: 0;
}

#pb_agent .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 90%;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#pb_agent .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#pb_agent .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#pb_agent .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#pb_agent .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#pb_agent .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#pb_agent .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#pb_agent .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#pb_agent .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#pb_agent .gt_spanner_row {
  border-bottom-style: hidden;
}

#pb_agent .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#pb_agent .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#pb_agent .gt_from_md > :first-child {
  margin-top: 0;
}

#pb_agent .gt_from_md > :last-child {
  margin-bottom: 0;
}

#pb_agent .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#pb_agent .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#pb_agent .gt_row_group_first td {
  border-top-width: 2px;
}

#pb_agent .gt_row_group_first th {
  border-top-width: 2px;
}

#pb_agent .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#pb_agent .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#pb_agent .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#pb_agent .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#pb_agent .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_left {
  text-align: left;
}

#pb_agent .gt_center {
  text-align: center;
}

#pb_agent .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#pb_agent .gt_font_normal {
  font-weight: normal;
}

#pb_agent .gt_font_bold {
  font-weight: bold;
}

#pb_agent .gt_font_italic {
  font-style: italic;
}

#pb_agent .gt_super {
  font-size: 65%;
}

#pb_agent .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#pb_agent .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#pb_agent .gt_indent_1 {
  text-indent: 5px;
}

#pb_agent .gt_indent_2 {
  text-indent: 10px;
}

#pb_agent .gt_indent_3 {
  text-indent: 15px;
}

#pb_agent .gt_indent_4 {
  text-indent: 20px;
}

#pb_agent .gt_indent_5 {
  text-indent: 25px;
}

#pb_agent {
  -webkit-font-smoothing: antialiased;
}

#pb_agent .gt_row {
  overflow: visible;
}

#pb_agent .gt_sourcenote {
  height: 35px;
  padding: 0;
}

#pb_agent code {
  font-family: 'IBM Plex Mono', monospace, courier;
  background-color: transparent;
  padding: 0;
}
</style>
<table class="gt_table" style="table-layout: fixed;; width: 0px" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <colgroup>
    <col style="width:6px;"/>
    <col style="width:35px;"/>
    <col style="width:190px;"/>
    <col style="width:120px;"/>
    <col style="width:120px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:30px;"/>
    <col style="width:30px;"/>
    <col style="width:30px;"/>
    <col style="width:65px;"/>
  </colgroup>
  <thead>
    <tr class="gt_heading">
      <td colspan="14" class="gt_heading gt_title gt_font_normal" style="color: #444444; font-size: 28px; text-align: left; font-weight: 500;">Pointblank Validation</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="14" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="font-size: 12px; text-align: left;"><span style="text-decoration-style:solid;text-decoration-color:#ADD8E6;text-decoration-line:underline;text-underline-position:under;color:#333333;font-variant-numeric:tabular-nums;padding-left:4px;margin-right:5px;padding-right:2px;">Check growth &amp; regression</span></p>
<div style="height:25px;"><span style="background-color: #F1D35A;color: #222222;padding: 0.5em 0.5em;position: inherit;text-transform: uppercase;margin: 5px 1px 5px 4px;font-weight: bold;border: solid 1px #F1D35A;padding: 2px 10px 2px 10px;font-size: smaller;">tibble</span><span style="background-color:#E5AB00;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 5px;font-weight:bold;border:solid 1px #E5AB00;padding:2px 15px 2px 15px;font-size:smaller;">WARN</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #E5AB00;padding:2px 15px 2px 15px;font-size:smaller;">1</span>
<span style="background-color:#D0182F;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 1px;font-weight:bold;border:solid 1px #D0182F;padding:2px 15px 2px 15px;font-size:smaller;">STOP</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #D0182F;padding:2px 15px 2px 15px;font-size:smaller;">0.02</span>
<span style="background-color:#499FFE;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 1px;font-weight:bold;border:solid 1px #499FFE;padding:2px 15px 2px 15px;font-size:smaller;">NOTIFY</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #499FFE;padding:2px 15px 2px 15px;font-size:smaller;">&mdash;</span></div>
</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="STEP">STEP</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="COLUMNS">COLUMNS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="VALUES">VALUES</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="TBL">TBL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="EVAL">EVAL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="UNITS">UNITS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="PASS">PASS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="FAIL">FAIL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="W">W</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="S">S</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="N">N</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="EXT">EXT</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #FFBF00; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">1</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect that values in `ht_pc` should be &lt; `2`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>col_vals_lt</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_lt" transform="translate(0.000000, 0.310345)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <path d="M52.712234,11 L14.712234,11 C13.05989,11 11.712234,12.347656 11.712234,14 L11.712234,52 C11.712234,53.652344 13.05989,55 14.712234,55 L52.712234,55 C54.364578,55 55.712234,53.652344 55.712234,52 L55.712234,14 C55.712234,12.347656 54.364578,11 52.712234,11 Z M40.419265,46.292969 L39.005203,47.707031 L24.298172,33 L39.005203,18.292969 L40.419265,19.707031 L27.126297,33 L40.419265,46.292969 Z" id="less_than" fill="#000000" fill-rule="nonzero"></path>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">|% change in height| < 200%</p>
    <p style="margin:0;">
      <code style="font-size:11px;">col_vals_lt()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="ht_pc" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>ht_pc</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="2" data-balloon-pos="left"><p style="margin-top: 0px; margin-bottom: 0px; font-size: 11px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><code>2</code></p></div>
</div></td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>67K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>66K</code><br><code>0.99</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>420</code><br><code>0.01</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #E5AB00;">●</span></p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><a href="data:text/csv;base64,InBsb3RfaWQiLCJzdWJwbG90IiwicGxhbnRfaWQiLCJ5ZWFyIiwic2h0c19wcmV2Iiwic2h0cyIsInNodHNfZGlmZiIsInNodHNfcGMiLCJodF9wcmV2IiwiaHQiLCJodF9kaWZmIiwiaHRfcGMiLCJpbmZsIiwicmVjb3JkZWRfc2RsZyIsImFkdWx0X25vX3RhZyIsInRyZWVmYWxsX3N0YXR1cyIsImNvbmRpdGlvbiIsImNlbnN1c19zdGF0dXMiLCJ0YWdfbnVtYmVyIgoiRkYtMSIsIkE1Iiw0NCwyMDA2LDEsMSwwLDAsNCwxNywxMywzLjI1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjk3CiJGRi0xIiwiQTUiLDQ1LDIwMDYsMyw0LDEsMC4zMzMzMzMzMzMzMzMzMzMsMjMsNzMsNTAsMi4xNzM5MTMwNDM0NzgyNiwxLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzAyCiJGRi0xIiwiQTkiLDcyLDIwMDYsMiwyLDAsMCw1LDI3LDIyLDQuNCxOQSxGQUxTRSxGQUxTRSwiYnJhbmNoIixOQSwibWVhc3VyZWQiLDIxNgoiRkYtMSIsIkIzIiwxMDUsMjAwNiwxLDIsMSwxLDMsMzUsMzIsMTAuNjY2NjY2NjY2NjY2NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEyNAoiRkYtMSIsIkI0IiwxMjYsMjAwNCwxLDIsMSwxLDgsMjUsMTcsMi4xMjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyODAKIkZGLTEiLCJCNiIsMTM3LDIwMDYsMSwxLDAsMCw4LDI2LDE4LDIuMjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1NwoiRkYtMSIsIkMxMCIsMTc1LDIwMDQsMywxLC0yLDAuNjY2NjY2NjY2NjY2NjY3LDMsMTAsNywyLjMzMzMzMzMzMzMzMzMzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjU4CiJGRi0xIiwiQzYiLDIwNiwyMDAyLDQsNCwwLDAsMTQsNTgsNDQsMy4xNDI4NTcxNDI4NTcxNCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE0CiJGRi0xIiwiQzkiLDI0NywyMDAzLDEsMSwwLDAsMTgsMTE1LDk3LDUuMzg4ODg4ODg4ODg4ODksTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyNzUKIkZGLTEiLCJEMTAiLDI1NCwyMDA1LDEsMiwxLDEsMTMsNDMsMzAsMi4zMDc2OTIzMDc2OTIzMSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDI2MAoiRkYtMSIsIkUxIiwzMDUsMjAwNiwxLDEsMCwwLDEsMjIsMjEsMjEsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzMgoiRkYtMSIsIkUyIiwzMTUsMjAwNiwxLDIsMSwxLDUsMjUsMjAsNCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQ2CiJGRi0xIiwiRTQiLDMyMSwyMDA2LDEsMiwxLDEsOCwyNywxOSwyLjM3NSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDMwMwoiRkYtMiIsIkEyIiwzNTIsMjAwOSwxLDIsMSwxLDE3LDYzLDQ2LDIuNzA1ODgyMzUyOTQxMTgsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2MgoiRkYtMiIsIkEzIiwzNTcsMjAwNCwxLDIsMSwxLDgsMjgsMjAsMi41LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDUKIkZGLTIiLCJBOSIsMzk0LDIwMDgsMSwzLDIsMiwzMiw5OSw2NywyLjA5Mzc1LE5BLEZBTFNFLFRSVUUsTkEsTkEsIm1lYXN1cmVkIiw5MQoiRkYtMiIsIkE5IiwzOTgsMjAwOCw1LDYsMSwwLjIsMzcsMTE2LDc5LDIuMTM1MTM1MTM1MTM1MTQsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyMzUKIkZGLTIiLCJCMTAiLDQxNCwyMDA1LDEsMSwwLDAsMTEsMzQsMjMsMi4wOTA5MDkwOTA5MDkwOSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDI4OQoiRkYtMiIsIkI0Iiw0MzEsMjAwNCwxLDMsMiwyLDgsMjUsMTcsMi4xMjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMTgKIkZGLTIiLCJCNCIsNDMyLDIwMDIsMSwyLDEsMSw3LDMyLDI1LDMuNTcxNDI4NTcxNDI4NTcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNDAKIkZGLTIiLCJCOCIsNDYxLDIwMDgsMSwyLDEsMSwxNSw5Myw3OCw1LjIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyNzcKIkZGLTIiLCJDMiIsNDczLDIwMDIsMSwyLDEsMSwxNyw1NCwzNywyLjE3NjQ3MDU4ODIzNTI5LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTQ5CiJGRi0yIiwiQzIiLDQ3NCwyMDA0LDEsMiwxLDEsMSwxNCwxMywxMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE1MAoiRkYtMiIsIkM2Iiw0ODYsMjAwNSwxLDIsMSwxLDI1LDc4LDUzLDIuMTIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw3OQoiRkYtMiIsIkM3Iiw0OTEsMjAwOCwxLDEsMCwwLDEzLDU4LDQ1LDMuNDYxNTM4NDYxNTM4NDYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNTkKIkZGLTIiLCJFMSIsNjA0LDIwMDMsMSwyLDEsMSwwLDMwLDMwLEluZixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDI3CiJGRi0yIiwiRTEiLDYwNSwyMDA4LDMsMywwLDAsNCw0NSw0MSwxMC4yNSxOQSxGQUxTRSxUUlVFLE5BLE5BLCJtZWFzdXJlZCIsMTM5CiJGRi0yIiwiRTMiLDYyMiwyMDA1LDEsMSwwLDAsNSwxNiwxMSwyLjIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzMjMKIkZGLTIiLCJFOCIsNjM0LDIwMDQsMywzLDAsMCwxLDY4LDY3LDY3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTMKIkZGLTUiLCJBNCIsNjcxLDIwMDMsMSw0LDMsMyw4LDM1LDI3LDMuMzc1LE5BLEZBTFNFLEZBTFNFLCJicmFuY2giLE5BLCJtZWFzdXJlZCIsMTMzCiJGRi01IiwiQjQiLDc0NywyMDA2LDEsMSwwLDAsMywxMCw3LDIuMzMzMzMzMzMzMzMzMzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyNTUKIkZGLTUiLCJCNSIsNzU1LDIwMDIsMSwyLDEsMSw1LDE1LDEwLDIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNjgKIkZGLTUiLCJCNSIsNzU1LDIwMDQsMSwxLDAsMCw2LDIyLDE2LDIuNjY2NjY2NjY2NjY2NjcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNjgKIkZGLTUiLCJCNiIsNzY1LDIwMDUsMSwxLDAsMCw0LDEyLDgsMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDM0MQoiRkYtNSIsIkI5Iiw3ODAsMjAwMywyLDEsLTEsMC41LDEwLDMzLDIzLDIuMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDg5CiJGRi01IiwiQjkiLDc4OCwyMDA1LDEsMSwwLDAsNiwyOSwyMywzLjgzMzMzMzMzMzMzMzMzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTY2CiJGRi01IiwiQjkiLDc5MiwyMDA1LDEsMSwwLDAsOCwyNSwxNywyLjEyNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDI3MgoiRkYtNSIsIkQyIiw4NjUsMjAwNCwzLDMsMCwwLDExLDQyLDMxLDIuODE4MTgxODE4MTgxODIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4NgoiRkYtNSIsIkQyIiw4NjksMjAwMSwxLDEsMCwwLDMsOSw2LDIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNjAKIkZGLTUiLCJEMyIsODc2LDIwMDAsNCw1LDEsMC4yNSwxMCw0NiwzNiwzLjYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1OQoiRkYtNSIsIkQzIiw4NzgsMjAwNCwyLDMsMSwwLjUsMTgsNjcsNDksMi43MjIyMjIyMjIyMjIyMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE5MgoiRkYtNSIsIkQzIiw4ODIsMjAwNCwyLDQsMiwxLDE2LDc0LDU4LDMuNjI1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjEyCiJGRi01IiwiRTEiLDg5NSwyMDA2LDksMSwtOCwwLjg4ODg4ODg4ODg4ODg4OSwxLDE1LDE0LDE0LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTcxCiJDRi0yIiwiQTYiLDk2OSwyMDAwLDEsMSwwLDAsMiw4LDYsMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQ1MwoiQ0YtMiIsIkE3Iiw5ODIsMjAwOCwxLDIsMSwxLDE2LDQ4LDMyLDIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMTkKIkNGLTIiLCJBNyIsOTg2LDIwMDAsMSwxLDAsMCw2LDIzLDE3LDIuODMzMzMzMzMzMzMzMzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNDMKIkNGLTIiLCJBNyIsOTg5LDIwMDAsNSw1LDAsMCwxNyw1NiwzOSwyLjI5NDExNzY0NzA1ODgyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTQ2CiJDRi0yIiwiQTciLDk5NywyMDA0LDEsMiwxLDEsMTcsNTIsMzUsMi4wNTg4MjM1Mjk0MTE3NixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDcxNwoiQ0YtMiIsIkE3IiwxMDA0LDIwMDAsMyw0LDEsMC4zMzMzMzMzMzMzMzMzMzMsMjQsNzIsNDgsMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEzMzQKIkNGLTIiLCJBNyIsMTAwOCwyMDA4LDEsMSwwLDAsMTQsNTQsNDAsMi44NTcxNDI4NTcxNDI4NixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEzNDIKIkNGLTIiLCJBOSIsMTA1NCwyMDA3LDEsMSwwLDAsMywxMiw5LDMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0NjAKIkNGLTIiLCJBOSIsMTA1NCwyMDA4LDEsMywyLDIsMTIsNDQsMzIsMi42NjY2NjY2NjY2NjY2NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQ2MAoiQ0YtMiIsIkE5IiwxMDU3LDIwMDMsMSwyLDEsMSwyLDcsNSwyLjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1MDkKIkNGLTIiLCJCMTAiLDEwNzYsMTk5OSw1LDUsMCwwLDAsNDAsNDAsSW5mLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTEyCiJDRi0yIiwiQjEwIiwxMDc2LDIwMDQsNCw5LDUsMS4yNSwxOCw2OCw1MCwyLjc3Nzc3Nzc3Nzc3Nzc4LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTEyCiJDRi0yIiwiQjEwIiwxMDc3LDIwMDUsNCwyLC0yLDAuNSwwLDM1LDM1LEluZixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEyMgoiQ0YtMiIsIkI2IiwxMDk4LDIwMDksMiwxLC0xLDAuNSwxLDE1LDE0LDE0LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzM5CiJDRi0yIiwiQjYiLDExMDAsMjAwNywxLDIsMSwxLDYsMjAsMTQsMi4zMzMzMzMzMzMzMzMzMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDU5NQoiQ0YtMiIsIkI3IiwxMTE5LDIwMDgsMSwxLDAsMCwxMyw4Niw3Myw1LjYxNTM4NDYxNTM4NDYxLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDc0CiJDRi0yIiwiQjciLDExMjQsMjAwMSwxLDEsMCwwLDUsMTYsMTEsMi4yLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNjE2CiJDRi0yIiwiQjciLDExMjUsMjAwMyxOQSwzLE5BLE5BLDEsMjIsMjEsMjEsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw3MDEKIkNGLTIiLCJCOCIsMTEzOCwyMDA4LDEsMSwwLDAsOSw4Niw3Nyw4LjU1NTU1NTU1NTU1NTU2LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzA3CiJDRi0yIiwiQjkiLDExNTUsMjAwOCwxLDEsMCwwLDEsMTUsMTQsMTQsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4MjEKIkNGLTIiLCJCOSIsMTE2NywyMDA2LDEsMiwxLDEsNSwxNSwxMCwyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTQ0MgoiQ0YtMiIsIkMxMCIsMTE4MywyMDAzLDEsMywyLDIsNCwyNSwyMSw1LjI1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsODExCiJDRi0yIiwiQzEwIiwxMTg3LDIwMDQsMSwzLDIsMiw3LDQ2LDM5LDUuNTcxNDI4NTcxNDI4NTcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4NTUKIkNGLTIiLCJDNyIsMTIyMCwyMDA3LDEsNiw1LDUsMTIsNzgsNjYsNS41LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjA3CiJDRi0yIiwiQzciLDEyMzEsMjAwNCwxLDQsMywzLDUsNDcsNDIsOC40LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTY2CiJDRi0yIiwiQzciLDEyNDAsMjAwNSxOQSwxLE5BLE5BLDAsMTEsMTEsSW5mLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTcwCiJDRi0yIiwiQzgiLDEyNTEsMTk5OSw0LDQsMCwwLDAsNDcsNDcsSW5mLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTUxCiJDRi0yIiwiQzgiLDEyNjUsMjAwOCwxLDQsMywzLDcsOTMsODYsMTIuMjg1NzE0Mjg1NzE0MyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDY3NwoiQ0YtMiIsIkM5IiwxMjc3LDIwMDMsMiwyLDAsMCwxMSwzNSwyNCwyLjE4MTgxODE4MTgxODE4LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTkwCiJDRi0yIiwiQzkiLDEyOTAsMjAwNCwxLDUsNCw0LDcsNTMsNDYsNi41NzE0Mjg1NzE0Mjg1NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDY4MwoiQ0YtMiIsIkM5IiwxMzA5LDIwMDgsMSwyLDEsMSw2LDIzLDE3LDIuODMzMzMzMzMzMzMzMzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4NDEKIkNGLTIiLCJDOSIsMTMyMSwyMDAzLDEsMSwwLDAsMywxMCw3LDIuMzMzMzMzMzMzMzMzMzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4NTQKIkNGLTIiLCJDOSIsMTMyOSwyMDA2LDEsMSwwLDAsMiwxMywxMSw1LjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw5MjMKIkNGLTIiLCJDOSIsMTMzMCwyMDA4LDEsMSwwLDAsMCw4LDgsSW5mLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTM2CiJDRi0yIiwiRDYiLDEzNjUsMjAwMCwzLDIsLTEsMC4zMzMzMzMzMzMzMzMzMzMsNiwyMSwxNSwyLjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyMDkKIkNGLTIiLCJENiIsMTM4MCwyMDA2LDEsMSwwLDAsMyw5LDYsMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEzNTgKIkNGLTIiLCJENyIsMTM5OSwyMDA0LDEsMSwwLDAsMiwxMywxMSw1LjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2MjcKIkNGLTIiLCJFNyIsMTQ2NywyMDAyLDEsNCwzLDMsNiwzNiwzMCw1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzI0CiJDRi0yIiwiRTciLDE0NjgsMjAwMSwxLDQsMywzLDcsMjUsMTgsMi41NzE0Mjg1NzE0Mjg1NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDYxMQoiQ0YtMiIsIkU3IiwxNDcwLDIwMDYsMiwyLDAsMCwyLDIwLDE4LDksTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw3NjYKIkNGLTIiLCJFOCIsMTQ4MiwyMDA0LDEsMSwwLDAsNCwxNiwxMiwzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzI2CiJDRi0yIiwiRTkiLDE0OTMsMjAwOCwxLDYsNSw1LDE1LDkxLDc2LDUuMDY2NjY2NjY2NjY2NjcsMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE5NgoiQ0YtMiIsIkYxMCIsMTUwNCwyMDAyLDcsNiwtMSwwLjE0Mjg1NzE0Mjg1NzE0MywxNCw1Niw0MiwzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzE0CiJDRi0yIiwiRjYiLDE1NDEsMjAwNCwxLDIsMSwxLDEsMTYsMTUsMTUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw3MjgKIkNGLTIiLCJGNiIsMTU0NCwyMDA3LDEsMSwwLDAsMywxMCw3LDIuMzMzMzMzMzMzMzMzMzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNDAyCiJDRi0yIiwiRjciLDE1NTEsMjAwMCwxLDIsMSwxLDAsMTAsMTAsSW5mLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTczCiJDRi0yIiwiRzkiLDE2ODQsMjAwMywxLDQsMywzLDgsNDUsMzcsNC42MjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2MDYKIkNGLTIiLCJIMTAiLDE3MTEsMjAwNywxLDEsMCwwLDQsMTQsMTAsMi41LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTEyCiJDRi0yIiwiSDYiLDE3NTIsMjAwOCwxLDQsMywzLDIzLDg0LDYxLDIuNjUyMTczOTEzMDQzNDgsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw3MjAKIkNGLTIiLCJINyIsMTc3OSwyMDAxLDIsMiwwLDAsNCwyMCwxNiw0LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjgwCiJDRi0yIiwiSDciLDE3OTAsMjAwNiwxLDIsMSwxLDIsMjUsMjMsMTEuNSxOQSxGQUxTRSxGQUxTRSwiYnJhbmNoIixOQSwibWVhc3VyZWQiLDk2OQoiQ0YtMiIsIkg5IiwxODMzLDIwMDEsMSw1LDQsNCwxMyw1MiwzOSwzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjkzCiJDRi0yIiwiSTEwIiwxODU1LDIwMDcsMSwyLDEsMSwyLDI1LDIzLDExLjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw5MzgKIkNGLTIiLCJJNiIsMTg2NSwyMDA4LDEsMywyLDIsOSw0MSwzMiwzLjU1NTU1NTU1NTU1NTU2LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDQ3CiJDRi0yIiwiSTYiLDE4NzAsMjAwMywxLDMsMiwyLDYsMzUsMjksNC44MzMzMzMzMzMzMzMzMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDUyMwoiQ0YtMiIsIkk2IiwxODc2LDIwMDgsMSwxLDAsMCw1LDE1LDEwLDIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyMDAxCiJDRi0yIiwiSTYiLDE4OTAsMjAwOCwxLDEsMCwwLDQsMTQsMTAsMi41LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjA2MgoiQ0YtMiIsIkk3IiwxOTA3LDIwMDQsMywzLDAsMCwxMCw0MywzMywzLjMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0MzIKIkNGLTIiLCJJOSIsMTkzMywyMDA0LDIsMywxLDAuNSwzMCw5MCw2MCwyLDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzODcKIkNGLTIiLCJJOSIsMTkzNiwyMDAxLDEsMSwwLDAsMywxMCw3LDIuMzMzMzMzMzMzMzMzMzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1NzQKIkNGLTIiLCJJOSIsMTk0MywyMDA4LDEsMSwwLDAsMiwxNSwxMyw2LjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2NjgKIkNGLTIiLCJJOSIsMTk1MCwyMDAzLDEsMiwxLDEsMTIsNzcsNjUsNS40MTY2NjY2NjY2NjY2NywyLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNjk4CiJDRi0yIiwiSTkiLDE5NTIsMjAwNCwxLDEsMCwwLDIsMjcsMjUsMTIuNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDcwMwoiQ0YtMiIsIkoxMCIsMTk3NywyMDA1LDEsMSwwLDAsMCwxMCwxMCxJbmYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0MTMKIkNGLTIiLCJKMTAiLDE5ODcsMjAwOCwyLDQsMiwxLDE1LDQ4LDMzLDIuMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDc3NwoiQ0YtMiIsIko4IiwyMTAyLDIwMDMsNSw0LC0xLDAuMiwyMCw2MCw0MCwyLDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMzE3CiJDRi0yIiwiSjgiLDIxMDIsMjAwNiwxLDIsMSwxLDE4LDU3LDM5LDIuMTY2NjY2NjY2NjY2NjcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMzE3CiJDRi0yIiwiSjkiLDIxMzAsMjAwNCwzLDMsMCwwLDE1LDQ4LDMzLDIuMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQwNQoiQ0YtMiIsIko5IiwyMTM2LDIwMDEsMSwyLDEsMSw1LDE4LDEzLDIuNixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDU2MAoiQ0YtMiIsIko5IiwyMTM3LDIwMDIsOCw2LC0yLDAuMjUsMCw0Nyw0NyxJbmYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1NjIKIkNGLTIiLCJKOSIsMjE0MywyMDAxLDEsMiwxLDEsNCwxMyw5LDIuMjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2NDEKIkNGLTIiLCJKOSIsMjE1MiwyMDA2LDMsNCwxLDAuMzMzMzMzMzMzMzMzMzMzLDUsNDksNDQsOC44LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsODcxCiJDRi0yIiwiSjkiLDIxNjIsMjAwOCwyLDMsMSwwLjUsMTIsMzgsMjYsMi4xNjY2NjY2NjY2NjY2NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE0MDcKIkZGLTMiLCJBNSIsMjE4NSwyMDA4LDEsMSwwLDAsNiwyMiwxNiwyLjY2NjY2NjY2NjY2NjY3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjk4CiJGRi0zIiwiQTgiLDIyMDksMjAwMywxLDEsMCwwLDExLDQwLDI5LDIuNjM2MzYzNjM2MzYzNjQsTkEsRkFMU0UsRkFMU0UsImJyYW5jaCIsTkEsIm1lYXN1cmVkIiwxNjIKIkZGLTMiLCJCMSIsMjIzMCwyMDA2LDEsMiwxLDEsNSwxOCwxMywyLjYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzNTAKIkZGLTMiLCJCNSIsMjI0NSwyMDA2LDMsNCwxLDAuMzMzMzMzMzMzMzMzMzMzLDMsMzIsMjksOS42NjY2NjY2NjY2NjY2NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDczCiJGRi0zIiwiQjciLDIyNTksMjAwOCwxLDIsMSwxLDIxLDk3LDc2LDMuNjE5MDQ3NjE5MDQ3NjIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzOTcKIkZGLTMiLCJCOCIsMjI2OSwyMDA0LDEsMSwwLDAsMyw5LDYsMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDMwMgoiRkYtMyIsIkI4IiwyMjcxLDIwMDQsMSwxLDAsMCwzLDEyLDksMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDMwNgoiRkYtMyIsIkMxMCIsMjI3OCwyMDAyLDMsMywwLDAsMCwzNiwzNixJbmYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNAoiRkYtMyIsIkMxMCIsMjI3OSwyMDA1LDEsMSwwLDAsMCwxMywxMyxJbmYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzMgoiRkYtMyIsIkMyIiwyMjgzLDIwMDIsMSwzLDIsMiw2LDI3LDIxLDMuNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDIxMAoiRkYtMyIsIkMzIiwyMjkyLDIwMDEsMiw1LDMsMS41LDQsNDAsMzYsOSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDgwCiJGRi0zIiwiRDYiLDI0MjYsMjAwMCwxLDIsMSwxLDcsMjIsMTUsMi4xNDI4NTcxNDI4NTcxNCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEzMgoiRkYtMyIsIkQ2IiwyNDI4LDIwMDQsMyw1LDIsMC42NjY2NjY2NjY2NjY2NjcsMTcsNzUsNTgsMy40MTE3NjQ3MDU4ODIzNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE0OAoiRkYtMyIsIkQ2IiwyNDMzLDIwMDcsMywzLDAsMCwzNiwxMTYsODAsMi4yMjIyMjIyMjIyMjIyMiwxLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjYxCiJGRi0zIiwiRDkiLDI0NjYsMjAwMCwxLDEsMCwwLDQsMTIsOCwyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTcxCiJGRi0zIiwiRDkiLDI0NjcsMjAwMCwxLDEsMCwwLDIsMTIsMTAsNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE5MAoiRkYtMyIsIkUxIiwyNDg5LDIwMDIsTkEsOSxOQSxOQSwxLDkwLDg5LDg5LDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzNzUxCiJGRi0zIiwiRTMiLDI1MTEsMjAwNywyLDIsMCwwLDI0LDc2LDUyLDIuMTY2NjY2NjY2NjY2NjcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzMzAKIkZGLTMiLCJFNCIsMjUxNSwyMDA2LDEsMywyLDIsNiw1MSw0NSw3LjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMzgKIkZGLTMiLCJFNiIsMjUzMiwyMDAwLDEsMSwwLDAsNCwxOCwxNCwzLjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxODAKIkZGLTMiLCJFNyIsMjU0OCwyMDA3LDEsMSwwLDAsNiwxOCwxMiwyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTQyCiJGRi02IiwiQTEwIiwyNTg4LDIwMDYsMiwzLDEsMC41LDEyLDkwLDc4LDYuNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDgyCiJGRi02IiwiQTEwIiwyNTkwLDIwMDMsMiwyLDAsMCwxNiw2Myw0NywyLjkzNzUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0NjUKIkZGLTYiLCJBMiIsMjU5MywyMDAxLDMsMSwtMiwwLjY2NjY2NjY2NjY2NjY2NywxMCwzNiwyNiwyLjYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxOTIKIkZGLTYiLCJBMiIsMjYwMSwyMDAyLDEsMSwwLDAsNCwxMyw5LDIuMjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1NDgKIkZGLTYiLCJBMyIsMjYxMCwyMDAyLDEsNCwzLDMsNSwyMSwxNiwzLjIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1NTcKIkZGLTYiLCJBNCIsMjYyMSwyMDA0LDIsMiwwLDAsMTMsNDAsMjcsMi4wNzY5MjMwNzY5MjMwOCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQyMwoiRkYtNiIsIkE0IiwyNjI0LDIwMDQsMiwxLC0xLDAuNSwxLDE1LDE0LDE0LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTkxCiJGRi02IiwiQTkiLDI3MjEsMjAwNSwxLDIsMSwxLDExLDY4LDU3LDUuMTgxODE4MTgxODE4MTgsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzNjMKIkZGLTYiLCJBOSIsMjcyNiwyMDA2LDEsMiwxLDEsMjEsNjgsNDcsMi4yMzgwOTUyMzgwOTUyNCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQ2NgoiRkYtNiIsIkE5IiwyNzMwLDIwMDQsMSwzLDIsMiwxMiw0OSwzNywzLjA4MzMzMzMzMzMzMzMzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTg4CiJGRi02IiwiQjEwIiwyNzQxLDIwMDUsMywyLC0xLDAuMzMzMzMzMzMzMzMzMzMzLDE3LDc0LDU3LDMuMzUyOTQxMTc2NDcwNTksTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2NQoiRkYtNiIsIkI2IiwyODU1LDIwMDQsMSwxLDAsMCw2LDE5LDEzLDIuMTY2NjY2NjY2NjY2NjcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2MzEKIkZGLTYiLCJCOCIsMjg2MywyMDAwLDEsMSwwLDAsNCwyMSwxNyw0LjI1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzU0CiJGRi02IiwiQjgiLDI4NjksMjAwNiwxLDMsMiwyLDEwLDUxLDQxLDQuMSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDUwOQoiRkYtNiIsIkI4IiwyODc0LDIwMDQsMSwxLDAsMCw1LDE1LDEwLDIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2ODYKIkZGLTYiLCJDNSIsMjk4NiwyMDAwLDEsMSwwLDAsNSwyMiwxNywzLjQsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzMjkKIkZGLTYiLCJDNSIsMjk5OSwyMDA0LDEsMywyLDIsNyw2NCw1Nyw4LjE0Mjg1NzE0Mjg1NzE0LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTcxCiJGRi02IiwiQzUiLDMwMDIsMjAwNCwxLDMsMiwyLDUsMTYsMTEsMi4yLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNjk3CiJGRi02IiwiQzgiLDMwNDgsMjAwNCwxLDMsMiwyLDMsMjAsMTcsNS42NjY2NjY2NjY2NjY2NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDI0MwoiRkYtNiIsIkM5IiwzMDYyLDIwMDIsMSwzLDIsMiwxNyw4MSw2NCwzLjc2NDcwNTg4MjM1Mjk0LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTkKIkZGLTYiLCJEMSIsMzA5OCwxOTk5LDIsMiwwLDAsMTcsNTEsMzQsMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE1MgoiRkYtNiIsIkQ1IiwzMTYxLDIwMDQsMSwyLDEsMSwxMCwzMywyMywyLjMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyOTIKIkZGLTYiLCJENSIsMzE4MiwyMDA2LDEsMywyLDIsMTAsMzcsMjcsMi43LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzM0CiJGRi02IiwiRDYiLDMyMDksMjAwMywxLDUsNCw0LDEyLDUxLDM5LDMuMjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0OTAKIkZGLTYiLCJENyIsMzIyMSwyMDAwLDEsMSwwLDAsNiwxOSwxMywyLjE2NjY2NjY2NjY2NjY3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjczCiJGRi02IiwiRDciLDMyMzQsMjAwMywxLDUsNCw0LDcsNzUsNjgsOS43MTQyODU3MTQyODU3MSwyLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTI0CiJGRi02IiwiRTEiLDMyNzgsMjAwNSwxLDQsMywzLDcsNDEsMzQsNC44NTcxNDI4NTcxNDI4NixOQSxGQUxTRSxGQUxTRSwiYnJhbmNoIixOQSwibWVhc3VyZWQiLDY2MgoiRkYtNiIsIkUxMCIsMzI5MCwyMDA0LDEsMywyLDIsMTAsNzEsNjEsNi4xLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTIzCiJGRi02IiwiRTIiLDMyOTUsMjAwNiwxLDQsMywzLDEzLDQ1LDMyLDIuNDYxNTM4NDYxNTM4NDYsTkEsRkFMU0UsRkFMU0UsImJyYW5jaCIsTkEsIm1lYXN1cmVkIiw4CiJGRi02IiwiRTIiLDMyOTgsMjAwMiwxLDMsMiwyLDcsMzgsMzEsNC40Mjg1NzE0Mjg1NzE0MyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEzNwoiRkYtNiIsIkUyIiwzMzAwLDIwMDQsMSw0LDMsMyw3LDQ0LDM3LDUuMjg1NzE0Mjg1NzE0MjksTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxODkKIkZGLTYiLCJFMiIsMzMwOCwyMDA1LDEsMSwwLDAsMywxMCw3LDIuMzMzMzMzMzMzMzMzMzMsTkEsRkFMU0UsRkFMU0UsImJyYW5jaCIsTkEsIm1lYXN1cmVkIiw2NjgKIkZGLTYiLCJFMiIsMzMwOCwyMDA2LDEsMywyLDIsMTAsMzAsMjAsMixOQSxGQUxTRSxGQUxTRSwiYnJhbmNoIixOQSwibWVhc3VyZWQiLDY2OAoiRkYtNiIsIkUyIiwzMzExLDIwMDUsMSwxLDAsMCwzLDE1LDEyLDQsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2ODcKIkZGLTYiLCJFMiIsMzMxNCwyMDA1LDEsMSwwLDAsMyw5LDYsMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDY5MAoiRkYtNiIsIkUyIiwzMzE3LDIwMDYsMiwxLC0xLDAuNSw2LDE5LDEzLDIuMTY2NjY2NjY2NjY2NjcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2OTkKIkZGLTYiLCJFNSIsMzM0NCwyMDA0LDEsMSwwLDAsNCwyMCwxNiw0LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDQ5CiJGRi02IiwiRTUiLDMzNTEsMjAwMywxLDUsNCw0LDE1LDUwLDM1LDIuMzMzMzMzMzMzMzMzMzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2MjUKIkZGLTYiLCJFNyIsMzM1OCwxOTk5LDIsMywxLDAuNSwxMyw2Niw1Myw0LjA3NjkyMzA3NjkyMzA4LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjE2CiJGRi02IiwiRTciLDMzNjgsMjAwMywxLDYsNSw1LDE1LDY1LDUwLDMuMzMzMzMzMzMzMzMzMzMsMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDUxMQoiRkYtNiIsIkU3IiwzMzcwLDIwMDEsMSwzLDIsMiwxMSw2MSw1MCw0LjU0NTQ1NDU0NTQ1NDU1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTE3CiJGRi00IiwiQTgiLDM0NDYsMjAwMSwxLDIsMSwxLDgsMjQsMTYsMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDIxNQoiRkYtNCIsIkE5IiwzNDYwLDIwMDEsMSwxLDAsMCw4LDI3LDE5LDIuMzc1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjczCiJGRi00IiwiQjEiLDM0NjYsMjAwMywxLDQsMywzLDQsNTAsNDYsMTEuNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDMzMwoiRkYtNCIsIkI3IiwzNTE0LDIwMDMsMSwzLDIsMiwxMCwzOSwyOSwyLjksTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzNDcKIkZGLTQiLCJCOSIsMzUzNiwyMDA3LDEsMSwwLDAsOCwyOCwyMCwyLjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMDUKIkZGLTQiLCJEMTAiLDM2MDcsMjAwNCwxLDEsMCwwLDEwLDMwLDIwLDIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyNgoiRkYtNCIsIkQzIiwzNjE5LDE5OTksMyw0LDEsMC4zMzMzMzMzMzMzMzMzMzMsMjEsNzYsNTUsMi42MTkwNDc2MTkwNDc2MixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE2NAoiRkYtNCIsIkU5IiwzNzg1LDIwMDIsTkEsMixOQSxOQSwxLDUzLDUyLDUyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTEKIkZGLTciLCJBMyIsMzgzOCwyMDAwLDEsMSwwLDAsMiwxMSw5LDQuNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQ1MgoiRkYtNyIsIkE0IiwzODQ4LDIwMDAsMSwxLDAsMCw2LDIxLDE1LDIuNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQzNgoiRkYtNyIsIkE0IiwzODQ5LDIwMDAsMSwxLDAsMCw4LDI0LDE2LDIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0MzkKIkZGLTciLCJBNCIsMzg1MCwyMDAwLDEsMSwwLDAsNiwxOCwxMiwyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDc1CiJGRi03IiwiQTUiLDM4OTYsMjAwNiwxLDcsNiw2LDIwLDgwLDYwLDMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4NTQKIkZGLTciLCJBNiIsMzkxMSwyMDA1LDEsMiwxLDEsMjAsNjAsNDAsMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDk3NAoiRkYtNyIsIkE3IiwzOTE2LDIwMDYsMiw1LDMsMS41LDI4LDg1LDU3LDIuMDM1NzE0Mjg1NzE0MjksTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMjkKIkZGLTciLCJBNyIsMzkzMywyMDA0LDQsMiwtMiwwLjUsMzIsMTI3LDk1LDIuOTY4NzUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw5MzMKIkZGLTciLCJBOSIsNDAxNSwyMDAzLDEsMSwwLDAsMywxMCw3LDIuMzMzMzMzMzMzMzMzMzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw5MjYKIkZGLTciLCJBOSIsNDAxNSwyMDA2LDEsMiwxLDEsMywxMSw4LDIuNjY2NjY2NjY2NjY2NjcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw5MjYKIkZGLTciLCJCMiIsNDA2NCwyMDA0LDIsMywxLDAuNSwyMiw4NSw2MywyLjg2MzYzNjM2MzYzNjM2LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDYxCiJGRi03IiwiQjMiLDQwNzksMjAwMCwxLDEsMCwwLDQsMTIsOCwyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDE1CiJGRi03IiwiQjMiLDQwODIsMjAwMCwxLDEsMCwwLDYsMjAsMTQsMi4zMzMzMzMzMzMzMzMzMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQzNQoiRkYtNyIsIkIzIiw0MDg0LDIwMDAsMSwxLDAsMCw1LDIyLDE3LDMuNCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQ0NwoiRkYtNyIsIkIzIiw0MDg4LDIwMDAsMSwxLDAsMCw2LDE4LDEyLDIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0ODIKIkZGLTciLCJCMyIsNDEwOCwyMDA0LDEsMywyLDIsMywyNywyNCw4LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTM5OQoiRkYtNyIsIkI0Iiw0MTE1LDIwMDAsMSwxLDAsMCwzLDIwLDE3LDUuNjY2NjY2NjY2NjY2NjcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0MjYKIkZGLTciLCJCNCIsNDEyNCwyMDA2LDEsNSw0LDQsMyw0Myw0MCwxMy4zMzMzMzMzMzMzMzMzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzcxCiJGRi03IiwiQjUiLDQxNDQsMjAwNCwxLDMsMiwyLDcsMzYsMjksNC4xNDI4NTcxNDI4NTcxNCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDI3MwoiRkYtNyIsIkI2Iiw0MTc1LDIwMDIsNiw1LC0xLDAuMTY2NjY2NjY2NjY2NjY3LDAsNTksNTksSW5mLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzAyCiJGRi03IiwiQjYiLDQxNzcsMjAwNiw1LDksNCwwLjgsNiw4NSw3OSwxMy4xNjY2NjY2NjY2NjY3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzA1CiJGRi03IiwiQjYiLDQxODAsMjAwNSwxLDMsMiwyLDMsMzYsMzMsMTEsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw3MjMKIkZGLTciLCJCNyIsNDIwNiwyMDAxLDEsMywyLDIsNiwyNSwxOSwzLjE2NjY2NjY2NjY2NjY3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNjA5CiJGRi03IiwiQjciLDQyMjcsMjAwNiwxLDQsMywzLDgsMzUsMjcsMy4zNzUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMzg3CiJGRi03IiwiQjkiLDQyNTIsMTk5OSwyLDMsMSwwLjUsMCw1Niw1NixJbmYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxODMKIkZGLTciLCJCOSIsNDI2MSwyMDA0LDMsMywwLDAsMTgsNTUsMzcsMi4wNTU1NTU1NTU1NTU1NixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDY0MgoiRkYtNyIsIkI5Iiw0MjY1LDIwMDQsMSwxLDAsMCwzLDEwLDcsMi4zMzMzMzMzMzMzMzMzMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDk2OAoiRkYtNyIsIkMyIiw0Mjk0LDIwMDEsMSwzLDIsMiw5LDQwLDMxLDMuNDQ0NDQ0NDQ0NDQ0NDQsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2MzQKIkZGLTciLCJDMiIsNDI5NSwyMDAyLDEsNSw0LDQsOCwzMCwyMiwyLjc1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNjQxCiJGRi03IiwiQzMiLDQzMDcsMjAwMCwxLDEsMCwwLDUsMTYsMTEsMi4yLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNjMyCiJGRi03IiwiQzMiLDQzMTQsMjAwMCwxLDEsMCwwLDUsMTYsMTEsMi4yLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTM5NgoiRkYtNyIsIkM0Iiw0MzI4LDIwMDMsMywxLC0yLDAuNjY2NjY2NjY2NjY2NjY3LDAsNiw2LEluZixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEzNjEKIkZGLTciLCJDNSIsNDM0MSwyMDAzLDEsNSw0LDQsMjcsOTUsNjgsMi41MTg1MTg1MTg1MTg1MixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDc4OAoiRkYtNyIsIkM3Iiw0MzY4LDIwMDEsMywzLDAsMCwxMiw0OSwzNywzLjA4MzMzMzMzMzMzMzMzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDQwCiJGRi03IiwiQzgiLDQ0MDEsMjAwNSwxLDEsMCwwLDgsNTAsNDIsNS4yNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDc3NAoiRkYtNyIsIkQ0Iiw0NDY5LDE5OTksMSwyLDEsMSwxMCwzNSwyNSwyLjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyOTIKIkZGLTciLCJENyIsNDUxNywyMDA0LDIsNSwzLDEuNSwxMCw4Myw3Myw3LjMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2ODIKIkZGLTciLCJENyIsNDUyMCwyMDA0LDEsMiwxLDEsMjcsODQsNTcsMi4xMTExMTExMTExMTExMSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDY5NQoiRkYtNyIsIkQ3Iiw0NTI1LDIwMDQsMSwyLDEsMSwxMSw0NSwzNCwzLjA5MDkwOTA5MDkwOTA5LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzExCiJGRi03IiwiRDgiLDQ1NDEsMjAwMiw0LDcsMywwLjc1LDgsNjQsNTYsNyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDYxCiJGRi03IiwiRTEiLDQ1NjksMjAwMCwxLDMsMiwyLDcsMjgsMjEsMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDI4OAoiRkYtNyIsIkU1Iiw0Njg0LDIwMDYsMyw1LDIsMC42NjY2NjY2NjY2NjY2NjcsMjIsNjYsNDQsMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDkxNwoiRkYtNyIsIkU2Iiw0NzAyLDIwMDYsMSwyLDEsMSw2LDQyLDM2LDYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMDAKIkZGLTciLCJFNiIsNDcxMSwyMDA1LDIsMSwtMSwwLjUsNiwzMCwyNCw0LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTEyCiJGRi03IiwiRTciLDQ3MjgsMjAwNCwxLDMsMiwyLDgsMzMsMjUsMy4xMjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2ODkKIkZGLTciLCJFOSIsNDc2MywyMDA0LDEsMywyLDIsMTIsNTYsNDQsMy42NjY2NjY2NjY2NjY2NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE0NQoiRkYtNyIsIkU5Iiw0Nzk0LDIwMDIsMSwzLDIsMiwxMyw0OSwzNiwyLjc2OTIzMDc2OTIzMDc3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTQxCiJGRi03IiwiRTkiLDQ3OTUsMjAwMCwxLDEsMCwwLDIsNiw0LDIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw5NDkKIkNGLTMiLCJBMSIsNDgwNCwyMDA0LDEsMywyLDIsMTQsNDQsMzAsMi4xNDI4NTcxNDI4NTcxNCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE3NwoiQ0YtMyIsIkExIiw0ODEzLDIwMDIsMywzLDAsMCwxNiw1MCwzNCwyLjEyNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDIyOQoiQ0YtMyIsIkExIiw0ODE4LDIwMDAsMSwzLDIsMiw4LDI1LDE3LDIuMTI1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNjU5CiJDRi0zIiwiQTEiLDQ4MzIsMjAwOSwxLDEsMCwwLDYsMjAsMTQsMi4zMzMzMzMzMzMzMzMzMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE3NDIKIkNGLTMiLCJBMiIsNDg2NywyMDA3LDEsNiw1LDUsOCw2NCw1Niw3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjE4CiJDRi0zIiwiQTMiLDQ5MDYsMjAwNCwyLDYsNCwyLDE0LDY0LDUwLDMuNTcxNDI4NTcxNDI4NTcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxOQoiQ0YtMyIsIkEzIiw0OTI2LDIwMDAsMSwxLDAsMCw0LDEyLDgsMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDYxMAoiQ0YtMyIsIkEzIiw0OTI5LDIwMDAsMSwxLDAsMCw0LDEyLDgsMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDY0OQoiQ0YtMyIsIkEzIiw0OTM4LDIwMDYsMiwxLC0xLDAuNSw4LDI0LDE2LDIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2OTEKIkNGLTMiLCJBMyIsNDk0MiwyMDAxLDEsMSwwLDAsMyw5LDYsMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDc3NQoiQ0YtMyIsIkEzIiw0OTU2LDIwMDYsMiwzLDEsMC41LDE1LDczLDU4LDMuODY2NjY2NjY2NjY2NjcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNjYzCiJDRi0zIiwiQTUiLDUwMDksMjAwNCwzLDMsMCwwLDEsMzAsMjksMjksTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyODAKIkNGLTMiLCJBNSIsNTAyNCwyMDAwLDEsMywyLDIsNCw1OCw1NCwxMy41LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzIyCiJDRi0zIiwiQTUiLDUwMjgsMjAwOCwzLDQsMSwwLjMzMzMzMzMzMzMzMzMzMyw5LDUwLDQxLDQuNTU1NTU1NTU1NTU1NTYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzMzQKIkNGLTMiLCJBNSIsNTAzNywyMDAxLDEsMSwwLDAsMywxMiw5LDMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4MjEKIkNGLTMiLCJBNiIsNTA1NSwyMDAwLDIsMywxLDAuNSwwLDI1LDI1LEluZixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDI2NQoiQ0YtMyIsIkE2Iiw1MDU2LDIwMDAsMyw0LDEsMC4zMzMzMzMzMzMzMzMzMzMsMTYsNTYsNDAsMi41LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjk1CiJDRi0zIiwiQTYiLDUwNTYsMjAwNCwyLDMsMSwwLjUsNSw0NCwzOSw3LjgsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyOTUKIkNGLTMiLCJBNiIsNTA1NywyMDA2LDEsNSw0LDQsOCw4Myw3NSw5LjM3NSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDI5NwoiQ0YtMyIsIkE2Iiw1MDc1LDIwMDQsMSwxLDAsMCwyLDEyLDEwLDUsTkEsRkFMU0UsRkFMU0UsImJyYW5jaCIsTkEsIm1lYXN1cmVkIiw5MDkKIkNGLTMiLCJBNyIsNTEwNCwyMDAxLDEsMSwwLDAsMywxNCwxMSwzLjY2NjY2NjY2NjY2NjY3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsODY1CiJDRi0zIiwiQTgiLDUxMjMsMjAwMCwxLDEsMCwwLDAsNyw3LEluZixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDU3MgoiQ0YtMyIsIkE4Iiw1MTI5LDIwMDIsMyw3LDQsMS4zMzMzMzMzMzMzMzMzMywxNCw2MCw0NiwzLjI4NTcxNDI4NTcxNDI5LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzU1CiJDRi0zIiwiQTkiLDUxNTEsMjAwNCwzLDQsMSwwLjMzMzMzMzMzMzMzMzMzMywyNSw4NSw2MCwyLjQsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0NTIKIkNGLTMiLCJBOSIsNTE2MSwyMDA4LDEsMSwwLDAsNSwxNywxMiwyLjQsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNjAyCiJDRi0zIiwiQjEiLDUxNzYsMjAwNSwxLDEsMCwwLDAsMjYsMjYsSW5mLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTc5CiJDRi0zIiwiQjEwIiw1MTg0LDIwMDksMSwxLDAsMCwyLDgsNiwzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDA4CiJDRi0zIiwiQjIiLDUyMDcsMjAwMCwxLDEsMCwwLDMsOSw2LDIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2ODEKIkNGLTMiLCJCMyIsNTI0NiwyMDAyLDEsMiwxLDEsMywxMSw4LDIuNjY2NjY2NjY2NjY2NjcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw5MDgKIkNGLTMiLCJCMyIsNTI0NywyMDAyLDEsMSwwLDAsNiwxOCwxMiwyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTEzCiJDRi0zIiwiQjUiLDUzMDAsMjAwOCwzLDQsMSwwLjMzMzMzMzMzMzMzMzMzMyw2LDkwLDg0LDE0LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDE5CiJDRi0zIiwiQjYiLDUzMTksMjAwMSwyLDEsLTEsMC41LDMsMjIsMTksNi4zMzMzMzMzMzMzMzMzMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQwMwoiQ0YtMyIsIkI2Iiw1MzM5LDIwMDQsMSwxLDAsMCwxLDEwLDksOSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDk2MAoiQ0YtMyIsIkI3Iiw1MzYyLDIwMDQsMSwyLDEsMSwyMCw4NCw2NCwzLjIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0MzQKIkNGLTMiLCJCNyIsNTM2NCwyMDA4LDEsMywyLDIsMTIsNDYsMzQsMi44MzMzMzMzMzMzMzMzMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQ2MwoiQ0YtMyIsIkI3Iiw1MzY5LDIwMDIsMiwyLDAsMCwwLDI4LDI4LEluZixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDg0MgoiQ0YtMyIsIkI4Iiw1Mzk3LDIwMDUsMSwyLDEsMSwyMiwxMDAsNzgsMy41NDU0NTQ1NDU0NTQ1NSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQ0OQoiQ0YtMyIsIkI4Iiw1NDAyLDIwMDEsMSwxLDAsMCwzLDEwLDcsMi4zMzMzMzMzMzMzMzMzMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDg0OQoiQ0YtMyIsIkM0Iiw1NTE5LDIwMDQsMSw1LDQsNCwxOCw1OSw0MSwyLjI3Nzc3Nzc3Nzc3Nzc4LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzk3CiJDRi0zIiwiQzQiLDU1MjQsMjAwNCwxLDIsMSwxLDQsMTMsOSwyLjI1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTIyNwoiQ0YtMyIsIkM2Iiw1NTQ5LDIwMDEsMSw1LDQsNCwxMyw1OSw0NiwzLjUzODQ2MTUzODQ2MTU0LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzU0CiJDRi0zIiwiQzgiLDU1NzgsMjAwNCwxNSwxMywtMiwwLjEzMzMzMzMzMzMzMzMzMywxMCwxMDUsOTUsOS41LDIsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMTMKIkNGLTMiLCJDOCIsNTU5MSwyMDA0LDIsNiw0LDIsMTIsMTMwLDExOCw5LjgzMzMzMzMzMzMzMzMzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsODczCiJDRi0zIiwiQzkiLDU2MDQsMjAwMCwzLDUsMiwwLjY2NjY2NjY2NjY2NjY2Nyw5LDY1LDU2LDYuMjIyMjIyMjIyMjIyMjIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMDUKIkNGLTMiLCJDOSIsNTYwOSwyMDA4LDEsMSwwLDAsMTAsMzgsMjgsMi44LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDU2CiJDRi0zIiwiQzkiLDU2MTEsMjAwNCwxLDEsMCwwLDEsMzIsMzEsMzEsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0OTcKIkNGLTMiLCJEMSIsNTY1NCwyMDAzLDEsMSwwLDAsMSw3LDYsNixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDcyOQoiQ0YtMyIsIkQxMCIsNTY4NCwyMDA4LDMsMiwtMSwwLjMzMzMzMzMzMzMzMzMzMyw1LDM5LDM0LDYuOCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE2MDgKIkNGLTMiLCJEMiIsNTY4OCwxOTk5LDQsNCwwLDAsMCw4Miw4MixJbmYsMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQ0CiJDRi0zIiwiRDIiLDU3MDgsMjAwNCwyLDMsMSwwLjUsNSwzMCwyNSw1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzAwCiJDRi0zIiwiRDUiLDU3NzEsMjAwOCwxLDEsMCwwLDYsMjQsMTgsMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE3MjkKIkNGLTMiLCJENyIsNTgwOCwyMDAwLDEsNCwzLDMsMTAsNzcsNjcsNi43LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTIyCiJDRi0zIiwiRDkiLDU4NzAsMjAwOSwyLDQsMiwxLDMyLDEwMCw2OCwyLjEyNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDUwMAoiQ0YtMyIsIkU2Iiw2MDQzLDIwMDMsMSw1LDQsNCwxNSw4MCw2NSw0LjMzMzMzMzMzMzMzMzMzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzc0CiJDRi0zIiwiRTkiLDYxMjUsMjAwNCw3LDYsLTEsMC4xNDI4NTcxNDI4NTcxNDMsMjAsNjIsNDIsMi4xLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTI1CiJDRi0zIiwiRTkiLDYxMjYsMjAwNiwzLDQsMSwwLjMzMzMzMzMzMzMzMzMzMywxMSw1Myw0MiwzLjgxODE4MTgxODE4MTgyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzM3CiJDRi02IiwiQTEiLDYxMzgsMjAwNywxLDEsMCwwLDQsMTgsMTQsMy41LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDYKIkNGLTYiLCJBOSIsNjIyNywyMDAxLE5BLDQsTkEsTkEsMSw1Myw1Miw1MixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEwMgoiQ0YtNiIsIkIxIiw2MjQ3LDIwMDYsMSwyLDEsMSw1LDIzLDE4LDMuNixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDM5OAoiQ0YtNiIsIkIyIiw2MjY5LDIwMDIsMSw0LDMsMyw2LDI1LDE5LDMuMTY2NjY2NjY2NjY2NjcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyODMKIkNGLTYiLCJCNSIsNjI4MywxOTk5LDEsMiwxLDEsNSwyNCwxOSwzLjgsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxOTEKIkNGLTYiLCJCOCIsNjMyMCwyMDA2LDEsNSw0LDQsNyw3Nyw3MCwxMCxOQSxGQUxTRSxGQUxTRSwiYnJhbmNoIixOQSwibWVhc3VyZWQiLDI5MwoiQ0YtNiIsIkI5Iiw2MzI4LDIwMDcsMSwxLDAsMCwxMyw1Myw0MCwzLjA3NjkyMzA3NjkyMzA4LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzMKIkNGLTYiLCJFMTAiLDY1MTgsMjAwMSxOQSw2LE5BLE5BLDEsNTcsNTYsNTYsMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDMwNQoiQ0YtNiIsIkUyIiw2NTIwLDIwMDYsMSw1LDQsNCw4LDk4LDkwLDExLjI1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDMKIkNGLTQiLCJDMTAiLDY2MzAsMjAwNywyLDQsMiwxLDE0LDQyLDI4LDIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMTEKIkNGLTQiLCJEMiIsNjY4NiwyMDA4LDEsMywyLDIsMTAsNDMsMzMsMy4zLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDkKIkNGLTQiLCJFOSIsNjc1NSwyMDA0LDEsMSwwLDAsMSwxMCw5LDksTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0NwoiQ0YtMSIsIkExIiw2NzgwLDIwMDcsMSwzLDIsMiwxNSw2NSw1MCwzLjMzMzMzMzMzMzMzMzMzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTIKIkNGLTEiLCJBMSIsNjc4NiwyMDA0LDEsNSw0LDQsMTAsNjAsNTAsNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDcyNwoiQ0YtMSIsIkExIiw2Nzg3LDIwMDEsMSwyLDEsMSw0LDIwLDE2LDQsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw3MjgKIkNGLTEiLCJBMSIsNjc4OCwyMDAxLDEsMiwxLDEsNCwxNSwxMSwyLjc1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzMzCiJDRi0xIiwiQTEiLDY3ODksMjAwMiwyLDUsMywxLjUsMTgsNjIsNDQsMi40NDQ0NDQ0NDQ0NDQ0NCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDczNgoiQ0YtMSIsIkExIiw2NzkyLDIwMDEsMSwxLDAsMCw0LDEzLDksMi4yNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDc3MQoiQ0YtMSIsIkExIiw2Nzk1LDIwMDEsMSwxLDAsMCw2LDE4LDEyLDIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw3ODYKIkNGLTEiLCJBMSIsNjc5NiwyMDAxLDEsMywyLDIsOCwyOCwyMCwyLjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw3ODcKIkNGLTEiLCJBMSIsNjgwMywyMDAxLDEsMiwxLDEsNiwyNCwxOCwzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzk4CiJDRi0xIiwiQTEiLDY4MDUsMjAwMSwxLDIsMSwxLDUsMjUsMjAsNCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDgwMwoiQ0YtMSIsIkExIiw2ODA3LDIwMDEsMSw0LDMsMyw2LDIwLDE0LDIuMzMzMzMzMzMzMzMzMzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4MDcKIkNGLTEiLCJBMSIsNjgxMSwyMDAyLDEsMiwxLDEsMTEsMzYsMjUsMi4yNzI3MjcyNzI3MjcyNyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDgzMgoiQ0YtMSIsIkExIiw2ODExLDIwMDQsNSwzLC0yLDAuNCw0LDQ0LDQwLDEwLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsODMyCiJDRi0xIiwiQTEiLDY4MTIsMjAwMywyLDEsLTEsMC41LDE1LDExNSwxMDAsNi42NjY2NjY2NjY2NjY2NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDg0NwoiQ0YtMSIsIkExIiw2ODIwLDIwMDIsMSwzLDIsMiw5LDMwLDIxLDIuMzMzMzMzMzMzMzMzMzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4OTgKIkNGLTEiLCJBMiIsNjg1NywyMDA1LDEsMSwwLDAsNywyNSwxOCwyLjU3MTQyODU3MTQyODU3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTMKIkNGLTEiLCJBMiIsNjg1OCwyMDA2LDYsMywtMywwLjUsMjAsNjYsNDYsMi4zLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjMKIkNGLTEiLCJBMiIsNjg2NCwyMDAxLDEsMywyLDIsNiwyNywyMSwzLjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw3NDYKIkNGLTEiLCJBMiIsNjg2NSwyMDAxLDEsMiwxLDEsMiwxNiwxNCw3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzQ3CiJDRi0xIiwiQTIiLDY4NjYsMjAwMSwxLDIsMSwxLDQsMTcsMTMsMy4yNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDc1NwoiQ0YtMSIsIkEyIiw2ODY4LDIwMDEsMSwxLDAsMCw0LDE5LDE1LDMuNzUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw3NjUKIkNGLTEiLCJBMiIsNjg3MiwyMDAxLDEsMSwwLDAsNCwxNiwxMiwzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzkwCiJDRi0xIiwiQTIiLDY4NzMsMjAwMSwxLDIsMSwxLDMsMTIsOSwzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsODA1CiJDRi0xIiwiQTIiLDY4NzMsMjAwNCwyLDcsNSwyLjUsMTgsODAsNjIsMy40NDQ0NDQ0NDQ0NDQ0NCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDgwNQoiQ0YtMSIsIkEyIiw2ODczLDIwMDYsMiw4LDYsMywxOCw5NCw3Niw0LjIyMjIyMjIyMjIyMjIyLDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4MDUKIkNGLTEiLCJBMiIsNjg3NiwyMDAxLDEsMSwwLDAsNCwxNywxMywzLjI1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsODEyCiJDRi0xIiwiQTIiLDY4NzcsMjAwMyw2LDYsMCwwLDAsNzgsNzgsSW5mLDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4MTMKIkNGLTEiLCJBMiIsNjg3OCwyMDAxLDEsMSwwLDAsNCwxMiw4LDIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4MTYKIkNGLTEiLCJBMiIsNjg3OSwyMDAxLDEsMSwwLDAsMiwxNSwxMyw2LjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4MTgKIkNGLTEiLCJBMiIsNjg5MywyMDAzLDIsNiw0LDIsMTAsNDgsMzgsMy44LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTE0OQoiQ0YtMSIsIkEyIiw2ODk0LDIwMDYsMSwyLDEsMSw4LDI1LDE3LDIuMTI1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTE1NwoiQ0YtMSIsIkEzIiw2OTQwLDIwMDIsMSw3LDYsNiw4LDY3LDU5LDcuMzc1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsODg0CiJDRi0xIiwiQTMiLDY5NDEsMjAwOCwxLDEsMCwwLDcsMjgsMjEsMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDg5MQoiQ0YtMSIsIkEzIiw2OTQyLDIwMDIsMSwyLDEsMSw1LDE2LDExLDIuMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDkwMQoiQ0YtMSIsIkEzIiw2OTQ0LDIwMDUsMSwzLDIsMiwxMiw4MCw2OCw1LjY2NjY2NjY2NjY2NjY3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTIxCiJDRi0xIiwiQTMiLDY5NDcsMjAwMiwxLDIsMSwxLDQsMTgsMTQsMy41LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTQyCiJDRi0xIiwiQTMiLDY5NDgsMjAwNiwxLDcsNiw2LDI0LDkzLDY5LDIuODc1LDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw5NDQKIkNGLTEiLCJBMyIsNjk1NywyMDAyLDEsMiwxLDEsNSwyMCwxNSwzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTgxCiJDRi0xIiwiQTMiLDY5NTksMjAwMiwxLDMsMiwyLDUsMTYsMTEsMi4yLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTkwCiJDRi0xIiwiQTMiLDY5NjUsMjAwNCw1LDgsMywwLjYsMjUsOTEsNjYsMi42NCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDExMDcKIkNGLTEiLCJBNCIsNzAwMCwyMDAxLDEsMiwxLDEsNCwxNywxMywzLjI1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzg4CiJDRi0xIiwiQTUiLDcwNTgsMjAwNiwxLDEsMCwwLDUsMTYsMTEsMi4yLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTQ2MwoiQ0YtMSIsIkE1Iiw3MDYzLDIwMDcsMSwxLDAsMCwyLDE4LDE2LDgsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNDg0CiJDRi0xIiwiQTYiLDcwNzUsMjAwMCwxLDIsMSwxLDAsMjMsMjMsSW5mLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDQKIkNGLTEiLCJBNiIsNzA3OSwyMDAyLDIsMiwwLDAsMjYsNzksNTMsMi4wMzg0NjE1Mzg0NjE1NCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDc0CiJDRi0xIiwiQTYiLDcwODksMjAwNiwzLDMsMCwwLDEwLDEwNiw5Niw5LjYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNjgKIkNGLTEiLCJBNyIsNzExMywyMDAwLDIsMiwwLDAsMTQsNDQsMzAsMi4xNDI4NTcxNDI4NTcxNCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE1NQoiQ0YtMSIsIkE3Iiw3MTE4LDIwMDEsMSwxLDAsMCwyLDI2LDI0LDEyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzM5CiJDRi0xIiwiQTciLDcxMTksMjAwNiwxLDUsNCw0LDEzLDg3LDc0LDUuNjkyMzA3NjkyMzA3NjksMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDc0NQoiQ0YtMSIsIkE4Iiw3MTM2LDIwMDksNCw0LDAsMCwxLDUyLDUxLDUxLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTcKIkNGLTEiLCJCMiIsNzIzMywyMDAxLDEsMSwwLDAsNSwxNywxMiwyLjQsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4MTcKIkNGLTEiLCJCMiIsNzIzNCwyMDA0LDIsMSwtMSwwLjUsMTksNjYsNDcsMi40NzM2ODQyMTA1MjYzMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDg0MwoiQ0YtMSIsIkIyIiw3MjM2LDIwMDEsMSwyLDEsMSw0LDIwLDE2LDQsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4NTUKIkNGLTEiLCJCMiIsNzIzOCwyMDA0LDEsMSwwLDAsNiwyMSwxNSwyLjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw5NzEKIkNGLTEiLCJCMiIsNzIzOCwyMDA2LDEsNSw0LDQsNSw5OCw5MywxOC42LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTcxCiJDRi0xIiwiQjMiLDcyNzUsMjAwMiwzLDEsLTIsMC42NjY2NjY2NjY2NjY2NjcsMzEsMTA3LDc2LDIuNDUxNjEyOTAzMjI1ODEsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMjUKIkNGLTEiLCJCMyIsNzI4MCwyMDAwLDEsMSwwLDAsMiw5LDcsMy41LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNjMwCiJDRi0xIiwiQjQiLDczNDcsMjAwOCwxLDEsMCwwLDYsMjEsMTUsMi41LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTU3MgoiQ0YtMSIsIkI1Iiw3Mzc5LDIwMDQsMSw5LDgsOCw2LDY4LDYyLDEwLjMzMzMzMzMzMzMzMzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4MjkKIkNGLTEiLCJCNSIsNzM4OSwyMDA5LDEsMiwxLDEsMTAsNTUsNDUsNC41LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTI4NAoiQ0YtMSIsIkI3Iiw3NDcwLDIwMDgsMSwxLDAsMCwxMSwzMywyMiwyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjU0CiJDRi0xIiwiQjciLDc0ODMsMjAwOCwxLDEsMCwwLDYsMjQsMTgsMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE1ODAKIkNGLTEiLCJCOCIsNzQ4OCwyMDA4LDQsMywtMSwwLjI1LDM3LDEzMyw5NiwyLjU5NDU5NDU5NDU5NDU5LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjMzCiJDRi0xIiwiQjgiLDc0OTYsMjAwMywxLDEsMCwwLDMsMTAsNywyLjMzMzMzMzMzMzMzMzMzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTE5MwoiQ0YtMSIsIkI5Iiw3NTA3LDIwMDYsNyw2LC0xLDAuMTQyODU3MTQyODU3MTQzLDEwLDEwMCw5MCw5LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjA2CiJDRi0xIiwiQjkiLDc1MDksMjAwMCwxLDEsMCwwLDMsMTEsOCwyLjY2NjY2NjY2NjY2NjY3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNjQyCiJDRi0xIiwiQjkiLDc1MjUsMjAwNCwxLDEsMCwwLDUsMTUsMTAsMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDExMDUKIkNGLTEiLCJDMiIsNzU1OCwyMDA0LDEsNCwzLDMsMTAsNTQsNDQsNC40LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTA3MQoiQ0YtMSIsIkMzIiw3NTY3LDE5OTksNyw1LC0yLDAuMjg1NzE0Mjg1NzE0Mjg2LDAsODgsODgsSW5mLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjM1CiJDRi0xIiwiQzQiLDc2MTAsMjAwMiwxLDQsMywzLDgsNDMsMzUsNC4zNzUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4MzYKIkNGLTEiLCJDNSIsNzYzNiwyMDA4LDEsMSwwLDAsMTIsMTEwLDk4LDguMTY2NjY2NjY2NjY2NjcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4NjAKIkNGLTEiLCJDNSIsNzYzNywyMDA5LDEsMSwwLDAsOCwyNCwxNiwyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsODg4CiJDRi0xIiwiQzYiLDc2NzcsMjAwMywxLDIsMSwxLDYsMzUsMjksNC44MzMzMzMzMzMzMzMzMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDExNTQKIkNGLTEiLCJDNyIsNzY5MCwxOTk5LDEsMSwwLDAsMCw0NSw0NSxJbmYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzMjQKIkNGLTEiLCJDNyIsNzY5MiwyMDA0LDEsNCwzLDMsMTIsNjMsNTEsNC4yNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDMzNwoiQ0YtMSIsIkM3Iiw3Njk0LDIwMDQsMSwxLDAsMCwxLDIzLDIyLDIyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzU2CiJDRi0xIiwiQzciLDc2OTgsMjAwNCwxLDEsMCwwLDgsMjUsMTcsMi4xMjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzODQKIkNGLTEiLCJDNyIsNzcxMCwxOTk5LDMsNiwzLDEsMCw5OCw5OCxJbmYsMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDU5NAoiQ0YtMSIsIkQyIiw3Nzc5LDIwMDIsMywzLDAsMCwyMSw2Niw0NSwyLjE0Mjg1NzE0Mjg1NzE0LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzc1CiJDRi0xIiwiRDIiLDc3OTYsMjAwMiwxLDEsMCwwLDUsMTYsMTEsMi4yLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTI0CiJDRi0xIiwiRDIiLDc4MjQsMjAwNiwxLDQsMywzLDksNTAsNDEsNC41NTU1NTU1NTU1NTU1NixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE1MDUKIkNGLTEiLCJEMyIsNzgyOSwyMDA2LDEsMSwwLDAsMSw4LDcsNyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDI5MwoiQ0YtMSIsIkQzIiw3ODM4LDE5OTksNCw0LDAsMCwwLDQ0LDQ0LEluZixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQxMwoiQ0YtMSIsIkQzIiw3ODUxLDIwMDEsMiwxLC0xLDAuNSwxMCw0NSwzNSwzLjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1NDUKIkNGLTEiLCJEMyIsNzg3MCwyMDA2LDEsMiwxLDEsMiwxNiwxNCw3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTE4NwoiQ0YtMSIsIkQ1Iiw3OTMyLDIwMDcsMSwxLDAsMCwxLDEyLDExLDExLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzk1CiJDRi0xIiwiRTEiLDgwMTYsMjAwMiwyLDQsMiwxLDE1LDQ3LDMyLDIuMTMzMzMzMzMzMzMzMzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzMDkKIkNGLTEiLCJFMSIsODAyOCwyMDAyLDQsMywtMSwwLjI1LDIyLDcyLDUwLDIuMjcyNzI3MjcyNzI3MjcsTkEsRkFMU0UsRkFMU0UsImJyYW5jaCIsTkEsIm1lYXN1cmVkIiw1MjYKIkNGLTEiLCJFMSIsODAzMiwyMDAyLDQsNSwxLDAuMjUsMzYsMTM3LDEwMSwyLjgwNTU1NTU1NTU1NTU2LE5BLEZBTFNFLEZBTFNFLCJ0cmVlIixOQSwibWVhc3VyZWQiLDU3OAoiQ0YtMSIsIkUxMCIsODA3NCwyMDA5LDEsMSwwLDAsOCw2Myw1NSw2Ljg3NSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEwNjMKIkNGLTEiLCJFMiIsODA4MywyMDA2LDMsMiwtMSwwLjMzMzMzMzMzMzMzMzMzMyw2LDU1LDQ5LDguMTY2NjY2NjY2NjY2NjcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1MjkKIkNGLTEiLCJFMyIsODE1MywyMDA1LDMsNiwzLDEsMjQsOTAsNjYsMi43NSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDYwMAoiQ0YtMSIsIkUzIiw4MTU2LDIwMDIsMSwxLDAsMCw2LDMyLDI2LDQuMzMzMzMzMzMzMzMzMzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2MzkKIkNGLTEiLCJFMyIsODE2MywyMDAyLDEsMiwxLDEsMiwxNSwxMyw2LjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2OTgKIkNGLTEiLCJFMyIsODE3MCwyMDAxLDEsMSwwLDAsNiwyMiwxNiwyLjY2NjY2NjY2NjY2NjY3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsODU5CiJDRi0xIiwiRTMiLDgxNzEsMjAwMSwxLDEsMCwwLDQsMTIsOCwyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsODg2CiJDRi0xIiwiRTMiLDgxNzMsMjAwMSwxLDEsMCwwLDUsMTUsMTAsMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDkyMgoiQ0YtMSIsIkUzIiw4MTc5LDIwMDUsMSwyLDEsMSwxMiw1MCwzOCwzLjE2NjY2NjY2NjY2NjY3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTQwMgoiQ0YtMSIsIkU1Iiw4MjMyLDIwMDYsNCwxLC0zLDAuNzUsMjAsNjIsNDIsMi4xLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDAyCiJDRi0xIiwiRTgiLDgzMjYsMjAwNiwxLDEsMCwwLDcsMjQsMTcsMi40Mjg1NzE0Mjg1NzE0MyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDYwOQoiQ0YtMSIsIkU4Iiw4MzM5LDIwMDQsMSwyLDEsMSwzLDMxLDI4LDkuMzMzMzMzMzMzMzMzMzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMTE5CiJDRi01IiwiQTIiLDgzNjAsMjAwOSwxLDQsMywzLDAsNjIsNjIsSW5mLE5BLEZBTFNFLEZBTFNFLCJicmFuY2giLE5BLCJtZWFzdXJlZCIsNDIKIkNGLTUiLCJBOCIsODM4MSwyMDA1LDEsMSwwLDAsMTEsMzgsMjcsMi40NTQ1NDU0NTQ1NDU0NSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDc2CiJDRi01IiwiQjkiLDg0NTYsMjAwOCwxLDEsMCwwLDUsMTcsMTIsMi40LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTAKIkNGLTUiLCJCOSIsODQ1OCwyMDA5LDEsMSwwLDAsMCw3LDcsSW5mLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTYKIkNGLTUiLCJDMiIsODQ4MiwyMDA1LDEsMiwxLDEsMjIsNzEsNDksMi4yMjcyNzI3MjcyNzI3MyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE0OAoiQ0YtNSIsIkMyIiw4NDgyLDIwMDksMiwzLDEsMC41LDExLDQ1LDM0LDMuMDkwOTA5MDkwOTA5MDksTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNDgKIkNGLTUiLCJDMiIsODQ4NywyMDA4LDEsNCwzLDMsMTAsNjYsNTYsNS42LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjI3CiJDRi01IiwiQzciLDg1MDEsMjAwNiwyLDMsMSwwLjUsMjQsOTgsNzQsMy4wODMzMzMzMzMzMzMzMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDkKIkNGLTUiLCJENSIsODU1MiwyMDAyLDEsNSw0LDQsMTUsNDksMzQsMi4yNjY2NjY2NjY2NjY2NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDg3CiJDRi01IiwiRDciLDg1NzYsMjAwOCwxLDMsMiwyLDgsNDgsNDAsNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDI0NgoiQ0YtNSIsIkUxMCIsODYwNiwyMDA3LDEsMSwwLDAsOSwzMCwyMSwyLjMzMzMzMzMzMzMzMzMzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjM2CiJDRi01IiwiRTIiLDg2MTMsMjAwNywxLDIsMSwxLDE3LDcyLDU1LDMuMjM1Mjk0MTE3NjQ3MDYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxOTIKIkNGLTUiLCJFMyIsODYyMSwyMDAyLDEsNSw0LDQsMTEsNTgsNDcsNC4yNzI3MjcyNzI3MjcyNyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE4CiJDRi01IiwiRTMiLDg2MjIsMjAwNCwxLDEsMCwwLDUsMjIsMTcsMy40LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjUKIkNGLTUiLCJFOSIsODY1NiwyMDA5LDUsMSwtNCwwLjgsMCwyMiwyMixJbmYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyMDEKIkNGLTUiLCJFOSIsODY1OSwyMDA2LDEsMiwxLDEsNSwyMiwxNywzLjQsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzMzAKIkNGLTUiLCJFOSIsODY1OSwyMDA4LDEsMSwwLDAsOCwzMiwyNCwzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzMwCg==" download="extract_0001.csv">
  <button aria-label="There are 420 'fail' rows available as a CSV file." data-balloon-pos="left" style="background-color:#67C2DC;color:#FFFFFF;border:none;padding:5px;font-weight:bold;cursor:pointer;border-radius:4px;">CSV</button>
</a>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #CF142B; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">2</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect that values in `ht_diff` should be between `-100` and `100`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>col_vals_between</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_between" transform="translate(0.000000, 0.206897)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <path d="M11.993484,21.96875 C10.962234,22.082031 10.188797,22.964844 10.212234,24 L10.212234,42 C10.200515,42.722656 10.579422,43.390625 11.204422,43.753906 C11.825515,44.121094 12.598953,44.121094 13.220047,43.753906 C13.845047,43.390625 14.223953,42.722656 14.212234,42 L14.212234,24 C14.220047,23.457031 14.009109,22.9375 13.626297,22.554688 C13.243484,22.171875 12.723953,21.960938 12.180984,21.96875 C12.118484,21.964844 12.055984,21.964844 11.993484,21.96875 Z M55.993484,21.96875 C54.962234,22.082031 54.188797,22.964844 54.212234,24 L54.212234,42 C54.200515,42.722656 54.579422,43.390625 55.204422,43.753906 C55.825515,44.121094 56.598953,44.121094 57.220047,43.753906 C57.845047,43.390625 58.223953,42.722656 58.212234,42 L58.212234,24 C58.220047,23.457031 58.009109,22.9375 57.626297,22.554688 C57.243484,22.171875 56.723953,21.960938 56.180984,21.96875 C56.118484,21.964844 56.055984,21.964844 55.993484,21.96875 Z M16.212234,22 C15.661453,22 15.212234,22.449219 15.212234,23 C15.212234,23.550781 15.661453,24 16.212234,24 C16.763015,24 17.212234,23.550781 17.212234,23 C17.212234,22.449219 16.763015,22 16.212234,22 Z M20.212234,22 C19.661453,22 19.212234,22.449219 19.212234,23 C19.212234,23.550781 19.661453,24 20.212234,24 C20.763015,24 21.212234,23.550781 21.212234,23 C21.212234,22.449219 20.763015,22 20.212234,22 Z M24.212234,22 C23.661453,22 23.212234,22.449219 23.212234,23 C23.212234,23.550781 23.661453,24 24.212234,24 C24.763015,24 25.212234,23.550781 25.212234,23 C25.212234,22.449219 24.763015,22 24.212234,22 Z M28.212234,22 C27.661453,22 27.212234,22.449219 27.212234,23 C27.212234,23.550781 27.661453,24 28.212234,24 C28.763015,24 29.212234,23.550781 29.212234,23 C29.212234,22.449219 28.763015,22 28.212234,22 Z M32.212234,22 C31.661453,22 31.212234,22.449219 31.212234,23 C31.212234,23.550781 31.661453,24 32.212234,24 C32.763015,24 33.212234,23.550781 33.212234,23 C33.212234,22.449219 32.763015,22 32.212234,22 Z M36.212234,22 C35.661453,22 35.212234,22.449219 35.212234,23 C35.212234,23.550781 35.661453,24 36.212234,24 C36.763015,24 37.212234,23.550781 37.212234,23 C37.212234,22.449219 36.763015,22 36.212234,22 Z M40.212234,22 C39.661453,22 39.212234,22.449219 39.212234,23 C39.212234,23.550781 39.661453,24 40.212234,24 C40.763015,24 41.212234,23.550781 41.212234,23 C41.212234,22.449219 40.763015,22 40.212234,22 Z M44.212234,22 C43.661453,22 43.212234,22.449219 43.212234,23 C43.212234,23.550781 43.661453,24 44.212234,24 C44.763015,24 45.212234,23.550781 45.212234,23 C45.212234,22.449219 44.763015,22 44.212234,22 Z M48.212234,22 C47.661453,22 47.212234,22.449219 47.212234,23 C47.212234,23.550781 47.661453,24 48.212234,24 C48.763015,24 49.212234,23.550781 49.212234,23 C49.212234,22.449219 48.763015,22 48.212234,22 Z M52.212234,22 C51.661453,22 51.212234,22.449219 51.212234,23 C51.212234,23.550781 51.661453,24 52.212234,24 C52.763015,24 53.212234,23.550781 53.212234,23 C53.212234,22.449219 52.763015,22 52.212234,22 Z M21.462234,27.96875 C21.419265,27.976563 21.376297,27.988281 21.337234,28 C21.177078,28.027344 21.02864,28.089844 20.899734,28.1875 L15.618484,32.1875 C15.356765,32.375 15.200515,32.679688 15.200515,33 C15.200515,33.320313 15.356765,33.625 15.618484,33.8125 L20.899734,37.8125 C21.348953,38.148438 21.985672,38.058594 22.321609,37.609375 C22.657547,37.160156 22.567703,36.523438 22.118484,36.1875 L19.212234,34 L49.212234,34 L46.305984,36.1875 C45.856765,36.523438 45.766922,37.160156 46.102859,37.609375 C46.438797,38.058594 47.075515,38.148438 47.524734,37.8125 L52.805984,33.8125 C53.067703,33.625 53.223953,33.320313 53.223953,33 C53.223953,32.679688 53.067703,32.375 52.805984,32.1875 L47.524734,28.1875 C47.30989,28.027344 47.040359,27.960938 46.774734,28 C46.743484,28 46.712234,28 46.680984,28 C46.282547,28.074219 45.96614,28.382813 45.884109,28.78125 C45.802078,29.179688 45.970047,29.585938 46.305984,29.8125 L49.212234,32 L19.212234,32 L22.118484,29.8125 C22.520828,29.566406 22.696609,29.070313 22.536453,28.625 C22.380203,28.179688 21.930984,27.90625 21.462234,27.96875 Z M16.212234,42 C15.661453,42 15.212234,42.449219 15.212234,43 C15.212234,43.550781 15.661453,44 16.212234,44 C16.763015,44 17.212234,43.550781 17.212234,43 C17.212234,42.449219 16.763015,42 16.212234,42 Z M20.212234,42 C19.661453,42 19.212234,42.449219 19.212234,43 C19.212234,43.550781 19.661453,44 20.212234,44 C20.763015,44 21.212234,43.550781 21.212234,43 C21.212234,42.449219 20.763015,42 20.212234,42 Z M24.212234,42 C23.661453,42 23.212234,42.449219 23.212234,43 C23.212234,43.550781 23.661453,44 24.212234,44 C24.763015,44 25.212234,43.550781 25.212234,43 C25.212234,42.449219 24.763015,42 24.212234,42 Z M28.212234,42 C27.661453,42 27.212234,42.449219 27.212234,43 C27.212234,43.550781 27.661453,44 28.212234,44 C28.763015,44 29.212234,43.550781 29.212234,43 C29.212234,42.449219 28.763015,42 28.212234,42 Z M32.212234,42 C31.661453,42 31.212234,42.449219 31.212234,43 C31.212234,43.550781 31.661453,44 32.212234,44 C32.763015,44 33.212234,43.550781 33.212234,43 C33.212234,42.449219 32.763015,42 32.212234,42 Z M36.212234,42 C35.661453,42 35.212234,42.449219 35.212234,43 C35.212234,43.550781 35.661453,44 36.212234,44 C36.763015,44 37.212234,43.550781 37.212234,43 C37.212234,42.449219 36.763015,42 36.212234,42 Z M40.212234,42 C39.661453,42 39.212234,42.449219 39.212234,43 C39.212234,43.550781 39.661453,44 40.212234,44 C40.763015,44 41.212234,43.550781 41.212234,43 C41.212234,42.449219 40.763015,42 40.212234,42 Z M44.212234,42 C43.661453,42 43.212234,42.449219 43.212234,43 C43.212234,43.550781 43.661453,44 44.212234,44 C44.763015,44 45.212234,43.550781 45.212234,43 C45.212234,42.449219 44.763015,42 44.212234,42 Z M48.212234,42 C47.661453,42 47.212234,42.449219 47.212234,43 C47.212234,43.550781 47.661453,44 48.212234,44 C48.763015,44 49.212234,43.550781 49.212234,43 C49.212234,42.449219 48.763015,42 48.212234,42 Z M52.212234,42 C51.661453,42 51.212234,42.449219 51.212234,43 C51.212234,43.550781 51.661453,44 52.212234,44 C52.763015,44 53.212234,43.550781 53.212234,43 C53.212234,42.449219 52.763015,42 52.212234,42 Z" id="inside_range" fill="#000000" fill-rule="nonzero"></path>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">|∆ height| < 100cm</p>
    <p style="margin:0;">
      <code style="font-size:11px;">col_vals_between()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="ht_diff" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>ht_diff</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="[-100, 100]" data-balloon-pos="left"><p style="margin-top: 0px; margin-bottom: 0px; font-size: 11px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><code>[−100, 100]</code></p></div>
</div></td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>67K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>67K</code><br><code>0.99</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>11</code><br><code>0.01</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">●</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><a href="data:text/csv;base64,InBsb3RfaWQiLCJzdWJwbG90IiwicGxhbnRfaWQiLCJ5ZWFyIiwic2h0c19wcmV2Iiwic2h0cyIsInNodHNfZGlmZiIsInNodHNfcGMiLCJodF9wcmV2IiwiaHQiLCJodF9kaWZmIiwiaHRfcGMiLCJpbmZsIiwicmVjb3JkZWRfc2RsZyIsImFkdWx0X25vX3RhZyIsInRyZWVmYWxsX3N0YXR1cyIsImNvbmRpdGlvbiIsImNlbnN1c19zdGF0dXMiLCJ0YWdfbnVtYmVyIgoiRkYtMiIsIkM4Iiw0OTgsMjAwOCwyLDEsLTEsMC41LDE0MCwyNywtMTEzLDAuODA3MTQyODU3MTQyODU3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTc2CiJGRi0yIiwiQzgiLDUwMSwyMDA4LDE1LDEsLTE0LDAuOTMzMzMzMzMzMzMzMzMzLDE1NSwzNSwtMTIwLDAuNzc0MTkzNTQ4Mzg3MDk3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjQ5CiJGRi0yIiwiRDgiLDU4OSwyMDA5LDUsMSwtNCwwLjgsMTg4LDU0LC0xMzQsMC43MTI3NjU5NTc0NDY4MDgsMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEyNAoiRkYtNiIsIkEzIiwyNjA3LDIwMDYsNSw1LDAsMCwyMDUsMTAzLC0xMDIsMC40OTc1NjA5NzU2MDk3NTYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyMwoiRkYtNyIsIkI3Iiw0MjA2LDIwMDQsMyw1LDIsMC42NjY2NjY2NjY2NjY2NjcsNzIsMTgyLDExMCwxLjUyNzc3Nzc3Nzc3Nzc4LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNjA5CiJGRi03IiwiQzQiLDQzMTgsMjAwMiwxNyw0LC0xMywwLjc2NDcwNTg4MjM1Mjk0MSwxNzIsNTAsLTEyMiwwLjcwOTMwMjMyNTU4MTM5NSxOQSxGQUxTRSxGQUxTRSwiYnJhbmNoIixOQSwibWVhc3VyZWQiLDM0OAoiQ0YtMyIsIkM4Iiw1NTkxLDIwMDQsMiw2LDQsMiwxMiwxMzAsMTE4LDkuODMzMzMzMzMzMzMzMzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4NzMKIkNGLTEiLCJENSIsNzkyMiwyMDA2LDUsNywyLDAuNCwyMDAsODgsLTExMiwwLjU2LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzQ2CiJDRi0xIiwiRTEiLDgwMzIsMjAwMiw0LDUsMSwwLjI1LDM2LDEzNywxMDEsMi44MDU1NTU1NTU1NTU1NixOQSxGQUxTRSxGQUxTRSwidHJlZSIsTkEsIm1lYXN1cmVkIiw1NzgKIkNGLTEiLCJFMyIsODEzMywyMDAwLDQsNSwxLDAuMjUsOTEsMTk3LDEwNiwxLjE2NDgzNTE2NDgzNTE2LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzk5CiJDRi0xIiwiRTMiLDgxMzMsMjAwMSw1LDQsLTEsMC4yLDE5Nyw4OSwtMTA4LDAuNTQ4MjIzMzUwMjUzODA3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzk5Cg==" download="extract_0002.csv">
  <button aria-label="There are 11 'fail' rows available as a CSV file." data-balloon-pos="left" style="background-color:#67C2DC;color:#FFFFFF;border:none;padding:5px;font-weight:bold;cursor:pointer;border-radius:4px;">CSV</button>
</a>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #CF142B; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">3</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect that values in `shts_diff` should be between `-5` and `5`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>col_vals_between</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_between" transform="translate(0.000000, 0.206897)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <path d="M11.993484,21.96875 C10.962234,22.082031 10.188797,22.964844 10.212234,24 L10.212234,42 C10.200515,42.722656 10.579422,43.390625 11.204422,43.753906 C11.825515,44.121094 12.598953,44.121094 13.220047,43.753906 C13.845047,43.390625 14.223953,42.722656 14.212234,42 L14.212234,24 C14.220047,23.457031 14.009109,22.9375 13.626297,22.554688 C13.243484,22.171875 12.723953,21.960938 12.180984,21.96875 C12.118484,21.964844 12.055984,21.964844 11.993484,21.96875 Z M55.993484,21.96875 C54.962234,22.082031 54.188797,22.964844 54.212234,24 L54.212234,42 C54.200515,42.722656 54.579422,43.390625 55.204422,43.753906 C55.825515,44.121094 56.598953,44.121094 57.220047,43.753906 C57.845047,43.390625 58.223953,42.722656 58.212234,42 L58.212234,24 C58.220047,23.457031 58.009109,22.9375 57.626297,22.554688 C57.243484,22.171875 56.723953,21.960938 56.180984,21.96875 C56.118484,21.964844 56.055984,21.964844 55.993484,21.96875 Z M16.212234,22 C15.661453,22 15.212234,22.449219 15.212234,23 C15.212234,23.550781 15.661453,24 16.212234,24 C16.763015,24 17.212234,23.550781 17.212234,23 C17.212234,22.449219 16.763015,22 16.212234,22 Z M20.212234,22 C19.661453,22 19.212234,22.449219 19.212234,23 C19.212234,23.550781 19.661453,24 20.212234,24 C20.763015,24 21.212234,23.550781 21.212234,23 C21.212234,22.449219 20.763015,22 20.212234,22 Z M24.212234,22 C23.661453,22 23.212234,22.449219 23.212234,23 C23.212234,23.550781 23.661453,24 24.212234,24 C24.763015,24 25.212234,23.550781 25.212234,23 C25.212234,22.449219 24.763015,22 24.212234,22 Z M28.212234,22 C27.661453,22 27.212234,22.449219 27.212234,23 C27.212234,23.550781 27.661453,24 28.212234,24 C28.763015,24 29.212234,23.550781 29.212234,23 C29.212234,22.449219 28.763015,22 28.212234,22 Z M32.212234,22 C31.661453,22 31.212234,22.449219 31.212234,23 C31.212234,23.550781 31.661453,24 32.212234,24 C32.763015,24 33.212234,23.550781 33.212234,23 C33.212234,22.449219 32.763015,22 32.212234,22 Z M36.212234,22 C35.661453,22 35.212234,22.449219 35.212234,23 C35.212234,23.550781 35.661453,24 36.212234,24 C36.763015,24 37.212234,23.550781 37.212234,23 C37.212234,22.449219 36.763015,22 36.212234,22 Z M40.212234,22 C39.661453,22 39.212234,22.449219 39.212234,23 C39.212234,23.550781 39.661453,24 40.212234,24 C40.763015,24 41.212234,23.550781 41.212234,23 C41.212234,22.449219 40.763015,22 40.212234,22 Z M44.212234,22 C43.661453,22 43.212234,22.449219 43.212234,23 C43.212234,23.550781 43.661453,24 44.212234,24 C44.763015,24 45.212234,23.550781 45.212234,23 C45.212234,22.449219 44.763015,22 44.212234,22 Z M48.212234,22 C47.661453,22 47.212234,22.449219 47.212234,23 C47.212234,23.550781 47.661453,24 48.212234,24 C48.763015,24 49.212234,23.550781 49.212234,23 C49.212234,22.449219 48.763015,22 48.212234,22 Z M52.212234,22 C51.661453,22 51.212234,22.449219 51.212234,23 C51.212234,23.550781 51.661453,24 52.212234,24 C52.763015,24 53.212234,23.550781 53.212234,23 C53.212234,22.449219 52.763015,22 52.212234,22 Z M21.462234,27.96875 C21.419265,27.976563 21.376297,27.988281 21.337234,28 C21.177078,28.027344 21.02864,28.089844 20.899734,28.1875 L15.618484,32.1875 C15.356765,32.375 15.200515,32.679688 15.200515,33 C15.200515,33.320313 15.356765,33.625 15.618484,33.8125 L20.899734,37.8125 C21.348953,38.148438 21.985672,38.058594 22.321609,37.609375 C22.657547,37.160156 22.567703,36.523438 22.118484,36.1875 L19.212234,34 L49.212234,34 L46.305984,36.1875 C45.856765,36.523438 45.766922,37.160156 46.102859,37.609375 C46.438797,38.058594 47.075515,38.148438 47.524734,37.8125 L52.805984,33.8125 C53.067703,33.625 53.223953,33.320313 53.223953,33 C53.223953,32.679688 53.067703,32.375 52.805984,32.1875 L47.524734,28.1875 C47.30989,28.027344 47.040359,27.960938 46.774734,28 C46.743484,28 46.712234,28 46.680984,28 C46.282547,28.074219 45.96614,28.382813 45.884109,28.78125 C45.802078,29.179688 45.970047,29.585938 46.305984,29.8125 L49.212234,32 L19.212234,32 L22.118484,29.8125 C22.520828,29.566406 22.696609,29.070313 22.536453,28.625 C22.380203,28.179688 21.930984,27.90625 21.462234,27.96875 Z M16.212234,42 C15.661453,42 15.212234,42.449219 15.212234,43 C15.212234,43.550781 15.661453,44 16.212234,44 C16.763015,44 17.212234,43.550781 17.212234,43 C17.212234,42.449219 16.763015,42 16.212234,42 Z M20.212234,42 C19.661453,42 19.212234,42.449219 19.212234,43 C19.212234,43.550781 19.661453,44 20.212234,44 C20.763015,44 21.212234,43.550781 21.212234,43 C21.212234,42.449219 20.763015,42 20.212234,42 Z M24.212234,42 C23.661453,42 23.212234,42.449219 23.212234,43 C23.212234,43.550781 23.661453,44 24.212234,44 C24.763015,44 25.212234,43.550781 25.212234,43 C25.212234,42.449219 24.763015,42 24.212234,42 Z M28.212234,42 C27.661453,42 27.212234,42.449219 27.212234,43 C27.212234,43.550781 27.661453,44 28.212234,44 C28.763015,44 29.212234,43.550781 29.212234,43 C29.212234,42.449219 28.763015,42 28.212234,42 Z M32.212234,42 C31.661453,42 31.212234,42.449219 31.212234,43 C31.212234,43.550781 31.661453,44 32.212234,44 C32.763015,44 33.212234,43.550781 33.212234,43 C33.212234,42.449219 32.763015,42 32.212234,42 Z M36.212234,42 C35.661453,42 35.212234,42.449219 35.212234,43 C35.212234,43.550781 35.661453,44 36.212234,44 C36.763015,44 37.212234,43.550781 37.212234,43 C37.212234,42.449219 36.763015,42 36.212234,42 Z M40.212234,42 C39.661453,42 39.212234,42.449219 39.212234,43 C39.212234,43.550781 39.661453,44 40.212234,44 C40.763015,44 41.212234,43.550781 41.212234,43 C41.212234,42.449219 40.763015,42 40.212234,42 Z M44.212234,42 C43.661453,42 43.212234,42.449219 43.212234,43 C43.212234,43.550781 43.661453,44 44.212234,44 C44.763015,44 45.212234,43.550781 45.212234,43 C45.212234,42.449219 44.763015,42 44.212234,42 Z M48.212234,42 C47.661453,42 47.212234,42.449219 47.212234,43 C47.212234,43.550781 47.661453,44 48.212234,44 C48.763015,44 49.212234,43.550781 49.212234,43 C49.212234,42.449219 48.763015,42 48.212234,42 Z M52.212234,42 C51.661453,42 51.212234,42.449219 51.212234,43 C51.212234,43.550781 51.661453,44 52.212234,44 C52.763015,44 53.212234,43.550781 53.212234,43 C53.212234,42.449219 52.763015,42 52.212234,42 Z" id="inside_range" fill="#000000" fill-rule="nonzero"></path>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">|∆ shoot number| < 5</p>
    <p style="margin:0;">
      <code style="font-size:11px;">col_vals_between()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="shts_diff" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>shts_diff</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="[-5, 5]" data-balloon-pos="left"><p style="margin-top: 0px; margin-bottom: 0px; font-size: 11px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><code>[−5, 5]</code></p></div>
</div></td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>67K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>67K</code><br><code>0.99</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>201</code><br><code>0.01</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">●</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><a href="data:text/csv;base64,InBsb3RfaWQiLCJzdWJwbG90IiwicGxhbnRfaWQiLCJ5ZWFyIiwic2h0c19wcmV2Iiwic2h0cyIsInNodHNfZGlmZiIsInNodHNfcGMiLCJodF9wcmV2IiwiaHQiLCJodF9kaWZmIiwiaHRfcGMiLCJpbmZsIiwicmVjb3JkZWRfc2RsZyIsImFkdWx0X25vX3RhZyIsInRyZWVmYWxsX3N0YXR1cyIsImNvbmRpdGlvbiIsImNlbnN1c19zdGF0dXMiLCJ0YWdfbnVtYmVyIgoiRkYtMSIsIkE0IiwzMiwyMDA1LDIsMTEsOSw0LjUsODQsNTgsLTI2LDAuMzA5NTIzODA5NTIzODEsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNDUKIkZGLTEiLCJBNCIsMzIsMjAwNiwxMSwzLC04LDAuNzI3MjcyNzI3MjcyNzI3LDU4LDc4LDIwLDAuMzQ0ODI3NTg2MjA2ODk3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTQ1CiJGRi0yIiwiQTkiLDM5MiwyMDA4LDksMywtNiwwLjY2NjY2NjY2NjY2NjY2NywxMzAsMzUsLTk1LDAuNzMwNzY5MjMwNzY5MjMxLDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1MwoiRkYtMiIsIkE5IiwzOTMsMjAwOCwyLDksNywzLjUsNDMsNDcsNCwwLjA5MzAyMzI1NTgxMzk1MzUsTkEsRkFMU0UsVFJVRSxOQSxOQSwibWVhc3VyZWQiLDU5CiJGRi0yIiwiQTkiLDM5MywyMDA5LDksMSwtOCwwLjg4ODg4ODg4ODg4ODg4OSw0NywxNSwtMzIsMC42ODA4NTEwNjM4Mjk3ODcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1OQoiRkYtMiIsIkM3Iiw0OTEsMjAwMiw0LDEwLDYsMS41LDc3LDgxLDQsMC4wNTE5NDgwNTE5NDgwNTIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNTkKIkZGLTIiLCJDNyIsNDkxLDIwMDQsNSwxMSw2LDEuMiw5MCwxMzAsNDAsMC40NDQ0NDQ0NDQ0NDQ0NDQsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNTkKIkZGLTIiLCJDNyIsNDkxLDIwMDUsMTEsNCwtNywwLjYzNjM2MzYzNjM2MzYzNiwxMzAsMTMwLDAsMCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE1OQoiRkYtMiIsIkM4Iiw1MDEsMjAwNiw3LDEzLDYsMC44NTcxNDI4NTcxNDI4NTcsMTQwLDEzNSwtNSwwLjAzNTcxNDI4NTcxNDI4NTcsMyxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDI0OQoiRkYtMiIsIkM4Iiw1MDEsMjAwOCwxNSwxLC0xNCwwLjkzMzMzMzMzMzMzMzMzMywxNTUsMzUsLTEyMCwwLjc3NDE5MzU0ODM4NzA5NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDI0OQoiRkYtMiIsIkQxIiw1MTksMjAwMiw0LDEwLDYsMS41LDI1LDI2LDEsMC4wNCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDYzCiJGRi0yIiwiRDEiLDUxOSwyMDAzLDEwLDMsLTcsMC43LDI2LDI0LC0yLDAuMDc2OTIzMDc2OTIzMDc2OSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDYzCiJGRi0yIiwiRDMiLDU0NiwyMDA4LDEzLDcsLTYsMC40NjE1Mzg0NjE1Mzg0NjIsMTAyLDEzMCwyOCwwLjI3NDUwOTgwMzkyMTU2OSwxLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTM4CiJGRi0yIiwiRTEwIiw2MDksMjAwNyw2LDEyLDYsMSw4MCwxMDgsMjgsMC4zNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE4NgoiRkYtNSIsIkE5Iiw3MDAsMjAwNiwxMiw1LC03LDAuNTgzMzMzMzMzMzMzMzMzLDYyLDkyLDMwLDAuNDgzODcwOTY3NzQxOTM1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzgKIkZGLTUiLCJCOSIsNzgyLDIwMDQsMSw4LDcsNywyMywzMSw4LDAuMzQ3ODI2MDg2OTU2NTIyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTE2CiJGRi01IiwiQjkiLDc4MywyMDA2LDksMywtNiwwLjY2NjY2NjY2NjY2NjY2NywxMjAsMTIwLDAsMCwxLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTE4CiJGRi01IiwiQzEwIiw4MTgsMjAwNCwzLDEwLDcsMi4zMzMzMzMzMzMzMzMzMyw2Myw2NiwzLDAuMDQ3NjE5MDQ3NjE5MDQ3NixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDMzMQoiRkYtNSIsIkQzIiw4NzQsMjAwNCw0LDEyLDgsMiw2NCwxMzIsNjgsMS4wNjI1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTQKIkZGLTUiLCJEMyIsODc2LDIwMDQsOCwyLC02LDAuNzUsNTAsMjYsLTI0LDAuNDgsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1OQoiRkYtNSIsIkUxIiw4OTUsMjAwNSwxLDksOCw4LDExLDEsLTEwLDAuOTA5MDkwOTA5MDkwOTA5LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTcxCiJGRi01IiwiRTEiLDg5NSwyMDA2LDksMSwtOCwwLjg4ODg4ODg4ODg4ODg4OSwxLDE1LDE0LDE0LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTcxCiJGRi01IiwiRTEwIiw4OTgsMjAwNCw1LDE0LDksMS44LDQ4LDgzLDM1LDAuNzI5MTY2NjY2NjY2NjY3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTQ3CiJDRi0yIiwiQjciLDExMjYsMjAwNCwzLDksNiwyLDU4LDEyMCw2MiwxLjA2ODk2NTUxNzI0MTM4LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTYzCiJDRi0yIiwiQjciLDExMjYsMjAwNSw5LDIsLTcsMC43Nzc3Nzc3Nzc3Nzc3NzgsMTIwLDU1LC02NSwwLjU0MTY2NjY2NjY2NjY2NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDk2MwoiQ0YtMiIsIkMxMCIsMTE5MiwyMDAzLDcsMSwtNiwwLjg1NzE0Mjg1NzE0Mjg1Nyw0NSwxOCwtMjcsMC42LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsODcyCiJDRi0yIiwiRDciLDE0MDMsMjAwMiw2LDEyLDYsMSw3OSw5NywxOCwwLjIyNzg0ODEwMTI2NTgyMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDk2NgoiQ0YtMiIsIkQ3IiwxNDAzLDIwMDMsMTIsNiwtNiwwLjUsOTcsODQsLTEzLDAuMTM0MDIwNjE4NTU2NzAxLDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw5NjYKIkNGLTIiLCJENyIsMTQwMywyMDA0LDYsMTQsOCwxLjMzMzMzMzMzMzMzMzMzLDg0LDk1LDExLDAuMTMwOTUyMzgwOTUyMzgxLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTY2CiJDRi0yIiwiRDciLDE0MDMsMjAwNSwxNCw4LC02LDAuNDI4NTcxNDI4NTcxNDI5LDk1LDEwNCw5LDAuMDk0NzM2ODQyMTA1MjYzMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDk2NgoiQ0YtMiIsIkkxMCIsMTg1MiwyMDA2LDcsMSwtNiwwLjg1NzE0Mjg1NzE0Mjg1Nyw3Niw3MiwtNCwwLjA1MjYzMTU3ODk0NzM2ODQsMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDkwNgoiQ0YtMiIsIkk2IiwxODY5LDIwMDksNSwxMiw3LDEuNCw0NCw1NywxMywwLjI5NTQ1NDU0NTQ1NDU0NSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDUyMQoiQ0YtMiIsIkk2IiwxODczLDIwMDgsMiw5LDcsMy41LDU0LDYxLDcsMC4xMjk2Mjk2Mjk2Mjk2MyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEzNjUKIkNGLTIiLCJJOSIsMTkzNCwyMDAxLDUsMTEsNiwxLjIsNjYsNjMsLTMsMC4wNDU0NTQ1NDU0NTQ1NDU1LDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1MDgKIkNGLTIiLCJJOSIsMTk0NiwyMDA1LDEsOSw4LDgsMTMwLDE0NSwxNSwwLjExNTM4NDYxNTM4NDYxNSw0LEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNjg4CiJDRi0yIiwiSjEwIiwxOTgwLDIwMDMsOSwzLC02LDAuNjY2NjY2NjY2NjY2NjY3LDQ4LDMwLC0xOCwwLjM3NSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQxNgoiQ0YtMiIsIko4IiwyMDc1LDIwMDgsMTEsNSwtNiwwLjU0NTQ1NDU0NTQ1NDU0NSwxMDAsODAsLTIwLDAuMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQyMwoiQ0YtMiIsIko5IiwyMTI0LDE5OTksMiw4LDYsMywyMywyOSw2LDAuMjYwODY5NTY1MjE3MzkxLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzg0CiJDRi0yIiwiSjkiLDIxMjYsMjAwOSwxNiwxMCwtNiwwLjM3NSw5Nyw4NiwtMTEsMC4xMTM0MDIwNjE4NTU2NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDM5NQoiQ0YtMiIsIko5IiwyMTM2LDIwMDYsMyw5LDYsMiw1Miw1MiwwLDAsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1NjAKIkNGLTIiLCJKOSIsMjEzNiwyMDA4LDksMSwtOCwwLjg4ODg4ODg4ODg4ODg4OSw4MCw0MywtMzcsMC40NjI1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTYwCiJDRi0yIiwiSjgiLDIxNjgsMjAwMiw2LDEyLDYsMSwzNCwzOSw1LDAuMTQ3MDU4ODIzNTI5NDEyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDI2CiJDRi0yIiwiSjgiLDIxNjgsMjAwNCw4LDE0LDYsMC43NSw0NiwzOSwtNywwLjE1MjE3MzkxMzA0MzQ3OCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQyNgoiRkYtMyIsIkE4IiwyMTk2LDIwMDIsNywxLC02LDAuODU3MTQyODU3MTQyODU3LDcwLDQ1LC0yNSwwLjM1NzE0Mjg1NzE0Mjg1NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDUKIkZGLTMiLCJEOSIsMjQ2NywyMDA1LDcsMSwtNiwwLjg1NzE0Mjg1NzE0Mjg1Nyw0MSw1NCwxMywwLjMxNzA3MzE3MDczMTcwNyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE5MAoiRkYtMyIsIkQ5IiwyNDY3LDIwMDYsMSw5LDgsOCw1NCw1NSwxLDAuMDE4NTE4NTE4NTE4NTE4NSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE5MAoiRkYtNiIsIkI1IiwyODIzLDIwMDIsOCwxNyw5LDEuMTI1LDYwLDcwLDEwLDAuMTY2NjY2NjY2NjY2NjY3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzQKIkZGLTYiLCJCNSIsMjgyMywyMDAzLDE3LDksLTgsMC40NzA1ODgyMzUyOTQxMTgsNzAsNjQsLTYsMC4wODU3MTQyODU3MTQyODU3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzQKIkZGLTYiLCJCNiIsMjg0NSwyMDA1LDEzLDcsLTYsMC40NjE1Mzg0NjE1Mzg0NjIsODQsODAsLTQsMC4wNDc2MTkwNDc2MTkwNDc2LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjg1CiJGRi02IiwiQjYiLDI4NDUsMjAwNiw3LDEzLDYsMC44NTcxNDI4NTcxNDI4NTcsODAsMTEwLDMwLDAuMzc1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjg1CiJGRi02IiwiRDYiLDMxOTgsMjAwMiw0LDEwLDYsMS41LDQ4LDQ3LC0xLDAuMDIwODMzMzMzMzMzMzMzMyxOQSxGQUxTRSxGQUxTRSwiYnJhbmNoIixOQSwibWVhc3VyZWQiLDMxNAoiRkYtNiIsIkQ2IiwzMTk4LDIwMDMsMTAsMywtNywwLjcsNDcsNTAsMywwLjA2MzgyOTc4NzIzNDA0MjUsMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDMxNAoiRkYtNiIsIkU1IiwzMzQwLDIwMDMsOSwyLC03LDAuNzc3Nzc3Nzc3Nzc3Nzc4LDc5LDcwLC05LDAuMTEzOTI0MDUwNjMyOTExLDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0MwoiRkYtNiIsIkU1IiwzMzQwLDIwMDYsMywxMCw3LDIuMzMzMzMzMzMzMzMzMzMsNTksNzcsMTgsMC4zMDUwODQ3NDU3NjI3MTIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0MwoiRkYtNCIsIkMzIiwzNTYxLDIwMDUsMTAsNCwtNiwwLjYsMTU3LDEyNSwtMzIsMC4yMDM4MjE2NTYwNTA5NTUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMDYKIkZGLTciLCJBNSIsMzg3NywyMDA0LDE1LDksLTYsMC40LDcwLDg1LDE1LDAuMjE0Mjg1NzE0Mjg1NzE0LDIsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzMTYKIkZGLTciLCJBNSIsMzg4MywyMDAyLDUsMTEsNiwxLjIsMzksMzksMCwwLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDg3CiJGRi03IiwiQTUiLDM4ODMsMjAwMywxMSw1LC02LDAuNTQ1NDU0NTQ1NDU0NTQ1LDM5LDQzLDQsMC4xMDI1NjQxMDI1NjQxMDMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0ODcKIkZGLTciLCJBNSIsMzg5NiwyMDA2LDEsNyw2LDYsMjAsODAsNjAsMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDg1NAoiRkYtNyIsIkE2IiwzOTAyLDIwMDUsMTEsMTksOCwwLjcyNzI3MjcyNzI3MjcyNyw0Miw2MCwxOCwwLjQyODU3MTQyODU3MTQyOSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDMxOAoiRkYtNyIsIkE2IiwzOTAyLDIwMDYsMTksMTEsLTgsMC40MjEwNTI2MzE1Nzg5NDcsNjAsNjYsNiwwLjEsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzMTgKIkZGLTciLCJBNiIsMzkwMywyMDAyLDQsMTIsOCwyLDEwOCwxMTEsMywwLjAyNzc3Nzc3Nzc3Nzc3NzgsMyxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDMxOQoiRkYtNyIsIkE3IiwzOTE3LDIwMDIsNSwxMiw3LDEuNCw2Myw2OSw2LDAuMDk1MjM4MDk1MjM4MDk1MixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEzNAoiRkYtNyIsIkE3IiwzOTE4LDIwMDEsNywxNCw3LDEsNTksNTksMCwwLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTM3CiJGRi03IiwiQTciLDM5MTgsMjAwMywxMywzLC0xMCwwLjc2OTIzMDc2OTIzMDc2OSw0OSw3MCwyMSwwLjQyODU3MTQyODU3MTQyOSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEzNwoiRkYtNyIsIkE3IiwzOTI0LDIwMDMsOSwyLC03LDAuNzc3Nzc3Nzc3Nzc3Nzc4LDY3LDgwLDEzLDAuMTk0MDI5ODUwNzQ2MjY5LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjM1CiJGRi03IiwiQTciLDM5MjUsMjAwMSw0LDEyLDgsMiw0Myw0Nyw0LDAuMDkzMDIzMjU1ODEzOTUzNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDI0MQoiRkYtNyIsIkE3IiwzOTI1LDIwMDUsMTcsNCwtMTMsMC43NjQ3MDU4ODIzNTI5NDEsOTgsNDYsLTUyLDAuNTMwNjEyMjQ0ODk3OTU5LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjQxCiJGRi03IiwiQjQiLDQxMTksMjAwMiw2LDEyLDYsMSw0Miw0Niw0LDAuMDk1MjM4MDk1MjM4MDk1MixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDYxOAoiRkYtNyIsIkI0Iiw0MTE5LDIwMDMsMTIsNiwtNiwwLjUsNDYsNzUsMjksMC42MzA0MzQ3ODI2MDg2OTYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw2MTgKIkZGLTciLCJCNCIsNDEzNCwyMDAxLDYsMTIsNiwxLDE1MCwxNTAsMCwwLDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMzE2CiJGRi03IiwiQjQiLDQxMzQsMjAwMyw3LDEsLTYsMC44NTcxNDI4NTcxNDI4NTcsMTE3LDkwLC0yNywwLjIzMDc2OTIzMDc2OTIzMSwxLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTMxNgoiRkYtNyIsIkI1Iiw0MTQwLDIwMDEsNSwxMSw2LDEuMiw3Niw1OSwtMTcsMC4yMjM2ODQyMTA1MjYzMTYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyNAoiRkYtNyIsIkI1Iiw0MTUxLDIwMDEsMywxMSw4LDIuNjY2NjY2NjY2NjY2NjcsNDgsNTcsOSwwLjE4NzUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0NzAKIkZGLTciLCJCNSIsNDE2NCwyMDAxLDUsMTIsNywxLjQsNDksNTQsNSwwLjEwMjA0MDgxNjMyNjUzMSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEzNTQKIkZGLTciLCJCNiIsNDE3NCwyMDAyLDAsOCw4LEluZiw1NCwxMTAsNTYsMS4wMzcwMzcwMzcwMzcwNCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDI3NAoiRkYtNyIsIkI3Iiw0MjAyLDIwMDYsMTEsNSwtNiwwLjU0NTQ1NDU0NTQ1NDU0NSw5OCw3OSwtMTksMC4xOTM4Nzc1NTEwMjA0MDgsMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE3MQoiRkYtNyIsIkI3Iiw0MjAzLDIwMDEsMyw5LDYsMiw2Niw3MSw1LDAuMDc1NzU3NTc1NzU3NTc1OCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQ0OAoiRkYtNyIsIkI4Iiw0MjMwLDIwMDEsNSwxMyw4LDEuNiw1Myw1Nyw0LDAuMDc1NDcxNjk4MTEzMjA3NSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE0OQoiRkYtNyIsIkI4Iiw0MjMyLDIwMDEsMTIsMjEsOSwwLjc1LDY4LDkzLDI1LDAuMzY3NjQ3MDU4ODIzNTI5LDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxOTcKIkZGLTciLCJCOCIsNDIzMiwyMDAzLDI0LDYsLTE4LDAuNzUsOTIsMTUxLDU5LDAuNjQxMzA0MzQ3ODI2MDg3LDIsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxOTcKIkZGLTciLCJCOSIsNDI1MiwyMDAzLDcsMSwtNiwwLjg1NzE0Mjg1NzE0Mjg1Nyw3NCw4Myw5LDAuMTIxNjIxNjIxNjIxNjIyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTgzCiJGRi03IiwiQzMiLDQzMDUsMjAwNCwxMiw1LC03LDAuNTgzMzMzMzMzMzMzMzMzLDExNSwxNTAsMzUsMC4zMDQzNDc4MjYwODY5NTcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0NjYKIkZGLTciLCJDNCIsNDMxNSwyMDA1LDcsMSwtNiwwLjg1NzE0Mjg1NzE0Mjg1Nyw2OSw3MCwxLDAuMDE0NDkyNzUzNjIzMTg4NCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE3CiJGRi03IiwiQzQiLDQzMTgsMTk5OSw0LDExLDcsMS43NSw0NSw1NCw5LDAuMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDM0OAoiRkYtNyIsIkM0Iiw0MzE4LDIwMDAsMTEsMjIsMTEsMSw1NCwxMjEsNjcsMS4yNDA3NDA3NDA3NDA3NCwxLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzQ4CiJGRi03IiwiQzQiLDQzMTgsMjAwMiwxNyw0LC0xMywwLjc2NDcwNTg4MjM1Mjk0MSwxNzIsNTAsLTEyMiwwLjcwOTMwMjMyNTU4MTM5NSxOQSxGQUxTRSxGQUxTRSwiYnJhbmNoIixOQSwibWVhc3VyZWQiLDM0OAoiRkYtNyIsIkM2Iiw0MzQ1LDIwMDMsMTAsNCwtNiwwLjYsNzksNzcsLTIsMC4wMjUzMTY0NTU2OTYyMDI1LDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyOAoiRkYtNyIsIkM2Iiw0MzUyLDIwMDEsMSw4LDcsNyw0Niw5Myw0NywxLjAyMTczOTEzMDQzNDc4LDIsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0NTMKIkZGLTciLCJDOCIsNDM5MCwyMDAyLDcsMTYsOSwxLjI4NTcxNDI4NTcxNDI5LDQ5LDYwLDExLDAuMjI0NDg5Nzk1OTE4MzY3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTYyCiJGRi03IiwiQzgiLDQzOTAsMjAwMywxNiw0LC0xMiwwLjc1LDYwLDY3LDcsMC4xMTY2NjY2NjY2NjY2NjcsMixGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE2MgoiRkYtNyIsIkM4Iiw0Mzk0LDIwMDMsMTEsNSwtNiwwLjU0NTQ1NDU0NTQ1NDU0NSw5Myw5MCwtMywwLjAzMjI1ODA2NDUxNjEyOSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQ1NAoiRkYtNyIsIkQ3Iiw0NTEzLDIwMDMsOCwyLC02LDAuNzUsNDYsODgsNDIsMC45MTMwNDM0NzgyNjA4NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDIyMwoiRkYtNyIsIkQ3Iiw0NTI3LDIwMDUsOSwzLC02LDAuNjY2NjY2NjY2NjY2NjY3LDMxLDM1LDQsMC4xMjkwMzIyNTgwNjQ1MTYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw3NDMKIkZGLTciLCJENyIsNDUzMywyMDAxLDYsMTMsNywxLjE2NjY2NjY2NjY2NjY3LDczLDcxLC0yLDAuMDI3Mzk3MjYwMjczOTcyNiwxLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTA2CiJGRi03IiwiRDciLDQ1MzMsMjAwMywxNCw3LC03LDAuNSw5Miw5MSwtMSwwLjAxMDg2OTU2NTIxNzM5MTMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw5MDYKIkZGLTciLCJENyIsNDUzNCwyMDAxLDUsMTEsNiwxLjIsNTAsNjQsMTQsMC4yOCwxLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTEzCiJGRi03IiwiRTQiLDQ2MzEsMjAwNSw0LDEwLDYsMS41LDY1LDYyLC0zLDAuMDQ2MTUzODQ2MTUzODQ2MixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDI4OQoiRkYtNyIsIkU1Iiw0NjYxLDIwMDMsOSwzLC02LDAuNjY2NjY2NjY2NjY2NjY3LDg1LDc4LC03LDAuMDgyMzUyOTQxMTc2NDcwNixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDIwMwoiRkYtNyIsIkU3Iiw0NzE3LDIwMDMsMTEsNCwtNywwLjYzNjM2MzYzNjM2MzYzNiw0OSw1OCw5LDAuMTgzNjczNDY5Mzg3NzU1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNjgKIkZGLTciLCJFOCIsNDczOSwyMDAzLDQsMjMsMTksNC43NSw3Nyw3MywtNCwwLjA1MTk0ODA1MTk0ODA1MixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDU1CiJGRi03IiwiRTgiLDQ3MzksMjAwNCwyMyw0LC0xOSwwLjgyNjA4Njk1NjUyMTczOSw3Myw1OSwtMTQsMC4xOTE3ODA4MjE5MTc4MDgsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1NQoiRkYtNyIsIkU4Iiw0NzQ0LDIwMDMsNywxLC02LDAuODU3MTQyODU3MTQyODU3LDI3LDMzLDYsMC4yMjIyMjIyMjIyMjIyMjIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMDgKIkZGLTciLCJFOCIsNDc0NywyMDAzLDEzLDYsLTcsMC41Mzg0NjE1Mzg0NjE1MzgsODIsODUsMywwLjAzNjU4NTM2NTg1MzY1ODUsMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE4NwoiQ0YtMyIsIkEzIiw0OTA2LDIwMDMsOCwyLC02LDAuNzUsNjcsMTQsLTUzLDAuNzkxMDQ0Nzc2MTE5NDAzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTkKIkNGLTMiLCJBMyIsNDkxMywyMDAyLDEyLDYsLTYsMC41LDg0LDMyLC01MiwwLjYxOTA0NzYxOTA0NzYxOSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEzMgoiQ0YtMyIsIkE0Iiw0OTYwLDIwMDEsMTEsNCwtNywwLjYzNjM2MzYzNjM2MzYzNiwxMDcsMTA3LDAsMCwxLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTYKIkNGLTMiLCJBNSIsNTAwNCwyMDA1LDQsMTAsNiwxLjUsNTAsNTAsMCwwLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjYKIkNGLTMiLCJBNyIsNTA5NCwyMDAwLDUsMTQsOSwxLjgsNDYsNTIsNiwwLjEzMDQzNDc4MjYwODY5NiwxLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzMyCiJDRi0zIiwiQTciLDUxMDUsMjAwNSwxNiw3LC05LDAuNTYyNSw3OCw4Myw1LDAuMDY0MTAyNTY0MTAyNTY0MSwxLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsODY5CiJDRi0zIiwiQjQiLDUyNjMsMjAwMiwzLDExLDgsMi42NjY2NjY2NjY2NjY2Nyw0Niw2NiwyMCwwLjQzNDc4MjYwODY5NTY1MixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDMzOQoiQ0YtMyIsIkI0Iiw1MjYzLDIwMDMsMTEsNSwtNiwwLjU0NTQ1NDU0NTQ1NDU0NSw2Niw4MCwxNCwwLjIxMjEyMTIxMjEyMTIxMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDMzOQoiQ0YtMyIsIkI3Iiw1MzU2LDIwMDUsMTIsNSwtNywwLjU4MzMzMzMzMzMzMzMzMyw1Niw2OCwxMiwwLjIxNDI4NTcxNDI4NTcxNCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDkxCiJDRi0zIiwiQjciLDUzNjQsMjAwMSw3LDEzLDYsMC44NTcxNDI4NTcxNDI4NTcsOTIsMTExLDE5LDAuMjA2NTIxNzM5MTMwNDM1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDYzCiJDRi0zIiwiQjciLDUzNjUsMjAwMiw0LDEyLDgsMiw1MCw2MCwxMCwwLjIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0NjcKIkNGLTMiLCJDMiIsNTQ2OSwyMDA4LDIsOCw2LDMsMjMsMzAsNywwLjMwNDM0NzgyNjA4Njk1NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE1NgoiQ0YtMyIsIkM2Iiw1NTQzLDIwMDMsOCwyLC02LDAuNzUsNDYsMjYsLTIwLDAuNDM0NzgyNjA4Njk1NjUyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDIwCiJDRi0zIiwiQzciLDU1NTQsMjAwMiw0LDEwLDYsMS41LDUzLDQ1LC04LDAuMTUwOTQzMzk2MjI2NDE1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDI4CiJDRi0zIiwiQzgiLDU1NzgsMTk5OSw1LDEyLDcsMS40LDEwNSwxMDQsLTEsMC4wMDk1MjM4MDk1MjM4MDk1MiwxLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTEzCiJDRi0zIiwiQzgiLDU1NzksMjAwMiwxMSw0LC03LDAuNjM2MzYzNjM2MzYzNjM2LDc0LDk0LDIwLDAuMjcwMjcwMjcwMjcwMjcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMTUKIkNGLTMiLCJEOCIsNTgyNywyMDAxLDEwLDQsLTYsMC42LDU1LDY4LDEzLDAuMjM2MzYzNjM2MzYzNjM2LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTA4CiJDRi0zIiwiRDkiLDU4NzEsMjAwNyw0LDEwLDYsMS41LDU3LDU2LC0xLDAuMDE3NTQzODU5NjQ5MTIyOCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDUwMgoiQ0YtMyIsIkU2Iiw2MDM5LDIwMDIsNCwxMSw3LDEuNzUsNDcsNTAsMywwLjA2MzgyOTc4NzIzNDA0MjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzNTgKIkNGLTMiLCJFNiIsNjAzOSwyMDAzLDExLDQsLTcsMC42MzYzNjM2MzYzNjM2MzYsNTAsNjAsMTAsMC4yLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzU4CiJDRi02IiwiQjgiLDYzMTgsMjAwNiw4LDEsLTcsMC44NzUsODIsMjYsLTU2LDAuNjgyOTI2ODI5MjY4MjkzLE5BLEZBTFNFLEZBTFNFLCJicmFuY2giLE5BLCJtZWFzdXJlZCIsMjYwCiJDRi02IiwiRDciLDY0OTYsMjAwNSwxMCwxLC05LDAuOSwxMDksMjgsLTgxLDAuNzQzMTE5MjY2MDU1MDQ2LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzM0CiJDRi02IiwiRDciLDY0OTcsMjAwNSwxMywxLC0xMiwwLjkyMzA3NjkyMzA3NjkyMyw5OCwyMiwtNzYsMC43NzU1MTAyMDQwODE2MzMsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzNjIKIkNGLTYiLCJFOCIsNjU1NiwyMDA1LDgsMSwtNywwLjg3NSwzMiw4LC0yNCwwLjc1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTQwCiJDRi0xIiwiQTEiLDY3ODIsMjAwMywxMSw1LC02LDAuNTQ1NDU0NTQ1NDU0NTQ1LDgzLDg1LDIsMC4wMjQwOTYzODU1NDIxNjg3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTE0CiJDRi0xIiwiQTIiLDY4NTcsMjAwMiw3LDEzLDYsMC44NTcxNDI4NTcxNDI4NTcsNTYsNTgsMiwwLjAzNTcxNDI4NTcxNDI4NTcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMwoiQ0YtMSIsIkEyIiw2ODU3LDIwMDQsOSwxLC04LDAuODg4ODg4ODg4ODg4ODg5LDkxLDcsLTg0LDAuOTIzMDc2OTIzMDc2OTIzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTMKIkNGLTEiLCJBMiIsNjg1OCwyMDAxLDQsMTcsMTMsMy4yNSw0MCw0MywzLDAuMDc1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjMKIkNGLTEiLCJBMiIsNjg1OCwyMDAzLDE2LDEwLC02LDAuMzc1LDQ2LDU2LDEwLDAuMjE3MzkxMzA0MzQ3ODI2LDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyMwoiQ0YtMSIsIkEyIiw2ODczLDIwMDYsMiw4LDYsMywxOCw5NCw3Niw0LjIyMjIyMjIyMjIyMjIyLDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4MDUKIkNGLTEiLCJBMyIsNjkxNywyMDA1LDcsMSwtNiwwLjg1NzE0Mjg1NzE0Mjg1Nyw2OCw3MCwyLDAuMDI5NDExNzY0NzA1ODgyNCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDM4CiJDRi0xIiwiQTMiLDY5MTksMjAwNCwzLDEwLDcsMi4zMzMzMzMzMzMzMzMzMyw0NSw4OSw0NCwwLjk3Nzc3Nzc3Nzc3Nzc3OCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDYxCiJDRi0xIiwiQTMiLDY5MjEsMjAwMywxMSw0LC03LDAuNjM2MzYzNjM2MzYzNjM2LDcwLDc4LDgsMC4xMTQyODU3MTQyODU3MTQsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4NAoiQ0YtMSIsIkEzIiw2OTIxLDIwMDQsNCwxNCwxMCwyLjUsNzgsOTMsMTUsMC4xOTIzMDc2OTIzMDc2OTIsMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDg0CiJDRi0xIiwiQTMiLDY5MjEsMjAwNSwxNCw0LC0xMCwwLjcxNDI4NTcxNDI4NTcxNCw5Myw4MywtMTAsMC4xMDc1MjY4ODE3MjA0MyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDg0CiJDRi0xIiwiQTMiLDY5MjIsMjAwMSw3LDE5LDEyLDEuNzE0Mjg1NzE0Mjg1NzEsNjgsNTksLTksMC4xMzIzNTI5NDExNzY0NzEsMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEwMQoiQ0YtMSIsIkEzIiw2OTIyLDIwMDMsMjAsMTMsLTcsMC4zNSw2Nyw2NCwtMywwLjA0NDc3NjExOTQwMjk4NTEsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMDEKIkNGLTEiLCJBMyIsNjkyNSwyMDA2LDIsMTQsMTIsNiw4NSw5OCwxMywwLjE1Mjk0MTE3NjQ3MDU4OCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDExOQoiQ0YtMSIsIkEzIiw2OTI2LDIwMDEsNSwxMSw2LDEuMiw1MCw1OCw4LDAuMTYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMjIKIkNGLTEiLCJBMyIsNjkyNiwyMDAyLDExLDE4LDcsMC42MzYzNjM2MzYzNjM2MzYsNTgsNzUsMTcsMC4yOTMxMDM0NDgyNzU4NjIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMjIKIkNGLTEiLCJBMyIsNjkyNiwyMDAzLDE4LDEwLC04LDAuNDQ0NDQ0NDQ0NDQ0NDQ0LDc1LDExNSw0MCwwLjUzMzMzMzMzMzMzMzMzMywyLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTIyCiJDRi0xIiwiQTMiLDY5MjcsMjAwOCwxMiw2LC02LDAuNSwxMDIsMTI5LDI3LDAuMjY0NzA1ODgyMzUyOTQxLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTMyCiJDRi0xIiwiQTMiLDY5NDAsMjAwMiwxLDcsNiw2LDgsNjcsNTksNy4zNzUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw4ODQKIkNGLTEiLCJBMyIsNjk0OCwyMDA2LDEsNyw2LDYsMjQsOTMsNjksMi44NzUsMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDk0NAoiQ0YtMSIsIkEzIiw2OTUzLDIwMDMsNSwxMiw3LDEuNCwzMyw1MCwxNywwLjUxNTE1MTUxNTE1MTUxNSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDk2NAoiQ0YtMSIsIkEzIiw2OTUzLDIwMDgsMjIsMTAsLTEyLDAuNTQ1NDU0NTQ1NDU0NTQ1LDEzOCwxMzUsLTMsMC4wMjE3MzkxMzA0MzQ3ODI2LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTY0CiJDRi0xIiwiQTMiLDY5NjUsMjAwOCwxMSw1LC02LDAuNTQ1NDU0NTQ1NDU0NTQ1LDkzLDc3LC0xNiwwLjE3MjA0MzAxMDc1MjY4OCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDExMDcKIkNGLTEiLCJBNCIsNjk4OSwyMDAxLDcsMTMsNiwwLjg1NzE0Mjg1NzE0Mjg1Nyw4MSw3OSwtMiwwLjAyNDY5MTM1ODAyNDY5MTQsMixGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDEwNAoiQ0YtMSIsIkE0Iiw2OTk3LDIwMDksMTAsNCwtNiwwLjYsMTA4LDk2LC0xMiwwLjExMTExMTExMTExMTExMSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDY1NgoiQ0YtMSIsIkE0Iiw3MDA0LDIwMDYsNSwxMyw4LDEuNiw1OCw3NSwxNywwLjI5MzEwMzQ0ODI3NTg2MixOQSxGQUxTRSxGQUxTRSwiYnJhbmNoIixOQSwibWVhc3VyZWQiLDk0MwoiQ0YtMSIsIkE3Iiw3MTI2LDIwMDgsMywxMCw3LDIuMzMzMzMzMzMzMzMzMzMsMjcsMzksMTIsMC40NDQ0NDQ0NDQ0NDQ0NDQsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNTQwCiJDRi0xIiwiQTciLDcxMjYsMjAwOSwxMCwyLC04LDAuOCwzOSwzLC0zNiwwLjkyMzA3NjkyMzA3NjkyMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE1NDAKIkNGLTEiLCJBOCIsNzEzOSwyMDA4LDksMywtNiwwLjY2NjY2NjY2NjY2NjY2Nyw1NCw1NSwxLDAuMDE4NTE4NTE4NTE4NTE4NSxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE0NgoiQ0YtMSIsIkE4Iiw3MTM5LDIwMDksMywxMSw4LDIuNjY2NjY2NjY2NjY2NjcsNTUsNzIsMTcsMC4zMDkwOTA5MDkwOTA5MDksMSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE0NgoiQ0YtMSIsIkIyIiw3MjIzLDIwMDMsMTAsMiwtOCwwLjgsNDAsMzEsLTksMC4yMjUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyCiJDRi0xIiwiQjIiLDcyMjUsMjAwMCw0LDEwLDYsMS41LDUwLDYwLDEwLDAuMixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDMzCiJDRi0xIiwiQjIiLDcyMjUsMjAwMSwxMCwyMCwxMCwxLDYwLDk2LDM2LDAuNiw3LEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzMKIkNGLTEiLCJCMiIsNzIyNSwyMDAzLDIwLDcsLTEzLDAuNjUsOTEsODAsLTExLDAuMTIwODc5MTIwODc5MTIxLDMsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzMwoiQ0YtMSIsIkIyIiw3MjI3LDIwMDEsMywxNiwxMyw0LjMzMzMzMzMzMzMzMzMzLDU0LDg2LDMyLDAuNTkyNTkyNTkyNTkyNTkzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzIKIkNGLTEiLCJCMiIsNzIyNywyMDAyLDE2LDYsLTEwLDAuNjI1LDg2LDc3LC05LDAuMTA0NjUxMTYyNzkwNjk4LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzIKIkNGLTEiLCJCMiIsNzIyOSwyMDAxLDQsMTEsNywxLjc1LDY1LDYwLC01LDAuMDc2OTIzMDc2OTIzMDc2OSwxLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTcxCiJDRi0xIiwiQjIiLDcyMjksMjAwNCwxMSw1LC02LDAuNTQ1NDU0NTQ1NDU0NTQ1LDE0MywxMTUsLTI4LDAuMTk1ODA0MTk1ODA0MTk2LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTcxCiJDRi0xIiwiQjUiLDczNzksMjAwNCwxLDksOCw4LDYsNjgsNjIsMTAuMzMzMzMzMzMzMzMzMyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDgyOQoiQ0YtMSIsIkI3Iiw3NDYyLDIwMDksNCwxMCw2LDEuNSwxMDAsOTIsLTgsMC4wOCxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE1MQoiQ0YtMSIsIkI5Iiw3NTA3LDIwMDksOSwzLC02LDAuNjY2NjY2NjY2NjY2NjY3LDU0LDkwLDM2LDAuNjY2NjY2NjY2NjY2NjY3LDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyMDYKIkNGLTEiLCJCOSIsNzUwOCwyMDA2LDEyLDYsLTYsMC41LDg2LDkwLDQsMC4wNDY1MTE2Mjc5MDY5NzY3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjQ4CiJDRi0xIiwiQzYiLDc2NTYsMjAwMSwxMSwzLC04LDAuNzI3MjcyNzI3MjcyNzI3LDEyOCw3NCwtNTQsMC40MjE4NzUsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwyNjkKIkNGLTEiLCJDNyIsNzY5MiwyMDA4LDEwLDIsLTgsMC44LDM2LDMwLC02LDAuMTY2NjY2NjY2NjY2NjY3LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzM3CiJDRi0xIiwiQzciLDc3MDYsMTk5OSwxOCwxMiwtNiwwLjMzMzMzMzMzMzMzMzMzMyw5NSw5MiwtMywwLjAzMTU3ODk0NzM2ODQyMTEsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0OTkKIkNGLTEiLCJDNyIsNzcxMCwyMDAyLDQsMTAsNiwxLjUsNzMsNzUsMiwwLjAyNzM5NzI2MDI3Mzk3MjYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1OTQKIkNGLTEiLCJEMSIsNzczNSwyMDAxLDExLDUsLTYsMC41NDU0NTQ1NDU0NTQ1NDUsODIsNDUsLTM3LDAuNDUxMjE5NTEyMTk1MTIyLE5BLEZBTFNFLEZBTFNFLCJicmFuY2giLE5BLCJtZWFzdXJlZCIsNDA5CiJDRi0xIiwiRDIiLDc3NzgsMjAwMSwxLDksOCw4LDkyLDkzLDEsMC4wMTA4Njk1NjUyMTczOTEzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzc0CiJDRi0xIiwiRDIiLDc3NzgsMjAwMiw5LDIwLDExLDEuMjIyMjIyMjIyMjIyMjIsOTMsODgsLTUsMC4wNTM3NjM0NDA4NjAyMTUxLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzc0CiJDRi0xIiwiRDIiLDc3NzgsMjAwMywyMCwxMiwtOCwwLjQsODgsODgsMCwwLDEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzNzQKIkNGLTEiLCJEMyIsNzgzNiwyMDAzLDEzLDcsLTYsMC40NjE1Mzg0NjE1Mzg0NjIsNzMsODEsOCwwLjEwOTU4OTA0MTA5NTg5LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDA4CiJDRi0xIiwiRDMiLDc4NTksMjAwMiw2LDE3LDExLDEuODMzMzMzMzMzMzMzMzMsNzUsMTAwLDI1LDAuMzMzMzMzMzMzMzMzMzMzLDQsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMDAzCiJDRi0xIiwiRDMiLDc4NTksMjAwNSwyMSwxMywtOCwwLjM4MDk1MjM4MDk1MjM4MSwxMzcsMTMyLC01LDAuMDM2NDk2MzUwMzY0OTYzNSw2LEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTAwMwoiQ0YtMSIsIkQzIiw3ODU5LDIwMDcsMTUsNywtOCwwLjUzMzMzMzMzMzMzMzMzMywxNDIsMTQwLC0yLDAuMDE0MDg0NTA3MDQyMjUzNSxOQSxGQUxTRSxGQUxTRSwiYnJhbmNoIixOQSwibWVhc3VyZWQiLDEwMDMKIkNGLTEiLCJFMSIsODAyMCwyMDAxLDMsMTMsMTAsMy4zMzMzMzMzMzMzMzMzMyw1OSw1NywtMiwwLjAzMzg5ODMwNTA4NDc0NTgsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzMTcKIkNGLTEiLCJFMSIsODAyMCwyMDAzLDE1LDQsLTExLDAuNzMzMzMzMzMzMzMzMzMzLDU3LDY1LDgsMC4xNDAzNTA4NzcxOTI5ODIsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzMTcKIkNGLTEiLCJFMSIsODAzNCwyMDAyLDUsMTEsNiwxLjIsNzAsNTcsLTEzLDAuMTg1NzE0Mjg1NzE0Mjg2LE5BLEZBTFNFLEZBTFNFLCJicmFuY2giLE5BLCJtZWFzdXJlZCIsNTk1CiJDRi0xIiwiRTEiLDgwMzQsMjAwMywxMSw0LC03LDAuNjM2MzYzNjM2MzYzNjM2LDU3LDkwLDMzLDAuNTc4OTQ3MzY4NDIxMDUzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTk1CiJDRi0xIiwiRTIiLDgxMDYsMjAwMywxNSw0LC0xMSwwLjczMzMzMzMzMzMzMzMzMywxMTUsMTM1LDIwLDAuMTczOTEzMDQzNDc4MjYxLDIsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMDg4CiJDRi0xIiwiRTQiLDgxOTMsMjAwNCwyLDEwLDgsNCw1Miw4NywzNSwwLjY3MzA3NjkyMzA3NjkyMywxLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzA4CiJDRi0xIiwiRTQiLDgxOTQsMjAwNCwxMCwzLC03LDAuNyw4MCw2NywtMTMsMC4xNjI1LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzEyCiJDRi0xIiwiRTQiLDgyMDIsMTk5OSwzLDksNiwyLDcyLDc5LDcsMC4wOTcyMjIyMjIyMjIyMjIyLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTE4CiJDRi0xIiwiRTQiLDgyMDUsMjAwNCw1LDExLDYsMS4yLDE0Miw5NiwtNDYsMC4zMjM5NDM2NjE5NzE4MzEsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw1MzYKIkNGLTEiLCJFNCIsODIwNSwyMDA1LDExLDIsLTksMC44MTgxODE4MTgxODE4MTgsOTYsNDYsLTUwLDAuNTIwODMzMzMzMzMzMzMzLE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTM2CiJDRi0xIiwiRTQiLDgyMDYsMjAwNCw5LDIsLTcsMC43Nzc3Nzc3Nzc3Nzc3NzgsMTAwLDY0LC0zNiwwLjM2LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNTQxCiJDRi0xIiwiRTciLDgyODUsMjAwMSw4LDIsLTYsMC43NSw4Niw1MSwtMzUsMC40MDY5NzY3NDQxODYwNDcsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw0NzkKIkNGLTEiLCJFOCIsODMyOCwyMDAxLDgsMSwtNywwLjg3NSw3MCw0MywtMjcsMC4zODU3MTQyODU3MTQyODYsTkEsRkFMU0UsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw3NTIKIkNGLTUiLCJCOSIsODQ2MSwxOTk5LDE0LDcsLTcsMC41LDc3LDY5LC04LDAuMTAzODk2MTAzODk2MTA0LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNzcKIkNGLTUiLCJDMTAiLDg0NzIsMjAwMiw3LDEsLTYsMC44NTcxNDI4NTcxNDI4NTcsMTE3LDUzLC02NCwwLjU0NzAwODU0NzAwODU0NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDQ1CiJDRi01IiwiQzEwIiw4NDczLDE5OTksNSwxMiw3LDEuNCw1Niw3MiwxNiwwLjI4NTcxNDI4NTcxNDI4NixOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDUzCiJDRi01IiwiRDEiLDg1MjksMTk5OSw0LDEzLDksMi4yNSw4NSwxMDcsMjIsMC4yNTg4MjM1Mjk0MTE3NjUsNSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDE0OQoiQ0YtNSIsIkQxIiw4NTI5LDIwMDIsMTMsNywtNiwwLjQ2MTUzODQ2MTUzODQ2MiwxNDMsMTYwLDE3LDAuMTE4ODgxMTE4ODgxMTE5LE5BLEZBTFNFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMTQ5CiJDRi01IiwiRTIiLDg2MTgsMTk5OSwzLDksNiwyLDc1LDU4LC0xNywwLjIyNjY2NjY2NjY2NjY2NyxOQSxGQUxTRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDMwNQo=" download="extract_0003.csv">
  <button aria-label="There are 201 'fail' rows available as a CSV file." data-balloon-pos="left" style="background-color:#67C2DC;color:#FFFFFF;border:none;padding:5px;font-weight:bold;cursor:pointer;border-radius:4px;">CSV</button>
</a>
</div></td></tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="14"><span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin-left:10px;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;padding:2px 10px 2px 10px;">2023-05-26 09:59:35 EDT</span>
<span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;margin:5px 1px 5px 0;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;">&lt; 1 s</span>
<span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 1px 5px -1px;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;">2023-05-26 09:59:36 EDT</span></td>
    </tr>
  </tfoot>
  
</table>
</div>
```

# Seedlings: _Initial size_
Tests for seedlings whose size at initial marking was unusually large. Conducted for both height and shoot number.  
**Test criteria**: 'warn' if $\geq$ 1 rows fail conditions, 'stop' if $\geq$ 2% of rows fail conditions.  



```{=html}
<div id="pb_agent" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>@import url("https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");
@import url("https://unpkg.com/balloon-css/balloon.min.css");
#pb_agent table {
  font-family: 'IBM Plex Sans', system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#pb_agent thead, #pb_agent tbody, #pb_agent tfoot, #pb_agent tr, #pb_agent td, #pb_agent th {
  border-style: none;
}

#pb_agent p {
  margin: 0;
  padding: 0;
}

#pb_agent .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 90%;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#pb_agent .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#pb_agent .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#pb_agent .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#pb_agent .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#pb_agent .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#pb_agent .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#pb_agent .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#pb_agent .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#pb_agent .gt_spanner_row {
  border-bottom-style: hidden;
}

#pb_agent .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#pb_agent .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#pb_agent .gt_from_md > :first-child {
  margin-top: 0;
}

#pb_agent .gt_from_md > :last-child {
  margin-bottom: 0;
}

#pb_agent .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#pb_agent .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#pb_agent .gt_row_group_first td {
  border-top-width: 2px;
}

#pb_agent .gt_row_group_first th {
  border-top-width: 2px;
}

#pb_agent .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#pb_agent .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#pb_agent .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#pb_agent .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#pb_agent .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#pb_agent .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#pb_agent .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#pb_agent .gt_left {
  text-align: left;
}

#pb_agent .gt_center {
  text-align: center;
}

#pb_agent .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#pb_agent .gt_font_normal {
  font-weight: normal;
}

#pb_agent .gt_font_bold {
  font-weight: bold;
}

#pb_agent .gt_font_italic {
  font-style: italic;
}

#pb_agent .gt_super {
  font-size: 65%;
}

#pb_agent .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#pb_agent .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#pb_agent .gt_indent_1 {
  text-indent: 5px;
}

#pb_agent .gt_indent_2 {
  text-indent: 10px;
}

#pb_agent .gt_indent_3 {
  text-indent: 15px;
}

#pb_agent .gt_indent_4 {
  text-indent: 20px;
}

#pb_agent .gt_indent_5 {
  text-indent: 25px;
}

#pb_agent {
  -webkit-font-smoothing: antialiased;
}

#pb_agent .gt_row {
  overflow: visible;
}

#pb_agent .gt_sourcenote {
  height: 35px;
  padding: 0;
}

#pb_agent code {
  font-family: 'IBM Plex Mono', monospace, courier;
  background-color: transparent;
  padding: 0;
}
</style>
<table class="gt_table" style="table-layout: fixed;; width: 0px" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <colgroup>
    <col style="width:6px;"/>
    <col style="width:35px;"/>
    <col style="width:190px;"/>
    <col style="width:120px;"/>
    <col style="width:120px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:50px;"/>
    <col style="width:30px;"/>
    <col style="width:30px;"/>
    <col style="width:30px;"/>
    <col style="width:65px;"/>
  </colgroup>
  <thead>
    <tr class="gt_heading">
      <td colspan="14" class="gt_heading gt_title gt_font_normal" style="color: #444444; font-size: 28px; text-align: left; font-weight: 500;">Pointblank Validation</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="14" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style="font-size: 12px; text-align: left;"><span style="text-decoration-style:solid;text-decoration-color:#ADD8E6;text-decoration-line:underline;text-underline-position:under;color:#333333;font-variant-numeric:tabular-nums;padding-left:4px;margin-right:5px;padding-right:2px;">Check seedlings</span></p>
<div style="height:25px;"><span style="background-color: #F1D35A;color: #222222;padding: 0.5em 0.5em;position: inherit;text-transform: uppercase;margin: 5px 1px 5px 4px;font-weight: bold;border: solid 1px #F1D35A;padding: 2px 10px 2px 10px;font-size: smaller;">tibble</span><span style="background-color:#E5AB00;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 5px;font-weight:bold;border:solid 1px #E5AB00;padding:2px 15px 2px 15px;font-size:smaller;">WARN</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #E5AB00;padding:2px 15px 2px 15px;font-size:smaller;">1</span>
<span style="background-color:#D0182F;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 1px;font-weight:bold;border:solid 1px #D0182F;padding:2px 15px 2px 15px;font-size:smaller;">STOP</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #D0182F;padding:2px 15px 2px 15px;font-size:smaller;">0.02</span>
<span style="background-color:#499FFE;color:white;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 0px 5px 1px;font-weight:bold;border:solid 1px #499FFE;padding:2px 15px 2px 15px;font-size:smaller;">NOTIFY</span>
<span style="background-color:none;color:#333333;padding:0.5em 0.5em;position:inherit;margin:5px 0px 5px -4px;font-weight:bold;border:solid 1px #499FFE;padding:2px 15px 2px 15px;font-size:smaller;">&mdash;</span></div>
</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="STEP">STEP</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="COLUMNS">COLUMNS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="VALUES">VALUES</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="TBL">TBL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="EVAL">EVAL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="UNITS">UNITS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="PASS">PASS</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="FAIL">FAIL</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="W">W</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="S">S</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="N">N</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" style="color: #666666; font-weight: bold;" scope="col" id="EXT">EXT</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #FFBF00; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">1</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect that values in `shts` should be &lt; `3`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>col_vals_lt</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_lt" transform="translate(0.000000, 0.310345)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <path d="M52.712234,11 L14.712234,11 C13.05989,11 11.712234,12.347656 11.712234,14 L11.712234,52 C11.712234,53.652344 13.05989,55 14.712234,55 L52.712234,55 C54.364578,55 55.712234,53.652344 55.712234,52 L55.712234,14 C55.712234,12.347656 54.364578,11 52.712234,11 Z M40.419265,46.292969 L39.005203,47.707031 L24.298172,33 L39.005203,18.292969 L40.419265,19.707031 L27.126297,33 L40.419265,46.292969 Z" id="less_than" fill="#000000" fill-rule="nonzero"></path>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">shoots < 3</p>
    <p style="margin:0;">
      <code style="font-size:11px;">col_vals_lt()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="shts" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>shts</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="3" data-balloon-pos="left"><p style="margin-top: 0px; margin-bottom: 0px; font-size: 11px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><code>3</code></p></div>
</div></td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>3K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>3K</code><br><code>0.99</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>12</code><br><code>0.01</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #E5AB00;">●</span></p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><a href="data:text/csv;base64,InBsb3RfaWQiLCJzdWJwbG90IiwicGxhbnRfaWQiLCJ5ZWFyIiwic2h0cyIsImh0IiwiaW5mbCIsInJlY29yZGVkX3NkbGciLCJhZHVsdF9ub190YWciLCJ0cmVlZmFsbF9zdGF0dXMiLCJjb25kaXRpb24iLCJjZW5zdXNfc3RhdHVzIiwidGFnX251bWJlciIKIkNGLTEiLCJBMSIsNjgwNCwyMDAwLDMsMTAsTkEsVFJVRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDgwMgoiQ0YtMyIsIkE2Iiw1MDczLDIwMDIsMywxNCxOQSxUUlVFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsOTAwCiJDRi00IiwiQTYiLDY1OTAsMjAwNSwzLDE1LE5BLFRSVUUsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxMzAKIkNGLTMiLCJBOSIsNTE1NiwyMDAyLDMsMTksTkEsVFJVRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDg5NgoiRkYtNiIsIkI0IiwyNzg5LDE5OTksMywyMSxOQSxUUlVFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjk2CiJGRi02IiwiQjUiLDI4MzgsMjAwNCwzLDksTkEsVFJVRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDcwNwoiRkYtNCIsIkI1IiwzNTAzLDIwMDYsMywxMixOQSxUUlVFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsNDAzCiJDRi0zIiwiQjYiLDUzNDcsMjAwNiwzLDE1LE5BLFRSVUUsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwxNjQzCiJGRi03IiwiQjgiLDQyNDIsMjAwMiwzLDEzLE5BLFRSVUUsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiw5NzAKIkZGLTEiLCJDMTAiLDE3NSwyMDAzLDMsMyxOQSxUUlVFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjU4CiJGRi01IiwiRDMiLDg4MywyMDA1LDMsMTUsTkEsVFJVRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDIyOQoiQ0YtMiIsIkk2IiwxODg2LDIwMDgsMywxNSxOQSxUUlVFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMjA1Mgo=" download="extract_0001.csv">
  <button aria-label="There are 12 'fail' rows available as a CSV file." data-balloon-pos="left" style="background-color:#67C2DC;color:#FFFFFF;border:none;padding:5px;font-weight:bold;cursor:pointer;border-radius:4px;">CSV</button>
</a>
</div></td></tr>
    <tr><td headers="status_color" class="gt_row gt_left" style="background-color: #FFBF00; height: 40px"></td>
<td headers="i" class="gt_row gt_right" style="color: #666666; font-size: 13px; font-weight: bold; height: 40px">2</td>
<td headers="type" class="gt_row gt_left" style="height: 40px"><div class='gt_from_md'><div aria-label="Expect that values in `ht` should be &lt; `30`. " data-balloon-pos="right" style="width:fit-content;">
  <div style="float:left;width:30px;"><div style="margin:0;padding:0;display:inline-block;height:30px;vertical-align:middle;"><?xml version="1.0" encoding="UTF-8"?><svg width="30px" height="30px" viewBox="0 0 67 67" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">    <title>col_vals_lt</title>    <g id="All-Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="col_vals_lt" transform="translate(0.000000, 0.310345)">            <path d="M56.712234,1 C59.1975153,1 61.4475153,2.00735931 63.076195,3.63603897 C64.7048747,5.26471863 65.712234,7.51471863 65.712234,10 L65.712234,10 L65.712234,65 L10.712234,65 C8.22695259,65 5.97695259,63.9926407 4.34827294,62.363961 C2.71959328,60.7352814 1.71223397,58.4852814 1.71223397,56 L1.71223397,56 L1.71223397,10 C1.71223397,7.51471863 2.71959328,5.26471863 4.34827294,3.63603897 C5.97695259,2.00735931 8.22695259,1 10.712234,1 L10.712234,1 Z" id="rectangle" stroke="#000000" stroke-width="2" fill="#FFFFFF"></path>            <path d="M52.712234,11 L14.712234,11 C13.05989,11 11.712234,12.347656 11.712234,14 L11.712234,52 C11.712234,53.652344 13.05989,55 14.712234,55 L52.712234,55 C54.364578,55 55.712234,53.652344 55.712234,52 L55.712234,14 C55.712234,12.347656 54.364578,11 52.712234,11 Z M40.419265,46.292969 L39.005203,47.707031 L24.298172,33 L39.005203,18.292969 L40.419265,19.707031 L27.126297,33 L40.419265,46.292969 Z" id="less_than" fill="#000000" fill-rule="nonzero"></path>        </g>    </g></svg></div></div>
  <div style="line-height:0.7em;margin-left:32px;padding-left:3px;">
    <p style="margin:0;padding-top:4px;font-size:9px;">height < 30cm</p>
    <p style="margin:0;">
      <code style="font-size:11px;">col_vals_lt()</code>
    </p>
  </div>
</div>
</div></td>
<td headers="columns" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="ht" data-balloon-pos="left">
  <p style="margin-top:0;margin-bottom:0;font-size:11px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;line-height:2em;">
    <code><span style="color:purple;">&marker;</span>ht</code>
  </p>
</div>
</div></td>
<td headers="values" class="gt_row gt_left" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; height: 40px"><div class='gt_from_md'><div aria-label="30" data-balloon-pos="left"><p style="margin-top: 0px; margin-bottom: 0px; font-size: 11px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><code>30</code></p></div>
</div></td>
<td headers="precon" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:0;color:#333333;vertical-align:middle;font-size:10px;border:none;border-radius:4px;" aria-label="No modifications of the table." data-balloon-pos="left"><svg width="25px" height="25px" viewBox="0 0 25 25" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="vertical-align: middle;">    <g id="unchanged" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">        <g id="unchanged" transform="translate(0.500000, 0.570147)">            <rect id="Rectangle" x="0.125132506" y="0" width="23.749735" height="23.7894737"></rect>            <path d="M5.80375046,8.18194736 C3.77191832,8.18194736 2.11875046,9.83495328 2.11875046,11.8669474 C2.11875046,13.8989414 3.77191832,15.5519474 5.80375046,15.5519474 C7.8355826,15.5519474 9.48875046,13.8989414 9.48875046,11.8669474 C9.48875046,9.83495328 7.83552863,8.18194736 5.80375046,8.18194736 Z M5.80375046,14.814915 C4.17821997,14.814915 2.85578285,13.4924778 2.85578285,11.8669474 C2.85578285,10.2414169 4.17821997,8.91897975 5.80375046,8.91897975 C7.42928095,8.91897975 8.75171807,10.2414169 8.75171807,11.8669474 C8.75171807,13.4924778 7.42928095,14.814915 5.80375046,14.814915 Z" id="Shape" fill="#000000" fill-rule="nonzero"></path>            <path d="M13.9638189,8.699335 C13.9364621,8.70430925 13.9091059,8.71176968 13.8842359,8.71923074 C13.7822704,8.73663967 13.6877654,8.77643115 13.6056956,8.83860518 L10.2433156,11.3852598 C10.0766886,11.5046343 9.97720993,11.6986181 9.97720993,11.9025491 C9.97720993,12.1064807 10.0766886,12.3004639 10.2433156,12.4198383 L13.6056956,14.966493 C13.891697,15.1803725 14.2970729,15.1231721 14.5109517,14.8371707 C14.7248313,14.5511692 14.6676309,14.145794 14.3816294,13.9319145 L12.5313257,12.5392127 L21.8812495,12.5392127 L21.8812495,11.2658854 L12.5313257,11.2658854 L14.3816294,9.87318364 C14.6377872,9.71650453 14.7497006,9.40066014 14.6477351,9.11714553 C14.5482564,8.83363156 14.262255,8.65954352 13.9638189,8.699335 Z" id="arrow" fill="#000000" transform="translate(15.929230, 11.894737) rotate(-180.000000) translate(-15.929230, -11.894737) "></path>        </g>    </g></svg></span></p>
</div></td>
<td headers="eval_sym" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="background:transparent;padding:5px;color:#4CA64C;vertical-align:middle;font-size:15px;border:none;" aria-label="No evaluation issues." data-balloon-pos="left">✓</span></p>
</div></td>
<td headers="units" class="gt_row gt_right" style="font-size: 11px; height: 40px"><code>3K</code></td>
<td headers="n_pass" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>3K</code><br><code>0.99</code></td>
<td headers="n_fail" class="gt_row gt_right" style="border-left-width: 1px; border-left-style: dashed; border-left-color: #E5E5E5; font-size: 11px; height: 40px"><code>3</code><br><code>0.01</code></td>
<td headers="W" class="gt_row gt_center" style="border-left-width: 1px; border-left-style: solid; border-left-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #E5AB00;">●</span></p>
</div></td>
<td headers="S" class="gt_row gt_center" style="background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p><span style="color: #CF142B;">○</span></p>
</div></td>
<td headers="N" class="gt_row gt_center" style="border-right-width: 1px; border-right-style: solid; border-right-color: #D3D3D3; background-color: #FCFCFC; height: 40px"><div class='gt_from_md'><p>—</p>
</div></td>
<td headers="extract" class="gt_row gt_center" style="height: 40px"><div class='gt_from_md'><a href="data:text/csv;base64,InBsb3RfaWQiLCJzdWJwbG90IiwicGxhbnRfaWQiLCJ5ZWFyIiwic2h0cyIsImh0IiwiaW5mbCIsInJlY29yZGVkX3NkbGciLCJhZHVsdF9ub190YWciLCJ0cmVlZmFsbF9zdGF0dXMiLCJjb25kaXRpb24iLCJjZW5zdXNfc3RhdHVzIiwidGFnX251bWJlciIKIkZGLTciLCJBOCIsMzk3MiwyMDAzLDEsMzIsTkEsVFJVRSxGQUxTRSxOQSxOQSwibWVhc3VyZWQiLDg5MgoiRkYtMyIsIkI2IiwyMjUzLDIwMDcsMSwzNyxOQSxUUlVFLEZBTFNFLE5BLE5BLCJtZWFzdXJlZCIsMzQ1CiJGRi0zIiwiRDUiLDI0MTYsMjAwNywxLDMwLE5BLFRSVUUsRkFMU0UsTkEsTkEsIm1lYXN1cmVkIiwzNjAK" download="extract_0002.csv">
  <button aria-label="There are 3 'fail' rows available as a CSV file." data-balloon-pos="left" style="background-color:#67C2DC;color:#FFFFFF;border:none;padding:5px;font-weight:bold;cursor:pointer;border-radius:4px;">CSV</button>
</a>
</div></td></tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="14"><span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin-left:10px;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;padding:2px 10px 2px 10px;">2023-05-26 09:59:37 EDT</span>
<span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;margin:5px 1px 5px 0;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;">&lt; 1 s</span>
<span style="background-color:#FFF;color:#444;padding:0.5em 0.5em;position:inherit;text-transform:uppercase;margin:5px 1px 5px -1px;border:solid 1px #999999;font-variant-numeric:tabular-nums;border-radius:0;padding:2px 10px 2px 10px;">2023-05-26 09:59:37 EDT</span></td>
    </tr>
  </tfoot>
  
</table>
</div>
```

------

# Missing values: _Height_

<img src="data_validation_files/figure-html/unnamed-chunk-1-1.png" width="672" />

<!-- # Check for missing values: Shoots -->




