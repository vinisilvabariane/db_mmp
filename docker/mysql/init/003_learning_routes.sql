CREATE TABLE
    IF NOT EXISTS learning_routes (
        id INT NOT NULL AUTO_INCREMENT,
        user_id INT NOT NULL,
        submission_id INT NOT NULL,
        question TEXT NOT NULL,
        metrics_json JSON NOT NULL,
        route_json JSON NOT NULL,
        status VARCHAR(50) NOT NULL DEFAULT 'generated',
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (id),
        KEY idx_learning_routes_user_id (user_id),
        KEY idx_learning_routes_submission_id (submission_id),
        CONSTRAINT fk_learning_routes_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_learning_routes_submission FOREIGN KEY (submission_id) REFERENCES form_submissions (id) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
