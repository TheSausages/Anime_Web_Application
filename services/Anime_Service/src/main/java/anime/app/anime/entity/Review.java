package anime.app.anime.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import java.time.Instant;
import java.util.Set;
import java.util.UUID;
import lombok.Data;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.Length;

@Data
@Entity
@Table(name = "review", schema = "anime")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "review_id", nullable = false, unique = true)
    private UUID reviewId;

    @Column(name = "title", nullable = false)
    @Length(max = 100, min = 1, message = "TODO ADD")
    @NotBlank(message = "TODO ADD")
    private String title;

    @Column(name = "text")
    @Length(max = 300, message = "TODO ADD")
    @ColumnDefault("No text given")
    @NotBlank(message = "TODO ADD")
    private String text;

    @CreationTimestamp
    @Column(name = "creation")
    private Instant creation;

    @UpdateTimestamp
    @Column(name = "modification")
    private Instant modification;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "anime_id", nullable = false)
    private Anime anime;

    @OneToMany(
        mappedBy = "review_id",
        fetch = FetchType.LAZY,
        cascade = CascadeType.ALL,
        orphanRemoval = true
    )
    private Set<ReviewOpinion> reviewOpinions;
}
