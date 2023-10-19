package anime.app.user.entity;

import jakarta.persistence.*;
import java.util.Set;
import java.util.UUID;
import lombok.Data;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.validator.constraints.Length;

@Data
@Entity
@Table(name = "user", schema = "users")
public class User {

    @Id
    @Column(name = "user_id", nullable = false, unique = true)
    private UUID userId;

    @Column(name = "username", nullable = false, unique = true)
    @Length(max = 45, message = "TODO ADD")
    private String username;

    @Column(name = "preferred_color_mode", nullable = false)
    @Enumerated(EnumType.STRING)
    @ColumnDefault("DARK")
    private Mode preferredColorMode;

    @Column(name = "preferred_language", nullable = false)
    @Enumerated(EnumType.STRING)
    @ColumnDefault("ENGLISH")
    private Language preferredLanguage;

    @ManyToMany(mappedBy = "usersWithAchievement")
    private Set<Achievement> achievements;

    public enum Mode {
        LIGHT,
        DARK,
    }

    public enum Language {
        ENGLISH,
        POLISH,
    }
}
