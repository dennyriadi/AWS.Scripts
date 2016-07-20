SELECT
  top 1 starttime,
  le.filename,
  le.line_number,
  le.colname,
  le.type AS column_datatype,
  le.raw_line AS error_record_line_data,
  le.raw_field_value AS attempt_to_insert_value ,
  err_reason
FROM stl_load_errors le
 INNER JOIN
  (SELECT TOP 1 id
   FROM STV_TBL_PERM tp
   WHERE name='ga_content_filtered') tp
 ON le.tbl=tp.id
ORDER BY le.starttime DESC```

