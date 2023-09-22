package anime.app.forum.entity;

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
@Table(name = "thread", schema = "forum")
public class Thread {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "thread_id", nullable = false, unique = true)
    private UUID threadId;

    @Column(name = "title", nullable = false, unique = true)
    @Length(max = 80, min = 1, message = "TODO ADD")
    @NotBlank(message = "TODO ADD")
    private String title;

    @Column(name = "text", nullable = false, unique = true)
    @Length(max = 600, min = 1, message = "TODO ADD")
    @NotBlank(message = "TODO ADD")
    private String text;

    @Column(name = "status", nullable = false)
    @Enumerated(EnumType.STRING)
    @ColumnDefault("CLOSED")
    private ThreadStatus status;

    @CreationTimestamp
    @Column(name = "creation")
    private Instant creation;

    @UpdateTimestamp
    @Column(name = "modification")
    private Instant modification;

    @ManyToOne
    @JoinColumn(name = "category", nullable = false)
    private Category category;

    @Column(name = "creator", nullable = false)
    private UUID creator;

    @ManyToMany
    @JoinTable(
        schema = "forum",
        name = "thread_tags",
        joinColumns = { @JoinColumn(name = "thread_id") },
        inverseJoinColumns = { @JoinColumn(name = "tag_id") }
    )
    private Set<Tag> tags;

    @OneToMany(
        mappedBy = "thread",
        cascade = CascadeType.ALL,
        orphanRemoval = true,
        fetch = FetchType.LAZY
    )
    private Set<Post> posts;

    @OneToMany(
        mappedBy = "threadUserStatusId.thread",
        fetch = FetchType.LAZY,
        cascade = CascadeType.ALL,
        orphanRemoval = true
    )
    private Set<ThreadUserStatus> threadUserStatuses;

    private enum ThreadStatus {
        OPEN,
        CLOSED,
    }
}
