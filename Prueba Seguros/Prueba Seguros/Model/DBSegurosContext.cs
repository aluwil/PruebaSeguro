using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Prueba_Seguros.Model
{
    public partial class DBSegurosContext : DbContext
    {
        public DBSegurosContext()
        {
        }

        public DBSegurosContext(DbContextOptions<DBSegurosContext> options) : base(options)
        {
        }

        public virtual DbSet<Agencia> Agencia { get; set; }
        public virtual DbSet<Cliente> Cliente { get; set; }
        public virtual DbSet<CoberturaPorcentaje> CoberturaPorcentaje { get; set; }
        public virtual DbSet<EmisionPoliza> EmisionPoliza { get; set; }
        public virtual DbSet<EstadoPoliza> EstadoPoliza { get; set; }
        public virtual DbSet<Riesgo> Riesgo { get; set; }
        public virtual DbSet<TipoPoliza> TipoPoliza { get; set; }

        //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //{
        //    if (!optionsBuilder.IsConfigured)
        //    {
        //        //optionsBuilder.UseSqlServer("Server=DESKTOP_DF01\\SQLEXPRESS;Database=DBSeguros; User ID=sa;Password=123456");
        //    }
        //}

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.2-servicing-10034");

            modelBuilder.Entity<Agencia>(entity =>
            {
                entity.HasKey(e => e.IdAgencia)
                    .HasName("PK__Agencia__00863C7DCAB3F8BA");

                entity.Property(e => e.IdAgencia).ValueGeneratedNever();

                entity.Property(e => e.Direccion)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.Property(e => e.Telefono)
                    .IsRequired()
                    .HasMaxLength(150);
            });

            modelBuilder.Entity<Cliente>(entity =>
            {
                entity.HasKey(e => e.IdCliente)
                    .HasName("PK__Cliente__D5946642BC442701");

                entity.Property(e => e.IdCliente).ValueGeneratedNever();

                entity.Property(e => e.Apellidos)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.Property(e => e.Nombres)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.Property(e => e.Telefono)
                    .IsRequired()
                    .HasMaxLength(20);
            });

            modelBuilder.Entity<CoberturaPorcentaje>(entity =>
            {
                entity.HasKey(e => e.IdCoberturaPorcentaje)
                    .HasName("PK__Cobertur__92A65692CA1DC700");
            });

            modelBuilder.Entity<EmisionPoliza>(entity =>
            {
                entity.HasKey(e => e.IdEmisionPoliza)
                    .HasName("PK__EmisionP__D7C4A988A42775C4");

                entity.Property(e => e.IdEmisionPoliza).ValueGeneratedNever();

                entity.Property(e => e.InicioVigencia).HasColumnType("datetime");

                entity.HasOne(d => d.IdClienteNavigation)
                    .WithMany(p => p.EmisionPoliza)
                    .HasForeignKey(d => d.IdCliente)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EmisionPoliza_Cliente");

                entity.HasOne(d => d.IdCoberturaPorcentajeNavigation)
                    .WithMany(p => p.EmisionPoliza)
                    .HasForeignKey(d => d.IdCoberturaPorcentaje)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EmisionPoliza_CoberturaPorcentaje");

                entity.HasOne(d => d.IdEstadoPolizaNavigation)
                    .WithMany(p => p.EmisionPoliza)
                    .HasForeignKey(d => d.IdEstadoPoliza)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EmisionPoliza_EstadoPoliza");

                entity.HasOne(d => d.IdRiesgoNavigation)
                    .WithMany(p => p.EmisionPoliza)
                    .HasForeignKey(d => d.IdRiesgo)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EmisionPoliza_Riesgo");

                entity.HasOne(d => d.IdTipoPolizaNavigation)
                    .WithMany(p => p.EmisionPoliza)
                    .HasForeignKey(d => d.IdTipoPoliza)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EmisionPoliza_TipoPoliza");
            });

            modelBuilder.Entity<EstadoPoliza>(entity =>
            {
                entity.HasKey(e => e.IdEstadoPoliza)
                    .HasName("PK__EstadoPo__6B580FCD841BA9E5");

                entity.Property(e => e.Descripon)
                    .IsRequired()
                    .HasMaxLength(150);
            });

            modelBuilder.Entity<Riesgo>(entity =>
            {
                entity.HasKey(e => e.IdRiesgo)
                    .HasName("PK__Riesgo__5D67278815E6AE98");

                entity.Property(e => e.Descripcion)
                    .IsRequired()
                    .HasMaxLength(150);
            });

            modelBuilder.Entity<TipoPoliza>(entity =>
            {
                entity.HasKey(e => e.IdTipoPoliza)
                    .HasName("PK__TipoPoli__1BF2E5A7412FC491");

                entity.Property(e => e.Descripcion)
                    .IsRequired()
                    .HasMaxLength(150);
            });
        }
    }
}
