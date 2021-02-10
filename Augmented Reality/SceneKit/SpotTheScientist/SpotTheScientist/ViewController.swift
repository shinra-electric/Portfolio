//
//  ViewController.swift
//  SpotTheScientist
//
//  Created by シェイミ on 10/02/2021.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var scientists = [String: Scientist]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        loadData()
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        // Changed from ARWorldTrackingConfiguration()
        // WorldTracking is more for placing 3D objects in real space
        let configuration = ARImageTrackingConfiguration()
        
        // Load the AR Asset images
        guard let trackingImages = ARReferenceImage.referenceImages(inGroupNamed: "scientists", bundle: nil) else {
            fatalError("Couldn't load tracking images")
        }
        //Assign the images to the tracking configuration
        configuration.trackingImages = trackingImages

        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // To test: Colour the picture blue
    // NodeFor. Here is the renderer, here's an anchor, what's the node for the anchor?
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        // Try to convert the ARAnchor to an Image anchor
        guard let imageAnchor = anchor as? ARImageAnchor else { return nil }
        // Try to get the name of the image
        guard let name = imageAnchor.referenceImage.name else { return nil }
        guard let scientist = scientists[name] else { return nil }
        
        
        // Make a SceneKit 2d plane placed somewhere in the scene
        // We want the node to match the dimensions of the image.
        let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
        // Colour the plane blue (Testing only. Contents is very flexible as to what it takes
        plane.firstMaterial?.diffuse.contents = UIColor.clear
        
        // We want to wrap the plane into a node, and then we can move the node around the screen
        // Basically create an image view with our image inside it
        let planeNode = SCNNode(geometry: plane)
        planeNode.eulerAngles.x = -.pi / 2
        
        // The plane node can be angled first, and then attached to a new node that can be moved up/down/left/right at the anchor point.
        let node = SCNNode()
        node.addChildNode(planeNode)
        
        // Small number is because SceneKit loves metres
        let spacing: Float = 0.005
        
        // Title node
        let titleNode = textNode(scientist.name, font: UIFont.boldSystemFont(ofSize: 10))
        titleNode.pivotOnTopLeft()

        titleNode.position.x += Float(plane.width / 2) + spacing
        titleNode.position.y += Float(plane.height / 2)
        
        planeNode.addChildNode(titleNode)
        
        // Biography node
        let bioNode = textNode(scientist.bio, font: UIFont.systemFont(ofSize: 4), maxWidth: 100)
        bioNode.pivotOnTopLeft()
        bioNode.position.x += Float(plane.width / 2) + spacing
        bioNode.position.y = titleNode.position.y - titleNode.height - spacing
        planeNode.addChildNode(bioNode)
        
        // Flags
        let flag = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.width / 8 * 5)
        flag.firstMaterial?.diffuse.contents = UIImage(named: scientist.country)
        
        let flagNode = SCNNode(geometry: flag)
        flagNode.pivotOnTopCenter()
        
        flagNode.position.y -= Float(plane.height / 2) + spacing
        planeNode.addChildNode(flagNode)
        
        return node
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "scientists", withExtension: "json") else {
            fatalError("Unable to find JSON in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to load JSON")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedScientists = try? decoder.decode([String: Scientist].self, from: data) else {
            fatalError("Unable to parse JSON")
        }
        
        scientists = loadedScientists
    }
    
    // Helper method for the text geometry
    func textNode(_ str: String, font: UIFont, maxWidth: Int? = nil) -> SCNNode {
        let text = SCNText(string: str, extrusionDepth: 0)
        
        // .flatness is how smooth the curves whould be
        text.flatness = 0.1
        text.font = font
        
        if let maxWidth = maxWidth {
            text.containerFrame = CGRect(origin: .zero, size: CGSize(width: maxWidth, height: 500))
            text.isWrapped = true
        }
        
        let textNode = SCNNode(geometry: text)
        textNode.scale = SCNVector3(0.002, 0.002, 0.002)
        
        return textNode
    }
}

// Create a couple of extensions.


// By default SceneKit positions things in their centre, this extension is to make placement easier
extension SCNNode {
    var width: Float {
        return (boundingBox.max.x - boundingBox.min.x) * scale.x
    }
    var height: Float {
        return (boundingBox.max.y - boundingBox.min.y) * scale.y
    }
    
    func pivotOnTopLeft() {
        let (min, max) = boundingBox
        pivot = SCNMatrix4MakeTranslation(min.x, max.y, 0)
    }
    
    func pivotOnTopCenter() {
        let (min, max) = boundingBox
        pivot = SCNMatrix4MakeTranslation((max.x - min.x) / 2 + min.x, max.y, 0)
    }
}

