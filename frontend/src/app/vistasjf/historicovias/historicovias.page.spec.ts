import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HistoricoviasPage } from './historicovias.page';

describe('HistoricoviasPage', () => {
  let component: HistoricoviasPage;
  let fixture: ComponentFixture<HistoricoviasPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HistoricoviasPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HistoricoviasPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
