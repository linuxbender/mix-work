import bpy
 
 
def CreatMixShader(NodeTree,x,y,fac):
    MixShader = NodeTree.nodes.new('MIX_SHADER')
    MixShader.location = [x,y]
    for NodeSocket in MixShader.inputs:
        if NodeSocket.name == 'Fac':
            NodeSocket.default_value = fac
            print('found')
    return MixShader
 
def CreateDotProductNormalNodes(NodeTree,x,y):
   #Dot Poduct Nodes
    Geometry = NodeTree.nodes.new('NEW_GEOMETRY')
    Geometry.location = [-550-x,y]
    MathLessThan = NodeTree.nodes.new('MATH')
    MathLessThan.location = [-200-x,y]
    MathLessThan.operation = 'LESS_THAN'
    MathLessThan.inputs[1].default_value = .65
    MathDProduct = NodeTree.nodes.new('VECT_MATH')
    MathDProduct.location = [-350-x,y]
    MathDProduct.operation = 'DOT_PRODUCT' 
    MathDProduct.inputs[1].default_value = [0,0,1]
    MathAdd1 = NodeTree.nodes.new('MATH')
    MathAdd1.location = [-x,y]
    MathAdd1.operation = 'ADD'
    MathAdd1.inputs[1].default_value = .189
 
    NodeTree.links.new(MathDProduct.inputs[0],Geometry.outputs[1])
    NodeTree.links.new(MathLessThan.inputs[0],MathDProduct.outputs[1])
    NodeTree.links.new(MathAdd1.inputs[0],MathLessThan.outputs[0])
 
    return MathAdd1.outputs[0]   
 
def CreateRockTextureNodes(NodeTree,x,y):
    #Rock Texture
    Geometry1 = NodeTree.nodes.new('NEW_GEOMETRY')
    Geometry1.location = [x-180,y-110]
    Mapping = NodeTree.nodes.new('MAPPING')
    Mapping.scale = [1,.8,1]
    NoiseTex = NodeTree.nodes.new('TEX_NOISE')
    NoiseTex.location = [x+407,y-81]
    NoiseTex.inputs[1].default_value = 10.548
    NoiseTex.inputs[2].default_value = 4
    NoiseTex.inputs[3].default_value = .1
    MathMultiply1 = NodeTree.nodes.new('MATH')
    MathMultiply1.location = [x+600,y-91]
    MathMultiply1.operation = 'POWER'
    MathMultiply1.inputs[1].default_value = .01  
 
    NodeTree.links.new(Mapping.inputs[0],Geometry1.outputs[0])
    NodeTree.links.new(NoiseTex.inputs[0],Mapping.outputs[0])
    NodeTree.links.new(MathMultiply1.inputs[0],NoiseTex.outputs[1])
 
    TexCoord1 = NodeTree.nodes.new('TEX_COORD')
    TexCoord1.location = [x-180,y-310]
    Mapping1 = NodeTree.nodes.new('MAPPING')
    Mapping1.scale = [1,.8,.1]
    NoiseTex1 = NodeTree.nodes.new('TEX_NOISE')
    NoiseTex1.location = [x+407,y-310]
    NoiseTex1.inputs[1].default_value = 15
    NoiseTex1.inputs[2].default_value = 7
    NoiseTex1.inputs[3].default_value = .1
    MathMultiply2 = NodeTree.nodes.new('MATH')
    MathMultiply2.location = [x+600,y-310]
    MathMultiply2.operation = 'MULTIPLY'
    MathMultiply2.inputs[1].default_value = 12.33 
 
    NodeTree.links.new(Mapping1.inputs[0],TexCoord1.outputs[0])
    NodeTree.links.new(NoiseTex1.inputs[0],Mapping1.outputs[0])
    NodeTree.links.new(MathMultiply2.inputs[0],NoiseTex1.outputs[1])
 
    MathMultiply3 = NodeTree.nodes.new('MATH')
    MathMultiply3.location = [x+800,y-210]
    MathMultiply3.operation = 'MULTIPLY'
 
    NodeTree.links.new(MathMultiply3.inputs[1],MathMultiply2.outputs[0])
    NodeTree.links.new(MathMultiply3.inputs[0],MathMultiply1.outputs[0])
 
    return MathMultiply3.outputs[0]
 
