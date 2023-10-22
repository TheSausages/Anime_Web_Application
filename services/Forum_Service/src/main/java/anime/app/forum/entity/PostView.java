package anime.app.forum.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import java.time.Instant;
import java.util.UUID;
import lombok.Data;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.Length;

@Data
@Entity
@Table(name = "post_view", schema = "forum")
public class PostView {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "post_id", nullable = false, unique = true)
    private UUID postId;

    @Column(name = "title", nullable = false, unique = true)
    @Length(max = 45, min = 1, message = "TODO ADD")
    @NotBlank(message = "TODO ADD")
    private String title;

    @Column(name = "text", nullable = false, unique = true)
    @Length(max = 600, min = 1, message = "TODO ADD")
    @NotBlank(message = "TODO ADD")
    private String text;

    @Column(name = "is_blocked", nullable = false)
    @ColumnDefault("false")
    private boolean isBlocked;

    @CreationTimestamp
    @Column(name = "creation")
    private Instant creation;

    @UpdateTimestamp
    @Column(name = "modification")
    private Instant modification;

    @ManyToOne
    @JoinColumn(name = "thread", nullable = false)
    private Thread thread;

    @Column(name = "creator", nullable = false)
    private UUID creator;

    @Column(name = "nr_liked")
    private long nrLiked;

    @Column(name = "nr_disliked")
    private long nrDisliked;

    @Column(name = "nr_reported")
    private long nrReported;
}
