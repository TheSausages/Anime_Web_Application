package anime.app.forum.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import java.util.Set;
import java.util.UUID;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

@Data
@Entity
@Table(name = "category", schema = "forum")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id", nullable = false, unique = true)
    private UUID categoryId;

    @Column(name = "name", nullable = false, unique = true)
    @Length(max = 45, min = 1, message = "TODO ADD")
    @NotBlank(message = "TODO ADD")
    private String name;

    @Column(name = "description")
    @Length(max = 150, message = "TODO ADD")
    private String description;

    @OneToMany(
        mappedBy = "category",
        fetch = FetchType.LAZY,
        orphanRemoval = true,
        cascade = CascadeType.ALL
    )
    private Set<Thread> threadsWithCategory;
}
