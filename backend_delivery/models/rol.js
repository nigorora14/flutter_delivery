const { none } = require('../config/config');
const db = require('../config/config')

const Rol = {}

Rol.create = (id_user, id_rol) => {
    const sql = `
        INSERT INTO USER_HAS_ROLES(
            ID_USER, ID_ROL, CREATE_AT, UPDATE_AT
        ) VALUES (
            $1, $2, $3, $4
        )`;
        return db.none(sql, [
            id_user,
            id_rol,
            new Date(),
            new Date()
        ]);
}
module.exports = Rol