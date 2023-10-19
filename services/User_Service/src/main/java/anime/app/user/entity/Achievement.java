package anime.app.user.entity;

import jakarta.persistence.*;
import java.util.Set;
import java.util.UUID;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

@Data
@Entity
@Table(name = "achievement", schema = "users")
public class Achievement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "achievement_id", nullable = false, unique = true)
    private UUID achievementId;

    @Column(name = "name", nullable = false, unique = true)
    @Length(max = 200, message = "TODO ADD")
    private String name;

    @Column(name = "description")
    @Length(max = 600, message = "TODO ADD")
    private String description;

    @Column(name = "icon_path")
    @Length(max = 100, message = "TODO ADD")
    private String iconPath;

    private Integer points;

    @ManyToMany
    @JoinTable(
        schema = "users",
        name = "user_achievement",
        joinColumns = { @JoinColumn(name = "achievement_id") },
        inverseJoinColumns = { @JoinColumn(name = "user_id") }
    )
    private Set<User> usersWithAchievement;
}
