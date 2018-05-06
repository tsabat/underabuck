module PromoStandards
  class ProductExample
    def product_hl_104
      {
        get_product_response: {
          product: {
            product_id: 'HL-104',
            product_name: '32-oz. Pail with Handle',
            description: 'HumphreyLine 32-ounce pail is made with premium materials. Optional (non-decorated) White Lid available at US $0.25/CDN $0.50 (G) each.  Optional Shovels also available at US $0.25/CDN $0.50 (G) each. Pail includes handle. Must specify handle color. Handles and Optional Shovels are available in: White, Red, Blue or Black. All optional accessories packed separately. Made inUSA. FOB ZIP: KY, 41042',
            product_marketing_point_array: {
              product_marketing_point: {
                point_type: 'downloads-Art Template',
                point_copy: 'Click on the PDF link below to download: <br /><a href=\'/Lists/ReferenceMaterialLibrary/Bullet/Art_Templates/HL-104 32 oz Sand Pail.ai\' >HL-104 32 oz Sand Pail</a>',
              },
            },
            product_brand: 'Bullet',
            export: nil,
            product_category_array: {
              product_category: {
                category: 'fitnessrecreation',
                sub_category: 'summeroutdooritems',
              },
            },
            product_part_array: {
              product_part: {
                part_id: 'HL-104GR',
                color_array: {
                  color: {
                    color_name: 'Green',
                    hex: '007749',
                  },
                },
                primary_material: 'High-Density Polyethylene (HDPE)',
                dimension: {
                  dimension_uom: 'IN',
                  depth: {
                    :@xmlns => 'http://www.promostandards.org/WSDL/ProductDataService/1.0.0/SharedObjects/',
                  },
                  height: '5.25',
                  width: {
                    :@xmlns => 'http://www.promostandards.org/WSDL/ProductDataService/1.0.0/SharedObjects/',
                  },
                  weight_uom: 'LB',
                  weight: {
                    :@xmlns => 'http://www.promostandards.org/WSDL/ProductDataService/1.0.0/SharedObjects/',
                  },
                },
                is_rush_service: false,
                shipping_package_array: {
                  shipping_package: {
                    package_type: 'Master Carton',
                    quantity: '250',
                    dimension_uom: 'IN',
                    depth: '24.00',
                    height: '18.00',
                    width: '19.00',
                    weight_uom: 'LB',
                    weight: '49.00',
                  },
                },
                end_date: {
                  :@xmlns => 'http://www.promostandards.org/WSDL/ProductDataService/1.0.0/SharedObjects/',
                },
                effective_date: {
                  :@xmlns => 'http://www.promostandards.org/WSDL/ProductDataService/1.0.0/SharedObjects/',
                },
                is_closeout: false,
                is_caution: {
                  :@xmlns => 'http://www.promostandards.org/WSDL/ProductDataService/1.0.0/SharedObjects/',
                },
                is_on_demand: nil,
                is_hazmat: nil,
              },
            },
            last_change_date: DateTime.now,
            creation_date: DateTime.now,
            end_date: {
              :@xmlns => 'http://www.promostandards.org/WSDL/ProductDataService/1.0.0/SharedObjects/',
            },
            effective_date: {
              :@xmlns => 'http://www.promostandards.org/WSDL/ProductDataService/1.0.0/SharedObjects/',
            },
            is_caution: {
              :@xmlns => 'http://www.promostandards.org/WSDL/ProductDataService/1.0.0/SharedObjects/',
            },
            is_closeout: {
              :@xmlns => 'http://www.promostandards.org/WSDL/ProductDataService/1.0.0/SharedObjects/',
            },
            line_name: 'Bullet',
          },
          :@xmlns => 'http://www.promostandards.org/WSDL/ProductDataService/1.0.0/',
        },
        :'@xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
        :'@xmlns:xsd' => 'http://www.w3.org/2001/XMLSchema',
      }
    end
  end
end
