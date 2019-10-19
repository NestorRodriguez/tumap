import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MatriculaPage } from './matricula.page';

describe('MatriculaPage', () => {
  let component: MatriculaPage;
  let fixture: ComponentFixture<MatriculaPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MatriculaPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MatriculaPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
