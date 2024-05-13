/*
** EPITECH PROJECT, 2024
** raytracer
** File description:
** cone.cpp
*/

#include "cone.hpp"



namespace raytracer {
    bool Cone::hit(const rtx::ray &r, HitData &data, rtx::range rayRange) const
    {
        rtx::vec3 oc = r._origin - _position;
        float k = _radius / _height;
        k = k * k;
        float a = r._direction.x * r._direction.x + r._direction.z * r._direction.z - k * r._direction.y * r._direction.y;
        float b = 2 * (r._direction.x * oc.x + r._direction.z * oc.z - k * r._direction.y * (oc.y - _height));
        float c = oc.x * oc.x + oc.z * oc.z - k * (oc.y - _height) * (oc.y - _height);
        float discriminant = b * b - 4 * a * c;

        if (discriminant < 0)
            return false;
        float root = (-b - sqrt(discriminant)) / (2 * a);
        if (root < rayRange._min || root > rayRange._max) {
            root = (-b + sqrt(discriminant)) / (2 * a);
            if (root < rayRange._min || root > rayRange._max)
                return false;
        }
        data.t = root;
        data.p = r.at(data.t);
        // Check if the intersection point is within the height of the cone
        if (data.p.y < _position.y || data.p.y > _position.y + _height)
            return false;
        data.normal = (data.p - rtx::point3(_position.x, data.p.y, _position.z)) / _radius;
        data.mat = _mat;
        return true;
    }
}

extern "C" {
    raytracer::IPrimitive *factory(raytracer::Object &object, std::vector<std::shared_ptr<raytracer::IMaterial>> materials)
    {
        std::cout << "Creating cone" << std::endl;
        rtx::vec3 position;
        float radius = 1;
        float height = 1;
        std::shared_ptr<raytracer::IMaterial> mat = std::make_shared<raytracer::DefaultMaterial>();

        try {
            position = rtx::point3::stov3(object.getParam("position"));
        } catch (const std::exception &e) {
            position = rtx::point3(0, 0, 0);
        }
        try {
            radius = std::stof(object.getParam("radius"));
        } catch (const std::exception &e) {
            radius = 1;
        }
        try {
            height = std::stof(object.getParam("height"));
        } catch (const std::exception &e) {
            height = 1;
        }
        try {
            std::string coneName = object.getParam("material");
            for (auto &mat_ : materials) {
                if (mat_->getName() == coneName) {
                    mat = mat_;
                    break;
                }
            }
        } catch (const std::exception &e) {
            std::cout << "No material found: " << object.getParam("material") << std::endl;
        }

        return new raytracer::Cone(position, radius, height, mat);
    }
    std::string getName()
    {
        return "cone";
    }
}