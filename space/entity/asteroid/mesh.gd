extends MeshInstance3D

@export var deform_size := .15

func _ready():
	var tmp_mesh = ArrayMesh.new()
	var material = mesh.surface_get_material(0)
	tmp_mesh.add_surface_from_arrays(
		Mesh.PRIMITIVE_TRIANGLES,
		mesh.get_mesh_arrays(),
	)
	var mdt = MeshDataTool.new()
	mdt.create_from_surface(tmp_mesh, 0)
	for i in range(mdt.get_vertex_count()):
		var vertex = mdt.get_vertex(i)
		# In this example we extend the mesh by one unit, which results in separated faces as it is flat shaded.
		vertex += mdt.get_vertex_normal(i) * randf_range(
			0,
			deform_size,
		)
		# Save your change.
		mdt.set_vertex(i, vertex)
	tmp_mesh.clear_surfaces()
	mdt.commit_to_surface(tmp_mesh)
	tmp_mesh.surface_set_material(0, material)
	mesh = tmp_mesh
