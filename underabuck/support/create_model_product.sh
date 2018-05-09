#!/bin/bash

rails g model product \
  product_id:string \
  product_name:string \
  description:text \
  product_marketing:text \
  product_brand:string \
  export:string \
  product_category:string \
  product_sub_category:string \
  part_id:string \
  color:string \
  primary_material:text \
  dimension:text \
  is_rush_service:integer \
  shipping:text \
  is_closeout:boolean \
  is_on_demand:boolean \
  is_hasmat:boolean \
  last_change_date:datetime \
  creation_date:datetime \
  line_name:string
