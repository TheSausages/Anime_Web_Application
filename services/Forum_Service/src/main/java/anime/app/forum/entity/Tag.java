package anime.app.forum.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import java.util.Set;
import java.util.UUID;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

@Data
@Entity
@Table(name = "tag", schema = "forum")
public class Tag {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tag_id", nullable = false, unique = true)
    private UUID tagId;

    @Column(name = "name", nullable = false, unique = true)
    @Length(max = 45, min = 1, message = "TODO ADD")
    @NotBlank(message = "TODO ADD")
    private String name;

    @Column(name = "importance", nullable = false)
    @Enumerated(EnumType.STRING)
    private TagImportance importance;

    @Column(name = "color")
    @Length(max = 18, message = "TODO ADD")
    @Pattern(
        regexp = "rgb\\((\\d{1,3}), (\\d{1,3}), (\\d{1,3})\\)",
        message = "TODO ADD"
    )
    private String color;

    @ManyToMany(mappedBy = "tags")
    private Set<Thread> threadsWithTag;

    public enum TagImportance {
        LOW,
        MEDIUM,
        HIGH,
        ADMIN,
    }
}