def CreateSnowShader(NodeTree,x,y):
    #Snow Shaders
    MixShader2 = CreatMixShader(SnowNodes,-276,708,.3)
    Diffuse2 = SnowNodes.nodes.new('BSDF_DIFFUSE')
    Diffuse2.location = [-516,745] 
    Diffuse2.inputs[1].default_value = .336
    Velvet1 = SnowNodes.nodes.new('BSDF_VELVET')
    Velvet1.location = [-516,626]
 
    SnowNodes.links.new(MixShader2.inputs[1],Diffuse2.outputs[0])
    SnowNodes.links.new(MixShader2.inputs[2],Velvet1.outputs[0])
 
    return MixShader2.outputs[0]
 
CreateNodes = True
#scene = bpy.context.scene
#bpy.data.materials.new("ANT_SnowyMountain")
 
MatObj = bpy.context.active_object
 
#bpy.ops.object.material_slot_add()
 
mesh = MatObj.data
 
#print(bpy.context.material)
CreateSnowMat = True
for Mat in bpy.data.materials:
    print(Mat.name)
    #if Mat.name == 'GoldenMaterial':
    if Mat.name == 'ANT_SnowyMountain':
        print("Mat Found")
        CreateSnowMat = False
        SnowMat = Mat
 
if CreateSnowMat == True:
    SnowMat = bpy.data.materials.new("ANT_SnowyMountain")
 
if len(MatObj.material_slots) == 0:
    bpy.ops.object.material_slot_add()
 
Slot = MatObj.material_slots[0]
Slot.material = SnowMat
 
SnowMat.use_nodes = True
 
SnowNodes = SnowMat.node_tree
 
for Node in SnowNodes.nodes:
    print(Node.name)
    print(Node.location)
 
if CreateNodes == True:
    SnowNodes.nodes.clear()
 
    SnowOut = CreateSnowShader(SnowNodes,0,0)
 
    for NGroup in bpy.data.node_groups:
        print(NGroup.name)
    #Dot Poduct Nodes
    OutNode1 = CreateDotProductNormalNodes(SnowNodes,550,400)
 
     #Dot Poduct Nodes Had to create two of these because of
     #python bug that doesn't let you tie two inputs to one output!
    OutNode2 = CreateDotProductNormalNodes(SnowNodes,550,100)
 
    #Create Rock Texture Nodes
    RockTexOutNode = CreateRockTextureNodes(SnowNodes,0,0)
 
    #Dot Product Texture Mix to Displacement
    MathMultiply2 = SnowNodes.nodes.new('MATH')
    MathMultiply2.location = [1300,34]
    MathMultiply2.operation = 'MULTIPLY'  
    MathMultiply2.inputs[1].default_value = 1.25
    MathPower = SnowNodes.nodes.new('MATH')
    MathPower.location = [1000,0]
    MathPower.operation = 'POWER'
 
    #SnowNodes.links.new(MathMultiply2.inputs[0],MathAdd1.outputs[0])
    SnowNodes.links.new(MathPower.inputs[0],RockTexOutNode) 
    SnowNodes.links.new(MathPower.inputs[1],OutNode2)   
 
    #Tie them All Together
    Diffuse1 = SnowNodes.nodes.new('BSDF_DIFFUSE')
    Diffuse1.location = [1000,266]
    Diffuse1.inputs[0].default_value = [.15,.15,.15,1]
    Diffuse1.inputs[1].default_value = .336
    Output = SnowNodes.nodes.new('OUTPUT_MATERIAL')
    Output.location = [1600,325]
    MixShader1 = CreatMixShader(SnowNodes,1200,349,.4)
 
    SnowNodes.links.new(MixShader1.inputs[1],SnowOut)
    SnowNodes.links.new(MixShader1.inputs[2],Diffuse1.outputs[0])  
    SnowNodes.links.new(Output.inputs[0],MixShader1.outputs[0]) 
    SnowNodes.links.new(MixShader1.inputs[0],OutNode1)   
    SnowNodes.links.new(Output.inputs[2],MathMultiply2.outputs[0])  
    SnowNodes.links.new(MathMultiply2.inputs[0],MathPower.outputs[0])
