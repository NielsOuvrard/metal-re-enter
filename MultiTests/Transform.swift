//
//  Transform.swift
//  MultiTests
//
//  Created by Niels Ouvrard on 17/03/2025.
//

struct Transform {
    var position: float3 = [0, 0, 0]
    var rotation: float3 = [0, 0, 0]
    var scale: Float = 1
}

extension Transform {
    var modelMatrix: matrix_float4x4 {
        let translation = float4x4(translation: position)
        let rotation = float4x4(rotation: rotation)
        let scale = float4x4(scaling: scale)
        let modelMatrix = translation * rotation * scale
        return modelMatrix
    }
}

// protocol = blueprint of methods, properties, and other
// in c++, this is called an abstract class
protocol Transformable {
    var transform: Transform { get set }
}

// avoid having to write:
// - model.transform.position
// and instead write:
// - model.position
extension Transformable {
    var position: float3 {
        get { transform.position }
        set { transform.position = newValue }
    }
    var rotation: float3 {
        get { transform.rotation }
        set { transform.rotation = newValue }
    }
    var scale: Float {
        get { transform.scale }
        set { transform.scale = newValue }
    }
}
