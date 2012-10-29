module Stupidedi
  module Guides
    module FortyTen
      module X12

        b = GuideBuilder
        d = Schema
        r = SegmentReqs
        e = ElementReqs
        s = Versions::FunctionalGroups::FortyTen::SegmentDefs
        t = Versions::FunctionalGroups::FortyTen::TransactionSetDefs

        #
        # Motor Carrier Load Tender
        #
        SM204 = b.build(t::SM204,
          d::TableDef.header("Heading",
            b::Segment(10, s::ST, "Transaction Set Header",
              r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Transaction Set Identifier Code", b::Values("204")),
              b::Element(e::Required,    "Transaction Set Control Number")),

            b::Segment(20, s::B2, "Beginning Segment for Shipment Information Transaction",
              r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Standard Carrier Alpha Code"),
              b::Element(e::Required,    "Shipment Identification Number"),
              b::Element(e::Required,    "Shipment Method of Payment")),

            b::Segment(30, s::B2A, "Set Purpose",
              r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Transaction Set Purpose Code"),
              b::Element(e::Situational, "Application Type")),

            b::Segment(80, s::L11, "Business Instructions and Reference Number",
              r::Situational, d::RepeatCount.bounded(200),
              b::Element(e::Situational, "Reference Identification"),
              b::Element(e::Situational, "Reference Identification Qualifier")),

            b::Segment(90, s::G62, "Date/Time",
              r::Situational, d::RepeatCount.bounded(1),
              b::Element(e::Situational, "Date Qualifier"),
              b::Element(e::Situational, "Date"),
              b::Element(e::Situational, "Time Qualifier"),
              b::Element(e::Situational, "Time"),
              b::Element(e::NotUsed, "Time Code")),

            b::Segment(100, s::MS3, "Interline Information",
              r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Standard Carrier Alpha Code"),
              b::Element(e::Situational, "Routing Sequence Code"),
              b::Element(e::Situational, "City Name"),
              b::Element(e::Required,    "Transportation Method/Type Code"),
              b::Element(e::Situational, "State or Province Code")),

            b::Segment(120, s::PLD, "Pallet Information",
              r::Situational, d::RepeatCount.bounded(1),
                b::Element(e::Required, "Quantity of Pallets Shipped")),

            b::Segment(130, s::NTE, "Note/Special Instruction",
              r::Situational, d::RepeatCount.bounded(10),
                b::Element(e::Situational, "Note Reference Code"),
                b::Element(e::Situational, "Description")),
              
            d::LoopDef.build("LOOP 0100",
              d::RepeatCount.bounded(5),
              b::Segment(140, s::N1, "Name",
                r::Situational, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Entity Identifier Code"),
                b::Element(e::Required,    "Name"),
                b::Element(e::Situational, "Identification Code Qualifier"),
                b::Element(e::Situational, "Identification Code")),

              b::Segment(160, s::N3, "Address Information",
                r::Situational, d::RepeatCount.bounded(2),
                b::Element(e::Situational, "Address Information"),
                b::Element(e::Situational, "Address Information")),

              b::Segment(170, s::N4, "Geographic Information",
                r::Situational, d::RepeatCount.bounded(1),
                b::Element(e::Situational, "City Name"),
                b::Element(e::Situational, "State or Province Code"),
                b::Element(e::Situational, "Postal Code"),
                b::Element(e::Situational, "Country Code")),

              b::Segment(190, s::G61, "Contact",
                r::Situational, d::RepeatCount.bounded(3),
                b::Element(e::Situational, "Contact Function Code"),
                b::Element(e::Situational, "Name"),
                b::Element(e::Situational, "Communication Number Qualifier"),
                b::Element(e::Situational, "Communication Number"))),

            d::LoopDef.build("LOOP 0200",
              d::RepeatCount.bounded(10),
              b::Segment(200, s::N7, "Equipment Details",
                r::Required, d::RepeatCount.bounded(1),
                b::Element(e::Situational, "Equipment Number"),
                b::Element(e::Situational, "Equipment Description Code"),
                b::Element(e::Situational, "Equipment Length")),

              b::Segment(208, s::MEA, "Measurements",
                r::Situational, d::RepeatCount.bounded(1),
                b::Element(e::NotUsed, "Composite Unit of Measure"),
                b::Element(e::Situational, "Range Minimum"),
                b::Element(e::Situational, "Range Maximum")),

              b::Segment(210, s::M7, "Seal Numbers",
                r::Situational, d::RepeatCount.bounded(2),
                b::Element(e::Situational, "Seal Number")))),

          d::TableDef.header("Detail",
            d::LoopDef.build("LOOP 0300",
              d::RepeatCount.bounded(999),
              b::Segment(10, s::S5, "Stop Off Details",
                r::Required, d::RepeatCount.bounded(1),
                b::Element(e::Situational, "Stop Sequence Number"),
                b::Element(e::Situational, "Stop Reason Code")),
            
              b::Segment(20, s::L11, "Business Instructions and Reference Number",
                r::Situational, d::RepeatCount.bounded(200),
                b::Element(e::Situational, "Reference Identification"),
                b::Element(e::Situational, "Reference Identification Qualifier")),

              b::Segment(30, s::G62, "Date/Time",
                r::Situational, d::RepeatCount.bounded(2),
                b::Element(e::Situational, "Date Qualifier"),
                b::Element(e::Situational, "Date"),
                b::Element(e::Situational, "Time Qualifier"),
                b::Element(e::Situational, "Time"),
                b::Element(e::Situational, "Time Code")),

              b::Segment(65, s::NTE, "Note/Special Instruction",
                r::Situational, d::RepeatCount.bounded(20),
                b::Element(e::Situational, "Note Reference Code"),
                b::Element(e::Situational, "Description")),

              d::LoopDef.build("LOOP 0310",
                d::RepeatCount.bounded(1),
                b::Segment(70, s::N1, "Name",
                  r::Required, d::RepeatCount.bounded(1),
                  b::Element(e::Required,    "Entity Identifier Code"),
                  b::Element(e::Required,    "Name"),
                  b::Element(e::Situational, "Identification Code Qualifier"),
                  b::Element(e::Situational, "Identification Code")),

                b::Segment(90, s::N3, "Address Information",
                  r::Situational, d::RepeatCount.bounded(2),
                  b::Element(e::Situational, "Address Information"),
                  b::Element(e::Situational, "Address Information")),

                b::Segment(100, s::N4, "Geographic Location",
                  r::Situational, d::RepeatCount.bounded(1),
                  b::Element(e::Situational, "City Name"),
                  b::Element(e::Situational, "State or Province Code"),
                  b::Element(e::Situational, "Postal Code"),
                  b::Element(e::Situational, "Country Code")),

                b::Segment(120, s::G61, "Contact",
                  r::Situational, d::RepeatCount.bounded(3),
                  b::Element(e::Situational, "Contact Function Code"),
                  b::Element(e::Situational, "Name"),
                  b::Element(e::Situational, "Communication Number Qualifier"),
                  b::Element(e::Situational, "Communication Number"))),

              d::LoopDef.build("LOOP 0320",
                d::RepeatCount.bounded(99),
                b::Segment(130, s::L5, "Description, Marks and Numbers",
                  r::Situational, d::RepeatCount.bounded(1),
                  b::Element(e::Situational, "Lading Line Item Number"),
                  b::Element(e::Required,    "Lading Description"),
                  b::Element(e::Situational, "Commodity Code"),
                  b::Element(e::Situational, "Commodity Code Qualifier"),
                  b::Element(e::Situational, "Packaging Code"),
                  b::Element(e::Situational, "Marks and Numbers"),
                  b::Element(e::Situational, "Marks and Numbers Qualifier"),
                  b::Element(e::Situational, "SKU"),
                  b::Element(e::Situational, "SKU Qualifier Code")),
                  
                b::Segment(135, s::AT8, "Shipment Weight, Packaging and Quantity Data",
                  r::Situational, d::RepeatCount.bounded(1),
                  b::Element(e::Required,    "Weight Qualifier"),
                  b::Element(e::Required,    "Weight Unit Code"),
                  b::Element(e::Required,    "Weight"),
                  b::Element(e::Required,    "Lading Quantity"),
                  b::Element(e::Situational, "Lading Quantity"),
                  b::Element(e::Situational, "Volume Unit Qualifier"),
                  b::Element(e::Situational, "Volume")),

                d::LoopDef.build("LOOP 0325",
                  d::RepeatCount.bounded(99),
                  b::Segment(140, s::G61, "Contact",
                    r::Required, d::RepeatCount.bounded(1),
                    b::Element(e::Situational, "Contact Function Code", b::Values("HM")),
                    b::Element(e::Situational, "Name"),
                    b::Element(e::Situational, "Communication Number Qualifier", b::Values("TE")),
                    b::Element(e::Situational, "Communication Number")),

                  b::Segment(141, s::L11, "Business Instructions and Reference Number",
                    r::Situational, d::RepeatCount.bounded(30),
                    b::Element(e::Situational, "Reference Identification"),
                    b::Element(e::Situational, "Reference Identification Qualifier")),

                  d::LoopDef.build("LOOP 0330",
                    d::RepeatCount.bounded(25),
                    b::Segment(143, s::LH1, "Hazardous Identification Information",
                      r::Required, d::RepeatCount.bounded(1),
                      b::Element(e::Required,    "Unit or Basis for Measurement Code"),
                      b::Element(e::Situational, "Lading Quantity"),
                      b::Element(e::Required,    "UN/NA Identification Code"),
                      b::Element(e::Required,    "Packing Group Code")),

                    b::Segment(144, s::LH2, "Hazardous Classification Information",
                      r::Situational, d::RepeatCount.bounded(4),
                      b::Element(e::Required,    "Hazardous Classification"),
                      b::Element(e::Required,    "Hazardous Class Qualifier")),

                    b::Segment(145, s::LH3, "Hazardous Material Shipping Name",
                      r::Situational, d::RepeatCount.bounded(10),
                      b::Element(e::Required,    "Hazardous Material Shipping Name"),
                      b::Element(e::Required,    "Hazardous Material Shipping Name Qualifier")),

                    b::Segment(146, s::LFH, "Freeform Hazardous Material Information",
                      r::Situational, d::RepeatCount.bounded(20),
                      b::Element(e::Required,    "Hazardous Material Shipment Information Qualifier"),
                      b::Element(e::Required,    "Hazardous Material Shipment Information"))))))),

          d::TableDef.header("Summary",
            b::Segment(10, s::L3, "Total Weight and Charges",
              r::Situational, d::RepeatCount.bounded(1),
              b::Element(e::Required,    "Weight"),
              b::Element(e::Required,    "Weight Qualifier"),
              b::Element(e::Situational, "Freight Rate"),
              b::Element(e::Situational, "Rate/Value Qualifier"),
              b::Element(e::Situational, "Charge"),
              b::Element(e::Situational, "Volume"),
              b::Element(e::Situational, "Volume Unit Qualifier"),
              b::Element(e::Situational, "Declared Value"),
              b::Element(e::Situational, "Rate/Value Qualifier")),

            b::Segment(20, s::SE, "Transaction Set Trailer",
              r::Required, d::RepeatCount.bounded(1),
              b::Element(e::Situational, "Number of Included Segments"),
              b::Element(e::Situational, "Transaction Set Control Number"))))

      end
    end
  end
end
