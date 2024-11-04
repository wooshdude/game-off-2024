class_name Direction

const FRONT = Vector2i(0,-1)
const BACK = Vector2i(0,1)
const LEFT = Vector2i(-1, 0)
const RIGHT = Vector2i(1,0)

static func rotate(vector: Vector2i, angle: float) -> Vector2i:
    return Vector2i(Vector2(vector).rotated(angle))