//
//  NumericExtension.swift
//  SwiftUIClima
//
//  Created by Antonio Casto on 24/06/23.
//

import Foundation

extension Double {
    
    ///  This method converts a Double speed number in the correct String number using the proper unit measure.
    ///  Applies a unit measure convertion if specified.
    func formatSpeedWith(unit: UnitSpeed, useFractionDigits: Bool = true, convertTo: UnitSpeed? = nil) -> String {
                        
        formatMeasureWith(unit: unit, useFractionDigits: useFractionDigits, convertTo: convertTo)
        
    }
    
    ///  This method converts a Double lenght number in the correct String number using the proper unit measure.
    ///  Applies a unit measure convertion if specified.
    func formatLenghtWith(unit: UnitLength, useFractionDigits: Bool = true, convertTo: UnitLength? = nil) -> String {
                        
        formatMeasureWith(unit: unit, useFractionDigits: useFractionDigits, convertTo: convertTo)
        
    }
    
    ///  This method converts a Double temperature number in the correct String number using the proper unit measure.
    ///  Applies a unit measure convertion if specified.
    func formatTemperatureWith(unit: UnitTemperature, useFractionDigits: Bool = true, convertTo: UnitTemperature? = nil) -> String {
                        
        formatMeasureWith(unit: unit, useFractionDigits: useFractionDigits, convertTo: convertTo)
        
    }
    
    ///  This method converts a Dimension in the correct String number using the proper unit measure.
    ///  Applies a unit measure convertion if specified.
    private func formatMeasureWith(unit: Dimension, useFractionDigits: Bool = true, convertTo: Dimension? = nil) -> String {
                        
        var measurement = Measurement(value: self, unit: unit)
        
        if let newMeasure = convertTo {
            
            measurement = measurement.converted(to: newMeasure)
            
        }
        
        
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        
        if !useFractionDigits {
            formatter.numberFormatter.maximumFractionDigits = 0
        }
        
        return formatter.string(from: measurement)
        
    }
        
}
