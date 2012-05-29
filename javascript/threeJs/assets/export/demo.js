{

"metadata" :
{
    "formatVersion" : 3,
    "sourceFile"    : "",
    "generatedBy"   : "Blender 2.63 Exporter",
    "objects"       : 1,
    "geometries"    : 1,
    "materials"     : 1,
    "textures"      : 0
},

"type" : "scene",
"urlBaseType" : "relativeToScene",


"objects" :
{
    "Cube" : {
        "geometry"  : "geo_Cube",
        "groups"    : [  ],
        "materials" : [ "Material" ],
        "position"  : [ 0.000000, 0.000000, 0.000000 ],
        "rotation"  : [ 0.000000, -0.000000, 0.000000 ],
        "quaternion": [ 1.000000, 0.000000, 0.000000, 0.000000 ],
        "scale"     : [ 1.000000, 1.000000, 1.000000 ],
        "visible"       : true,
        "castShadow"    : false,
        "receiveShadow" : false,
        "doubleSided"   : false
    }
},


"geometries" :
{
    "geo_Cube" : {
        "type" : "embedded_mesh",
        "id"  : "emb_Cube"
    }
},


"materials" :
{
    "Material" : {
        "type": "MeshLambertMaterial",
        "parameters": { "color": 10724259, "opacity": 1, "blending": "NormalBlending" }
    }
},


"cameras" :
{
    "default_camera" : {
        "type"  : "perspective",
        "fov"   : 60.000000,
        "aspect": 1.333000,
        "near"  : 1.000000,
        "far"   : 10000.000000,
        "position": [ 0.000000, 0.000000, 10.000000 ],
        "target"  : [ 0.000000, 0.000000, 0.000000 ]
    }
},


"lights" :
{
    "default_light": {
        "type"    	 : "directional",
        "direction"	 : [ 0.000000, 1.000000, 1.000000 ],
        "color" 	 : 16777215,
        "intensity"	 : 0.80
    }
},


"embeds" :
{
"emb_Cube": {    "scale" : 1.000000,

    "materials": [	{
	"DbgColor" : 15658734,
	"DbgIndex" : 0,
	"DbgName" : "Material",
	"blending" : "NormalBlending",
	"colorAmbient" : [0.0, 0.0, 0.0],
	"colorDiffuse" : [0.6400000190734865, 0.6400000190734865, 0.6400000190734865],
	"colorSpecular" : [0.5, 0.5, 0.5],
	"depthTest" : true,
	"depthWrite" : true,
	"shading" : "Lambert",
	"specularCoef" : 50,
	"transparency" : 1.0,
	"transparent" : false,
	"vertexColors" : false
	}],

    "vertices": [1.000000,1.000000,-1.000000,1.000000,-1.000000,-1.000000,-1.000000,-1.000000,-1.000000,-1.000000,1.000000,-1.000000,1.000000,0.999999,1.000000,0.999999,-1.000001,1.000000,-1.000000,-1.000000,1.000000,-1.000000,1.000000,1.000000],

    "morphTargets": [],

    "normals": [0.577349,0.577349,-0.577349,0.577349,-0.577349,-0.577349,-0.577349,-0.577349,-0.577349,-0.577349,0.577349,-0.577349,0.577349,0.577349,0.577349,-0.577349,0.577349,0.577349,-0.577349,-0.577349,0.577349,0.577349,-0.577349,0.577349],

    "colors": [],

    "uvs": [[]],

    "faces": [35,0,1,2,3,0,0,1,2,3,35,4,7,6,5,0,4,5,6,7,35,0,4,5,1,0,0,4,7,1,35,1,5,6,2,0,1,7,6,2,35,2,6,7,3,0,2,6,5,3,35,4,0,3,7,0,4,0,3,5]

}
},


"transform" :
{
    "position"  : [ 0.000000, 0.000000, 0.000000 ],
    "rotation"  : [ -1.570796, 0.000000, 0.000000 ],
    "scale"     : [ 1.000000, 1.000000, 1.000000 ]
},

"defaults" :
{
    "bgcolor" : [ 0.000000, 0.000000, 0.000000 ],
    "bgalpha" : 1.000000,
    "camera"  : "default_camera"
}

}
