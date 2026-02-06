extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	velocity = Vector2(200,-150)
	


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	#Creates a Kinematics2D object called collision
	
	if collision:
		#position.x = position.x + (velocity.x * delta);
		#velocity = velocity.bounce(collision.get_normal())
		#get_normal gets the normal against a plane (orthogonal unit vector)
		#bounce just works here but I shouldn't just rely on Godot's methods.
		
		var direction = collision.get_normal()
		if direction.y != 0:
			velocity.y *= -1
		
		elif direction.x != 0:
			velocity.x *= -1;
			
		#modulate = Color.from_rgb8(randi_range(0,255), randi_range(0,255), randi_range(0,255))
		modulate = Color.from_hsv(randf_range(0,1), 0.5, 1.0)
