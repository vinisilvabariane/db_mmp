INSERT INTO roles (name, active)
SELECT 'admin', 1
WHERE NOT EXISTS (
    SELECT 1 FROM roles WHERE name = 'admin'
);

INSERT INTO roles (name, active)
SELECT 'user', 1
WHERE NOT EXISTS (
    SELECT 1 FROM roles WHERE name = 'user'
);

INSERT INTO metrics (metric_key, name, description, active)
SELECT 'risk_score', 'Risk Score', 'Indice agregado de risco academico.', 1
WHERE NOT EXISTS (
    SELECT 1 FROM metrics WHERE metric_key = 'risk_score'
);

INSERT INTO metrics (metric_key, name, description, active)
SELECT 'general_readiness_score', 'General Readiness Score', 'Prontidao geral para trilhas e componentes.', 1
WHERE NOT EXISTS (
    SELECT 1 FROM metrics WHERE metric_key = 'general_readiness_score'
);

INSERT INTO metrics (metric_key, name, description, active)
SELECT 'mathematical_foundation_score', 'Mathematical Foundation Score', 'Base matematica declarada e inferida.', 1
WHERE NOT EXISTS (
    SELECT 1 FROM metrics WHERE metric_key = 'mathematical_foundation_score'
);

INSERT INTO metrics (metric_key, name, description, active)
SELECT 'autonomy_score', 'Autonomy Score', 'Nivel de autonomia do estudante.', 1
WHERE NOT EXISTS (
    SELECT 1 FROM metrics WHERE metric_key = 'autonomy_score'
);

INSERT INTO users (email, password_hash, full_name, role_id, session_id, is_active, reset_required)
SELECT
    'vinisilvabariane10@gmail.com',
    '$2y$10$1oOqt4o/k/zYds34tR58v.4KdFodp3G4iijXJbS0tGaNEHtYmU/wW',
    'Administrador',
    roles.id,
    NULL,
    1,
    0
FROM roles
WHERE roles.name = 'admin'
  AND NOT EXISTS (
      SELECT 1 FROM users WHERE email = 'vinisilvabariane10@gmail.com'
  );
